# Precision Chef: Smart Digital Kitchen Scale

This project started as a **newbie exploration** into automating calorie tracking using a smart kitchen scale. The goal was to demonstrate the concept of integrating weight measurement with connectivity to enable calorie tracking automation. While this is an initial prototype, it lays the foundation for a broader system that will require additional supporting hardware to fully realize its potential.

## Features

- **High Precision:** Measures weights up to 5kg with an accuracy of 1g.
- **OLED Display:** Bright, clear 128x24 OLED screen for easy readability.
- **Connectivity:** Wi-Fi-enabled for real-time data synchronization using Firebase.
- **Tare Functionality:** Reset the scale to zero for container weight.
- **Units of Measurement:** Toggle between grams and ounces.
- **Rechargeable Battery:** Eco-friendly 1800mAh Li-Polymer battery.
- **User-Friendly Enclosure:** Compact, durable, and ergonomic PLA design.

## Table of Contents

- [Specifications](#specifications)
- [Hardware Design](#hardware-design)
  - [Schematic and PCB Design](#schematic-and-pcb-design)
  - [Bill of Materials (BOM)](#bill-of-materials-bom)
  - [Enclosure Design](#enclosure-design)
- [Software](#software)
- [Assembly Instructions](#assembly-instructions)
- [Testing](#testing)
- [License](#license)

---

## Specifications

| Specification            | Details                                     |
|--------------------------|---------------------------------------------|
| **Capacity**             | Up to 5 kilograms                         |
| **Accuracy**             | 1 gram (specified by sensor manufacturer) |
| **Error Margin**         | <1% for measurements above 100g           |
| **Display**              | 0.91-inch 128x24 OLED (SSD1306 driver)    |
| **Units**                | Grams and Ounces                          |
| **Power Source**         | 1800mAh Li-Polymer Battery (Rechargeable) |
| **Connectivity**         | Wi-Fi with Firebase real-time database    |
| **Enclosure Material**   | PLA (3D printed)                          |

---

## Hardware Design

### Schematic and PCB Design

The hardware design includes:
- A precision load cell and amplifier for accurate weight measurement.
- An SSD1306 OLED display module for weight visualization.
- Power management ICs for battery charging and regulation.

Design files:
- **Schematic:** Available in the `design_files/schematic/` directory.
- **PCB Layout and Gerbers:** Found in `design_files/pcb/`.

### Bill of Materials (BOM)

| Component                  | Quantity | Price (USD) |
|----------------------------|----------|-------------|
| Resistors (Various Values) | 20       | $0.50       |
| Capacitors (Various Values)| 10       | $0.45       |
| TC2117 Voltage Regulator   | 2        | $1.05       |
| MCP73831 Battery Manager   | 2        | $0.81       |
| OLED Display (SSD1306)     | 1        | $3.01       |
| Load Cell and Amplifier    | 1        | $2.57       |
| Push Buttons               | 2        | $0.40       |
| 3D Printed Enclosure       | 1        | $17.14      |

**Total Cost:** ~$36.39

### Enclosure Design

The enclosure, designed in **SolidWorks**, is 3D-printed using PLA material. It features:
- Compact dimensions.
- Optimized display placement for easy readability.
- Secure compartments for electronics.

Design files can be found in `design_files/enclosure/`.

---

## Software

The software for the "Precision Chef" is written in **Arduino** using the ESP32 framework. Key features include:
- Real-time weight data sent to Firebase.
- OLED display updates for measurements, tare functionality, and unit toggling.
- Deep sleep mode for energy conservation.

### Libraries Used

- **Adafruit_GFX**: For graphical display on OLED.
- **Adafruit_SSD1306**: OLED driver library.
- **Firebase ESP Client**: For real-time database integration.
- **HX711**: Load cell amplifier library.

Code files can be found in the `src/` directory.

---

## Assembly Instructions

### PCB Fabrication and Soldering
1. Order the PCB using the provided Gerber files in `design_files/pcb/`.
2. Solder the components as per the schematic.

### Enclosure Assembly
1. 3D print the enclosure parts using the provided STL files.
2. Assemble the electronics inside the enclosure.
3. Attach the display and secure the load cell mechanism.

---

## Testing

1. **Power On:** Ensure the device powers up and the OLED display lights up.
2. **Calibration:** Calibrate the scale using a known weight.
3. **Unit Test:** Test the unit toggle functionality (grams to ounces).
4. **Wi-Fi Connectivity:** Verify data is sent to Firebase.
5. **Tare Functionality:** Reset weight to zero and verify.
6. **Accuracy Test:** Compare with a standard weight.

---

Feel free to reach out or open an issue if you have any questions or suggestions!
