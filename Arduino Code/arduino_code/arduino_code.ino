#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 4);  // Set the LCD I2C address

void setup()
{

  lcd.begin(16,4); 
  lcd.backlight();              // initialize the lcd 
  lcd.home ();
  lcd.clear();      
}

void loop()
{
  displayNPK(100, 200, 300);
  displayPh(07);
  displayMoisture(12);
}

void displayNPK(int n, int p, int k) 
{
  lcd.setCursor(0, 0);
  lcd.print("N:");
  lcd.setCursor(2, 0);
  lcd.print(n);
  lcd.setCursor(0, 1);
  lcd.print("P:");
  lcd.setCursor(2, 1);
  lcd.print(p);
  lcd.setCursor(0, 2);
  lcd.print("K:");
  lcd.setCursor(2, 2);
  lcd.print(k);
}

void displayPh(int ph) 
{
  lcd.setCursor(0, 3);
  lcd.print("ph level:");
  lcd.setCursor(9, 3);
  lcd.print(ph);
}

void displayMoisture(int moisture) {
  lcd.setCursor(7, 0);
  lcd.print("Moisture:");
  lcd.setCursor(10, 1);
  lcd.print(moisture);
}