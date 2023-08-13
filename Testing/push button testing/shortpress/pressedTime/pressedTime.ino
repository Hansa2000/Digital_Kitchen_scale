
#include <Arduino.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
//#include <Pushbutton.h>

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
const int SHORT_PRESS_TIME = 100; // 500 milliseconds

void   displayTimePressed(long pressDuration ){
  display.clearDisplay();
  display.setTextColor(WHITE);
  display.setCursor(24, 20);
  display.setTextSize(3); 
  display.print(pressDuration);
  display.display(); 
}

void setup() {
  Serial.begin(115200);

  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { 
    Serial.println(F("SSD1306 allocation failed"));
    for(;;);
  }
  delay(2000);
  display.clearDisplay();
  display.setTextColor(WHITE);
  
  Serial.println("Initializing........");
}

void loop() {
  buttonPressed = digitalRead(BUTTON_PIN);
  Serial.println(buttonPressed);
  /*
  if (buttonPressed==HIGH){
     pressedTime = millis();
     currentState = HIGH;
     delay(100);
  }
  else if(buttonPressed==LOW && currentState==HIGH){
    releasedTime = millis();
    currentState = LOW;
    // check whether the press is short or long and tare or change unit accordingly
    long pressDuration = releasedTime - pressedTime;
    Serial.println("releasedTime:");
    Serial.println(releasedTime);
    Serial.println("pressedTime");
    Serial.println(pressedTime);
    Serial.println(pressDuration);
    displayTimePressed( pressDuration );
 
  }
  */
  
}
