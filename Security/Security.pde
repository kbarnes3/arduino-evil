/*
 * Keypad Security
 *
 * Reads from a keypad and lights some LEDs depending
 * on whether the correct security code was input
 */

#include <Keypad.h>

const byte c_cRows = 4; //four rows
const byte c_cCols = 3; //three columns
const char c_rgKeys[c_cRows][c_cCols] = {
    {'1','2','3'},
    {'4','5','6'},
    {'7','8','9'},
    {'#','0','*'},
};
byte rgRowPins[c_cRows] = {9, 2, 3, 6}; //connect to the row pinouts of the keypad
byte rgColPins[c_cCols] = {8, 11, 5}; //connect to the column pinouts of the keypad
Keypad keypad = Keypad( makeKeymap(c_rgKeys), rgRowPins, rgColPins, c_cRows, c_cCols );


void setup()
{
    Serial.begin(9600);
}

void loop()
{
    char key = NO_KEY;

    key = keypad.getKey();

    if (key != NO_KEY)
    {
        Serial.println(key);
    }
}

