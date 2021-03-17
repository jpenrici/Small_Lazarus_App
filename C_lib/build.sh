#!/bin/bash

echo "Remove libcalc.so"
rm libcalc.so 

echo "Build ... "
gcc -Wall -fexceptions -g -c calc.c -o calc.o
gcc -shared -fPIC -o libcalc.so calc.o
rm calc.o

gcc -Wall -fexceptions -g -c test.c -o test.o
gcc -o testCalc test.o libcalc.so
rm test.o

echo "Dirs ..."
ls

echo "Test testCalc ..."	
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
./testCalc

echo "Exit ..."
rm testCalc
