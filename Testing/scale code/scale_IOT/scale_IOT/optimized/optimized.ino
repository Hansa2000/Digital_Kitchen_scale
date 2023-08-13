#include <Arduino.h>
#include "HX711.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <logo.h>
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#if defined(ESP32)
  #include <WiFi.h>
#elif defined(ESP8266)
  #include <ESP8266WiFi.h>
#endif
#include <Firebase_ESP_Client.h>

//Provide the token generation process info.
#include "addons/TokenHelper.h"
//Provide the RTDB payload printing info and other helper functions.
#include "addons/RTDBHelper.h"

// Insert your network credentials
#define WIFI_SSID "OPPO A5 2020"
#define WIFI_PASSWORD "12345678"

// Insert Firebase project API Key
#define API_KEY "AIzaSyBzWWLQnqViUEYKUp5fx_aXHsadgWly_YQ"

// Insert RTDB URLefine the RTDB URL */
#define DATABASE_URL "https://digitalkitchenscale-3af0b-default-rtdb.asia-southeast1.firebasedatabase.app/" 

//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// HX711 circuit wiring
const int LOADCELL_DOUT_PIN = 12;
const int LOADCELL_SCK_PIN = 13;

HX711 scale;
int reading;
int lastReading;
//REPLACE WITH YOUR CALIBRATION FACTOR
#define CALIBRATION_FACTOR -478.507

//OLED Display
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels


// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

//Button
#define BUTTON_PIN 15
//Pushbutton button(BUTTON_PIN);
int currentState = 0;
int buttonPressed = 0;
long pressedTime;
long releasedTime;


//Button short press and long press
const int SHORT_PRESS_TIME = 500; // 500 milliseconds

//unit changing
int unit = 0; // 0 for grams and 1 for ounces

//sleep mode
int change = 1;
int timmer = 0;
long beginTime;
long currentTime;
const int TIMEOUT = 60000; 


void displayWeight(int weight){
  display.clearDisplay();
  display.setTextColor(WHITE);
  // Display static text
  //display.setTextSize(1);
  //display.setCursor(0, 10);
  //display.println("unit:");
  //display.println(unit);
  //display.display();
  display.setCursor(24, 20);
  if(!unit) { display.setTextSize(3); display.print(weight);}
  else {display.setTextSize(2); display.print(weight*0.035274);}
  display.display(); 
  //display.print(" ");
  display.setTextSize(4);
  display.setCursor(96, 20);
  if(!unit) display.print("g");
  else{ display.setCursor(80, 20); display.setTextSize(3); display.print("oz");}
  display.display();  
}

void setup() {
  Serial.begin(115200);
  display.clearDisplay();
  display.drawBitmap(0, 0, logoPC, 128, 64, 1);
  display.display();
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { 
    Serial.println(F("SSD1306 allocation failed"));
    for(;;);
  }
  //delay(2000);
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Sign up */
  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  }
  else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h
  
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
  display.setTextColor(WHITE);
  
  Serial.println("Initializing the scale");
  scale.begin(LOADCELL_DOUT_PIN, LOADCELL_SCK_PIN);

  scale.set_scale(-518);   // this value is obtained by calibrating the scale with known weights
  scale.tare();               // reset the scale to 0
  pinMode(BUTTON_PIN,INPUT);
  
}

void loop() {

  //Serial.println(button.getSingleDebouncedPress());
  buttonPressed = digitalRead(BUTTON_PIN);
  if (buttonPressed && !currentState){
     pressedTime = millis();
     currentState = HIGH;
  }
  else if(!buttonPressed && currentState){
    releasedTime = millis();
    currentState = LOW;
    // check whether the press is short or long and tare or change unit accordingly
    long pressDuration = releasedTime - pressedTime;
     //Serial.print("Button Pressed time: ");
      //Serial.print(pressDuration);
    if( pressDuration < SHORT_PRESS_TIME ){
      //Serial.print("tare...");
      //Serial.read();
      scale.tare();
    }
    else{
      if(unit) unit = 0;
      else unit = 1;
      displayWeight(reading);
    }
    
  }
  

  if (scale.wait_ready_timeout(200)) {
    reading = round(scale.get_units());
    //Serial.print("Weight: ");
    //Serial.println(reading);
    if (reading != lastReading){
      displayWeight(reading);
      change=1; 
    }
    else change=0;
    
    lastReading = reading;
    
    if(change) {timmer=0;}
    else if(!change && !timmer){ timmer=1; beginTime = millis();}
    else if(!change && timmer) { 
       currentTime = millis(); 
       if(currentTime-beginTime>TIMEOUT){ 
        display.clearDisplay();
        display.display();
        ESP.deepSleep(0);
        
        }
    }
    
    
  }
  else {
    Serial.println("HX711 not found.");
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 500 || sendDataPrevMillis == 0)){
    sendDataPrevMillis = millis();
    // Write an Int number on the database path test/int
    Firebase.RTDB.setInt(&fbdo, "test/int", count);
    /*
    if (Firebase.RTDB.setInt(&fbdo, "test/int", count)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }*/
    count++;
    
    // Write an Float number on the database path test/float
    Firebase.RTDB.setFloat(&fbdo, "test/float", reading); 
    /*
    if (Firebase.RTDB.setFloat(&fbdo, "test/float", reading)){
      Serial.println("PASSED");
      Serial.println("PATH: " + fbdo.dataPath());
      Serial.println("TYPE: " + fbdo.dataType());
    }
    else {
      Serial.println("FAILED");
      Serial.println("REASON: " + fbdo.errorReason());
    }*/
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
