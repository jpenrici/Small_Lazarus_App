#ifndef CALC_LIB_H
#define CALC_LIB_H

#ifdef __cplusplus
	extern "C" {
#endif

#ifdef _WIN32
# ifdef BUILD_DLL
#   define CALC_LIB  __declspec(dllexport)
# else
#   define CALC_LIB  __declspec(dllimport)
# endif
#else
# define CALC_LIB
#endif

float CALC_LIB add(float number1, float number2);
float CALC_LIB subtract(float number1, float number2);
float CALC_LIB multiply(float number1, float number2);
float CALC_LIB divide(float number1, float number2);   

#ifdef __cplusplus
}
#endif

#endif // CALC_LIB_H
