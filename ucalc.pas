{
  Multiplatform experience with dynamic library.
  Reference: https://wiki.freepascal.org/Lazarus/FPC_Libraries
}
unit uCalc;

interface

uses
  Classes, SysUtils, Dynlibs;

const
  ERROR='Error';

{$IFDEF WINDOWS}
  DLLPATH ='.\C_lib\calc.dll';
{$ENDIF}
{$IFDEF LINUX}
  DLLPATH = './C_lib/libcalc.so';
{$ENDIF}

function Add(number1, number2: Single): String;
function Subtract(number1, number2: Single): String;
function Multiply(number1, number2: Single): String;
function Divide(number1, number2: Single): String;

implementation

function Calc(funcName: String; number1, number2: Single): String;
type
  TDllCalc=function (n1, n2: Single): Single; Cdecl;
var
  LibHandle: TLibHandle = NilHandle;
  DllCalc: TDllCalc;
  DllCalcResult: Single;
begin
  Result:= ERROR;
  LibHandle := LoadLibrary(DLLPATH);
  if LibHandle <> NilHandle Then
  begin
    DllCalc:= TDllCalc(GetProcedureAddress(LibHandle, funcName));
    if DllCalc <> Nil Then
    begin
      DllCalcResult:= DllCalc (number1, number2);
      Result:= FloatToStr(DllCalcResult);
      if LibHandle <> NilHandle Then
        if FreeLibrary(LibHandle) Then
          LibHandle:= NilHandle;
    end;
  end;
end;

function Add(number1, number2: Single): String;
begin
  Result:= Calc('add', number1, number2);
end;

function Subtract(number1, number2: Single): String;
begin
  Result:= Calc('subtract', number1, number2);
end;

function Multiply(number1, number2: Single): String;
begin
  Result:= Calc('multiply', number1, number2);
end;

function Divide(number1, number2: Single): String;
begin
  Result:= Calc('divide', number1, number2);
end;

end.
