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
  qryonepage: TSQLQuery;
  SQLTransaction1: TSQLTransaction;

  procedure FormCreate(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Formopen(curlabel: Tlabel);
  procedure PnlNextClick(Sender: TObject);
  procedure LoadPicture(img: TImage);

private
  { private declarations }
public
  { public declarations }
  function GetIsNullValue(q1: TSQLQuery; fieldname: string): string;

  procedure LoadInfo;
end;

var
Form3: TForm3;
recstatus: integer;
mass_skate_id: array [1..3] of integer;
roll_direction: boolean;

implementation

{$R *.lfm}
function TForm3.GetIsNullValue(q1: TSQLQuery; fieldname: string): string;
begin

end;

procedure Tform3.LoadPicture(img: TImage);
var
  image_path: string;
begin
  image_path := qryinfo.FieldByName('Picture').AsString;
  if (image_path <> '') then
    img.Picture.LoadFromFile(image_path);
end;

procedure Tform3.LoadInfo;
var
  counter: integer;
  sql_text: string;
begin
  sql_text := qryinfo.SQL.Text;
  counter := recstatus;
  case recstatus of
    1 :
      begin
      lbldskr1.Caption := qryinfo.FieldByName('Description').AsString;
      Brdname1.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image1);
      mass_skate_id[counter] := qryinfo.FieldByName('Skate_id').AsInteger;
      Lblabout.Tag := mass_skate_id[counter];
      Inc(counter);
      end;
    2 :
      begin
      lbldskr2.Caption := qryinfo.FieldByName('Description').AsString;
      Brdname2.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image2);
      mass_skate_id[counter] := qryinfo.FieldByName('Skate_id').AsInteger;
      Lblabout1.Tag := mass_skate_id[counter];
      Inc(counter);
      end;
    3 :
      begin
      lbldskr3.Caption := qryinfo.FieldByName('description').AsString;
      Brdname3.Caption := qryinfo.FieldByName('Skate_Name').AsString;
      LoadPicture(Image3);
      mass_skate_id[counter] := qryinfo.FieldByName('Skate_id').AsInteger;
      Lblabout2.Tag := mass_skate_id[counter];
      end;
    end;

end;


procedure TForm3.PnlNextClick(Sender: TObject);
begin
  if (not qryinfo.Active) then
    qryinfo.Active := True;
  if (not qryinfo.EOF) then
    for recstatus := 1 to 3 do
      begin
      qryinfo.Next;
      if (qryinfo.EOF) then
        begin
        qryinfo.First;
        end;
      loadinfo;
      end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  recstatus := 0;
  roll_direction := True;
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

procedure TForm3.Formopen(curlabel: Tlabel);
var
  lbl, i: integer;
  img: string;
  str: string;
  s1: string;
begin
  lbl := curlabel.Tag;
  qryonepage.Active := False;
  qryonepage.SQL.Clear;
  qryonepage.SQL.Add('Exec dbo.Skates @idskate=:lbl');
  qryonepage.ParamByName('lbl').AsInteger := lbl;
  qryonepage.Active := True;
  Form4.Name_of_deck.Caption := qryonepage.FieldByName('Skate_name').AsString;
  img := qryonepage.FieldByName('Picture').AsString;
  ;
  Form4.Image1.Picture.LoadFromFile(img);
  Form4.LblDescription.Caption := qryonepage.FieldByName('Description').AsString;
  str := Form4.LblDescription.Caption;
  s1 := '';
  for i := 1 to length(str) do
    begin
    s1 := s1 + str[i];
    if Form4.LblDescription.canvas.TextWidth(s1) >= Form4.Grpdskr.Width then
      begin
      Form4.LblDescription.Caption := Form4.LblDescription.Caption + s1 + ' ';
      s1 := '';
      end;
    end;
  Form4.Lblstyles.Caption := qryonepage.FieldByName('Styles').AsString;
  Form4.Lblnose.Caption :=
    Form4.Lblnose.Caption + '      -     ' + qryonepage.FieldByName('Nose').AsString;
  Form4.Lbltail.Caption :=
    Form4.Lbltail.Caption + '      -     ' + qryonepage.FieldByName('Tale').AsString;
  Form4.Lblwidth.Caption := '      -     ' + qryonepage.FieldByName('Width').AsString;
  Form4.Lbllength.Caption := '      -     ' + qryonepage.FieldByName('Length').AsString;
  Form4.Lbldcktp.Caption :=
    Form4.Lbldcktp.Caption + '      -     ' + qryonepage.FieldByName('Type_of_deck').AsString;
  Form4.Lbltrsize.Caption :=
    '  -     ' + qryonepage.FieldByName('Tracks_Size').AsString;
  Form4.Lbltrtype.Caption :=
    Form4.Lbltrtype.Caption + '      -     ' + qryonepage.FieldByName('Tracks_Type').AsString;
  Form4.Lblwhhrd.Caption :=
    '   -     ' + qryonepage.FieldByName('Wh_Hardness').AsString;
  Form4.Lblwhsize.Caption := '  -     ' + qryonepage.FieldByName('Wheel_Size').AsString;
  Form4.Lblbrname.Caption :=
    Form4.Lblbrname.Caption + '      -     ' + qryonepage.FieldByName('Bear_name').AsString;
  Form4.Lblmdof.Caption :=
    Form4.Lblmdof.Caption + '      -     ' + qryonepage.FieldByName('Madeof').AsString;
  Form4.Lblwhlbs.Caption :=
    '      -     ' + qryonepage.FieldByName('Wheelbase').AsString;

  form4.showmodal;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  PnlNextClick(pnlnext);
end;




end.
