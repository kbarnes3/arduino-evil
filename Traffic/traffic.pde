const int redPin = 2;
const int yellowPin = 3;
const int greenPin = 4;
const int inputPin = 8;

namespace lightState
{
    enum state
    {
        red,
        yellow,
        green,
    };
}

lightState::state eLightState = lightState::red;

void setup()
{
    pinMode(redPin, OUTPUT);
    pinMode(yellowPin, OUTPUT);
    pinMode(greenPin, OUTPUT);
    pinMode(inputPin, INPUT);
}

void loop()
{
    int output = LOW;

    if (digitalRead(inputPin))
    {
        switch (eLightState)
        {
            case lightState::red:
            {
                eLightState = lightState::yellow;
                setLights(HIGH, LOW, LOW);
                delay(500);
                break;
            }
            case lightState::yellow:
            {
                eLightState = lightState::green;
                setLights(LOW, HIGH, LOW);
                delay(500);
                break;
            }
            case lightState::green:
            {
                eLightState = lightState::red;
                setLights(LOW, LOW, HIGH);
                delay(500);
                break;
            }
        }

    }

}

void setLights(int red, int yellow, int green)
{
    digitalWrite(redPin, red);
    digitalWrite(yellowPin, yellow);
    digitalWrite(greenPin, green);
}

