#include "calc.h"

float add(float number1, float number2)
{
	return number1 + number2;
}

float subtract(float number1, float number2)
{
	return number1 - number2;
}

float multiply(float number1, float number2)
{
	return number1 * number2;
}

float divide(float number1, float number2)
{
	if (number2 == 0)
		return 0;

	return number1 / number2;
}
