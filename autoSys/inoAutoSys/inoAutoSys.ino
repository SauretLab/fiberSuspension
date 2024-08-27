const int buttonPin = 2;
int sensorValue;

void setup() {
  pinMode(buttonPin, INPUT_PULLUP);  // Set button pin as input with internal pull-up resistor
  Serial.begin(38400);
}

void loop() {
  sensorValue = analogRead(A0);  // Read the value from A0
  Serial.println(sensorValue);   // Send the value to the serial port
  
  int buttonState = digitalRead(buttonPin);
  if (buttonState == LOW) {  // Button pressed
    Serial.println("EXIT");
    delay(100);  // Debounce delay
  }
  
  delay(1000);  // Wait for 0.25 seconds
}
