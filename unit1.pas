unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnBinToDeci: TButton;
    btnReset: TButton;
    btnDeciToHexa: TButton;
    btnQuit: TButton;
    editBin: TEdit;
    editDeci: TEdit;
    editHexa: TEdit;
    LblBin: TLabel;
    lblDec: TLabel;
    LblHex: TLabel;
    procedure btnBinToDeciClick(Sender: TObject);
    procedure btnDeciToHexaClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure lblDecClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.lblDecClick(Sender: TObject);
begin

end;

procedure TForm1.btnBinToDeciClick(Sender: TObject);
var
   i, j, k, deci, power : INTEGER;
   invalid : BOOLEAN;

begin
     i:=7;
     deci:=0;
     power:=2;
     invalid:=FALSE;

     //vérfication de la valeur saisie
     FOR j:=1 to 8 DO
     begin
          IF (editBin.text[j]<>'1') AND (editBin.text[j]<>'0') THEN
             invalid:=TRUE
          ELSE
             invalid:=FALSE;
     end;

     //Conversion
     IF invalid=TRUE THEN
        ShowMessage('Valeur invalide : vérifiez qu''il y a bien 8 caractères et qu''il ne s''agit que de 0 de 1.')
     ELSE IF invalid=FALSE THEN
     begin
          FOR j:=1 to 8 DO
          begin
               FOR k:=1 TO i DO
               begin
                    power:=power*2;
               end;
               deci:= deci+(strToInt(editBin.text[j])*power);
               i:=i-1;
               power:=2;
          end;
          editDeci.text:=intToStr(deci DIV 2);
     end;
end;

procedure TForm1.btnDeciToHexaClick(Sender: TObject);
var
   deci: INTEGER;

begin
     deci:=StrToInt(editDeci.text);
     editHexa.text:=(IntToHex(deci,2));
end;

procedure TForm1.btnQuitClick(Sender: TObject);
begin
     if MessageDlg('Question', 'Voulez vous quitter ?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
        Close;
end;



procedure TForm1.btnResetClick(Sender: TObject);
begin
     editBin.text:=('');
     editDeci.text:=('');
     editHexa.text:=('');
end;

end.

