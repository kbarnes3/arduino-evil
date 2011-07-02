/*
 * Keypad Security
 *
 * Reads from a keypad and lights some LEDs depending
 * on whether the correct security code was input
 */

int ledPin = 11;

void setup() {
  // initialize the digital pin as an output.
  // Pin ledPin has an LED connected on most Arduino boards:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  digitalWrite(ledPin, HIGH);   // set the LED on
  delay(200);              // wait for a second
  digitalWrite(ledPin, LOW);    // set the LED off
  delay(200);              // wait for a second
}

