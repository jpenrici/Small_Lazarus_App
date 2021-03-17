@echo off

cls
echo Remove libcalc.a libcalc.def calc.dll testCalc.exe
del libcalc.a
del libcalc.def
del calc.dll
del testCalc.exe

echo Build MinGW ...
C:\MinGW\bin\mingw32-gcc.exe -Wall -DBUILD_DLL -g -c calc.c -o calc.o
C:\MinGW\bin\mingw32-gcc.exe -shared -Wl,--output-def=libcalc.def -Wl,--out-implib=libcalc.a -Wl,--dll calc.o -o calc.dll -luser32
C:\MinGW\bin\mingw32-gcc.exe -Wall -fexceptions -g -c test.c -o test.o
C:\MinGW\bin\mingw32-gcc.exe -o testCalc.exe test.o libcalc.a
del test.o
del calc.o

setlocal EnableDelayedExpansion
set "list=Dirs ... "
for /f "delims=" %%f in ('dir /o /b') do (
  set "list=!list! %%f"
)
echo %list%

echo Test testCalc ...	
cmd /c testCalc.exe

echo Exit ...
del testCalc.exe
