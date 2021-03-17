unit uGui;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  uCalc;

type

  { TFormCalc }

  TFormCalc = class(TForm)
    btn_Sub: TButton;
    btn_Mult: TButton;
    btn_Div: TButton;
    btn_Reset: TButton;
    btn_Add: TButton;
    PanelBtn: TPanel;
    txt_Number1: TEdit;
    txt_Number2: TEdit;
    txt_Result: TEdit;
    lbl_Number1: TLabel;
    lbl_Number2: TLabel;
    lbl_Result: TLabel;
    procedure CalcAdd(Sender: TObject);
    procedure CalcDiv(Sender: TObject);
    procedure CalcMult(Sender: TObject);
    procedure CalcSub(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Reset(Sender: TObject);
  private
    procedure Calculate(op: char);
  public
  end;

var
  FormCalc: TFormCalc;

implementation

{$R *.lfm}

{ TFormCalc }

procedure TFormCalc.Calculate(op: char);
var
  num1, num2: Single;
begin
  try
    num1:= StrToFloat(txt_Number1.Text);
    num2:= StrToFloat(txt_Number2.Text);
    case op of
      '+':
          txt_Result.Text:= uCalc.Add(num1, num2);
      '-':
          txt_Result.Text:= uCalc.Subtract(num1, num2);
      '*':
          txt_Result.Text:= uCalc.Multiply(num1, num2);
      '/':
          begin
           if num2 = 0 Then txt_Result.Text:= uCalc.ERROR
           else txt_Result.Text:= uCalc.Divide(num1, num2);
          end
    else
        txt_Result.Text:= uCalc.ERROR;
    end;
  except
    txt_Result.Text:= uCalc.ERROR;
  end
end;

procedure TFormCalc.CalcAdd(Sender: TObject);
begin
     Calculate('+');
end;

procedure TFormCalc.CalcSub(Sender: TObject);
begin
     Calculate('-');
end;

procedure TFormCalc.CalcMult(Sender: TObject);
begin
     Calculate('*');
end;

procedure TFormCalc.CalcDiv(Sender: TObject);
begin
     Calculate('/');
end;

procedure TFormCalc.Reset(Sender: TObject);
begin
     txt_Number1.Clear;
     txt_Number2.Clear;
     txt_Result.Clear;
end;

procedure TFormCalc.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

end.
