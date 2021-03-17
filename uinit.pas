unit uInit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, uGui, uCalc;

type

  { TFormInit }

  TFormInit = class(TForm)
    btn_ok: TButton;
    lbl_inform: TLabel;
    procedure btn_okClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
  public
  end;

var
  FormInit: TFormInit;

implementation

{$R *.lfm}

{ TFormInit }

procedure TFormInit.btn_okClick(Sender: TObject);
begin
     if not FileExists(uCalc.DLLPATH) Then
     begin
      ShowMessage('Calc library not found! Close App!');
      Application.Terminate;
     end;
     FormInit.Hide;
     FormCalc.Show;
end;

procedure TFormInit.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     Application.Terminate;
end;

end.
