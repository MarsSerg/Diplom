unit Unit2;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
Dialogs, StdCtrls, ExtCtrls;

type

{ TForm2 }

TForm2 = class(TForm)
  Bearings: TLabel;
  Boardstyle: TLabel;
  Fordescr: TEdit;
  Lblname: TLabel;
  Chkgrrdstl: TCheckGroup;
  Forname: TEdit;
  forbrdstl: TComboBox;
  forbrng: TComboBox;
  fortracks: TComboBox;
  forwheels: TComboBox;
  GroupBox2: TGroupBox;
  Image1: TImage;
  Imgload: TPanel;
  Lblname1: TLabel;
  //OpenDialog1: TOpenDialog;
  OpenDialog2: TOpenDialog;
  Panel1: TPanel;
  Ridingstyle: TLabel;
  Tracks: TLabel;
  Wheels: TLabel;
  procedure ImgloadClick(Sender: TObject);
private
  { private declarations }
public
  { public declarations }
end;

var
Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.ImgloadClick(Sender: TObject);
begin
  if OpenDialog2.Execute then
      try
      Image1.Picture.LoadFromFile(OpenDialog2.FileName);
      except
      on EInvalidGraphic do
        ShowMessage('Ошибка загрузки')
      else
        ShowMessage('Прочие ошибки: ' + #13 + Exception(ExceptObject).Message);
      end;
end;


end.
