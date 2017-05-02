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
				    forbrdstl: TComboBox;
				    forbrng: TComboBox;
				    forrdngstl: TComboBox;
				    fortracks: TComboBox;
				    forwheels: TComboBox;
				    GroupBox2: TGroupBox;
				    Image1: TImage;
				    Imgload: TPanel;
				    OpenDialog1: TOpenDialog;
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
   If OpenDialog1.Execute then
   try
       Image1.Picture.LoadFromFile(OpenDialog1.FileName);
   except
     on EInvalidGraphic do ShowMessage ('Ошибка загрузки')
     else ShowMessage ('Прочие ошибки: ' + #13 + Exception(ExceptObject).Message);
   end;
end;


end.
