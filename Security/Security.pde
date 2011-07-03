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
    {'1', '2', '3'},
    {'4', '5', '6'},
    {'7', '8', '9'},
    {'#', '0', '*'},
};
byte rgRowPins[c_cRows] = {2, 7, 6, 4}; //connect to the row pinouts of the keypad
byte rgColPins[c_cCols] = {3, 1, 5}; //connect to the column pinouts of the keypad
Keypad keypad = Keypad( makeKeymap(c_rgKeys), rgRowPins, rgColPins, c_cRows, c_cCols );

const byte c_pinRed = 11;
const byte c_pinGreen = 12;

const char c_szPassword[] = "1337";
byte iPassword = 0;
const byte cchPassword = (sizeof(c_szPassword)/sizeof(c_szPassword[0])) - 1;

void setup()
{
    pinMode(c_pinRed, OUTPUT);
    pinMode(c_pinGreen, OUTPUT);

    lock();
}

void loop()
{
    char key = NO_KEY;

    key = keypad.getKey();
    if (key != NO_KEY)
    {
        if ((key == '*') || (key == '#') || (iPassword == cchPassword))
        {
            iPassword = 0;
            lock();
        }
        else // Key is numeric and the device is locked
        {
            if (key == c_szPassword[iPassword])
            {
                iPassword++;
                if (iPassword == cchPassword)
                {
                    unlock();
                }
            }
            else
            {
                iPassword = 0;
                lock();
            }
        }
    }
}

void lock()
{
    digitalWrite(c_pinGreen, LOW);
    digitalWrite(c_pinRed, HIGH);
}

void unlock()
{
    digitalWrite(c_pinRed, LOW);
    digitalWrite(c_pinGreen, HIGH);
}
