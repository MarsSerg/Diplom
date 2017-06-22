unit Unit6;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, 
				    Dialogs, StdCtrls, ExtCtrls;

type

		  { TForm6 }

                  TForm6 = class(TForm)
				    GroupBox1: TGroupBox;
				    GrpAboutDeck: TGroupBox;
				    GrpRDStyles: TGroupBox;
				    grpguide: TGroupBox;
				    Image1: TImage;
				    PnlFrstl: TPanel;
				    PnlTch: TPanel;
				    PnlTail: TPanel;
				    PnlCrs: TPanel;
				    PnlPark: TPanel;
				    PnlWheels: TPanel;
				    PnlForm: TPanel;
				    PnlTracks: TPanel;
				    PnlBrd: TPanel;
				    Pnlstls: TPanel;
				    PnlDnh: TPanel;
				    procedure PnlBrdClick(Sender: TObject);
				    procedure PnlstlsClick(Sender: TObject);
				    procedure PnlstlsMouseEnter(Clr:tpanel);
				    procedure PnlstlsMouseEnter(Sender: TObject
						      );
				    procedure PnlstlsMouseLeave(Clr:tpanel);
				    procedure PnlstlsMouseLeave(Sender: TObject
						      );

       procedure PnlTailClick(A: Tpanel);
       procedure PnlTailClick(Sender: TObject);

                  private
                                    { private declarations }
                  public
                                    { public declarations }
                  end;

var
                  Form6: TForm6;

implementation

{$R *.lfm}

{ TForm6 }



procedure TForm6.PnlBrdClick(Sender: TObject);
begin
GrpAboutDeck.Visible:= Not(GrpAboutDeck.Visible);
end;

procedure TForm6.PnlstlsClick(Sender: TObject);
begin
 GrpRDStyles.Visible:= Not(GrpRDStyles.Visible);
end;


procedure TForm6.PnlstlsMouseLeave(Clr:tpanel);
begin
 Clr.Color:=$00FF0DFF;
end;

procedure TForm6.PnlstlsMouseLeave(Sender: TObject);
begin

end;

procedure TForm6.PnlstlsMouseEnter(Clr:tpanel);
begin
  Clr.Color:=$00CE00CE ;
end;

procedure TForm6.PnlstlsMouseEnter(Sender: TObject);
begin

end;



procedure TForm6.PnlTailClick(A: Tpanel);
var
imgpath:string;
begin
case A.Name of
'PnlTail':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\1.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpAboutDeck.Visible:=false;
  end;
'PnlWheels':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\Wheels.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpAboutDeck.Visible:=false;
  end;
'PnlForm':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\dropthru.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpAboutDeck.Visible:=false;
  end;
'PnlTracks':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\tracks.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpAboutDeck.Visible:=false;
  end;
'PnlCrs':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\CRS.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpRDStyles.Visible:=false;
  end;
'PnlDnh':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\DnH.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpRDStyles.Visible:=false;
  end;
'PnlFrstl':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\frstl.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpRDStyles.Visible:=false;
  end;
'PnlTch':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\techslide.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpRDStyles.Visible:=false;
  end;
'PnlPark':
  begin
  imgpath:='C:\Users\Сергей\Desktop\Diplom\photo\Park.jpg';
  Image1.Picture.LoadFromFile(imgpath);
  GrpRDStyles.Visible:=false;
  end;
end;
end;

procedure TForm6.PnlTailClick(Sender: TObject);
begin

end;

end.

