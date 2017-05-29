unit Unit3;

{$mode objfpc}{$H+}
{$GOTO ON}
interface

uses
Classes, SysUtils, sqldb, DB, mssqlconn, FileUtil, Forms,
Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Unit4;

type

{ TForm3 }

TForm3 = class(TForm)
  Brdname2: TLabel;
  Brdname3: TLabel;
  DataSource1: TDataSource;
  GroupBox1: TGroupBox;
  grpskate1: TGroupBox;
  grpskate2: TGroupBox;
  grpbox: TGroupBox;
  Image1: TImage;
  Brdname1: TLabel;
  Image2: TImage;
  Image3: TImage;
  Image4: TImage;
  Image5: TImage;
  Image6: TImage;
  Image7: TImage;
  lbldskr1: TLabel;
  lbldskr2: TLabel;
  lbldskr3: TLabel;
  Lblabout: TLabel;
  Lblabout1: TLabel;
  Lblabout2: TLabel;
  MSSQLConnection1: TMSSQLConnection;
  PnlNext: TPanel;
  Qryinfo: TSQLQuery;
  SQLTransaction1: TSQLTransaction;
  procedure FormActivate(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure Formopen(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Image7Click(Sender: TObject);
  procedure PnlNextClick(Sender: TObject);
  procedure LoadPicture(img:TImage);

private
  { private declarations }
public
  { public declarations }
  function GetIsNullValue(q1: TSQLQuery;
    fieldname: string): string;

  procedure LoadInfo;
end;

var
Form3: TForm3;
recstatus: integer;

implementation

{$R *.lfm}
function TForm3.GetIsNullValue(q1: TSQLQuery; fieldname: string): string;
begin

end;
procedure Tform3.LoadPicture(img:TImage);
var
   image_path:string;
begin
    image_path:=qryinfo.FieldByName('Picture').AsString;
    if (image_path<>'') then
       img.Picture.LoadFromFile(image_path);
end;

procedure Tform3.LoadInfo;
var
   sql_text:string;
begin
  sql_text:=qryinfo.SQL.Text;
  case recstatus of
    1 :
      begin
      lbldskr1.Caption := qryinfo.FieldByName('Description').AsString;
      Brdname1.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image1);

      end;
    2 :
      begin
      lbldskr2.Caption := qryinfo.FieldByName('Description').AsString;
      Brdname2.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image2);
      end;
    3 :
      begin
      lbldskr3.Caption := qryinfo.FieldByName('description').AsString;
      Brdname3.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image3);
      end;
    end;

end;


procedure TForm3.PnlNextClick(Sender: TObject);
label first_img;
begin
     if (not qryinfo.Active) then
        qryinfo.Active:=true;
  if (not qryinfo.EOF) then
  first_img:

     for recstatus := 1 to 3 do
     begin
          qryinfo.Next;
          if (not qryinfo.EOF) then
          loadinfo
          else begin
               qryinfo.First;
               goto first_img;
	  end;
     end;
end;



procedure TForm3.FormActivate(Sender: TObject);
begin

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  recstatus := 0;
  if (recstatus = 0) then
    begin
    qryinfo.Active := False;
    //qryinfo.SQL.Clear;
    //qryinfo.SQL.Add('Exec dbo.Skates');
    //       qryinfo.Active:=true;
    //       inc(recstatus);
    //       loadinfo;

    //       for recstatus:=2 to 3 do begin
    //           qryinfo.Next;
    //           if (not qryinfo.eof) then
    //              loadinfo;
    //end;

    end;
end;

procedure TForm3.Formopen(Sender: TObject);
begin
  form4.showmodal;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
     PnlNextClick(pnlnext);
end;

procedure TForm3.Image7Click(Sender: TObject);
begin

end;




end.

