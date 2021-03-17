#include "calc.h"
#include <stdio.h>

int main(void)
{
	printf("%f\n", add(100.1, 200.2)); 
	printf("%f\n", subtract(100, 200)); 
	printf("%f\n", multiply(10, 20)); 
	printf("%f\n", divide(100, 0)); 

	printf("%s\n", "Press any key to finished."); 
	getchar();

	return 0;
}