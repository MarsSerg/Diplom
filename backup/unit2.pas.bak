unit Unit2;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, sqldb, DB, FileUtil, Forms, Controls, Graphics,
Dialogs, StdCtrls, ExtCtrls, DBCtrls;

type

{ TForm2 }

TForm2 = class(TForm)
  Bearings: TLabel;
  Boardstyle: TLabel;
  dsBoardStyle: TDataSource;
  dsTracks: TDataSource;
  dsWheels: TDataSource;
  dsBear: TDataSource;
  Lblpath: TLabel;
  lcmbBoardStyle: TDBLookupComboBox;
  dsAdminSkate: TDataSource;
  Fordescr: TEdit;
  Lblname: TLabel;
  chkRidingStyles: TCheckGroup;
  Forname: TEdit;
  GroupBox2: TGroupBox;
  Image1: TImage;
  Imgload: TPanel;
  Lblname1: TLabel;
  lcmbTracks: TDBLookupComboBox;
  lcmbWheels: TDBLookupComboBox;
  lcmbBearings: TDBLookupComboBox;
  //OpenDialog1: TOpenDialog;
  OpenDialog2: TOpenDialog;
  Panel1: TPanel;
  qryaddrdstl: TSQLQuery;
  qryTracks: TSQLQuery;
  qryWheels: TSQLQuery;
  qryBear: TSQLQuery;
  Ridingstyle: TLabel;
  qryAdminSkate: TSQLQuery;
  qryBoardStyle: TSQLQuery;
  qryadd: TSQLQuery;
  Tracks: TLabel;
  Wheels: TLabel;
  procedure FormCreate(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure ImgloadClick(Sender: TObject);
  procedure Panel1Click(Sender: TObject);
private
  { private declarations }
public
  { public declarations }
end;

var
Form2: TForm2;
strRidingStyles: TStringList;
tr1:TSQLTransaction;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.ImgloadClick(Sender: TObject);
begin
  if OpenDialog2.Execute then
      try
      Image1.Picture.LoadFromFile(OpenDialog2.FileName);
      lblpath.Caption:=OpenDialog2.FileName;
      except
      on EInvalidGraphic do
        ShowMessage('Ошибка загрузки')
      else
        ShowMessage('Прочие ошибки: ' + #13 + Exception(ExceptObject).Message);
      end;
end;

procedure TForm2.Panel1Click(Sender: TObject);
var
name_txt ,Descr_txt,Tr_id ,brd_id,wh_id,bear_id,path:string;
begin
   name_txt:= forname.Text;
   Descr_txt:= Fordescr.Text;
   tr_id:=lcmbTracks.KeyValue;
   bear_id:=lcmbBearings.KeyValue;
   wh_id:=lcmbWheels.KeyValue;
   brd_id:=lcmbBoardStyle.KeyValue;
   path:=Lblpath.Caption;
   qryadd.SQL.Text:='exec dbo.AddSkate @Picture=:path, @Boardstyle_ID=:brd_id, @Tracks_ID=:tr_id, @Wheels_ID=:wh_id, @Bearings_ID=:bear_id, @Name=:name_txt, @Description=:Descr_txt';
   qryadd.ParamByName('path').AsString := path;
   qryadd.ParamByName('brd_id').AsInteger := StrToInt(brd_id) ;
   qryadd.ParamByName('tr_id').AsInteger := StrToInt(tr_id);
   qryadd.ParamByName('wh_id').AsInteger := StrToInt(wh_id);
   qryadd.ParamByName('bear_id').AsInteger := StrToInt(bear_id);
   qryadd.ParamByName('name_txt').AsString := name_txt;
   qryadd.ParamByName('descr_txt').AsString := Descr_txt;
   qryadd.ExecSQL;
   tr1.Commit;
   for i:=1 to chkRidingStyles.items.Count do begin
       if (chkRidingStyles.Checked[i]) then
           begin

	   end;
   end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  txtSql: string;
  txtElement: string;

begin
  qryAdminSkate.Active := False;

  //загрузка Riding_style
  txtSql := 'select Ridingstyle_id,ridingstyle from Riding_Style';
  qryAdminSkate.SQL.Text := txtSql;
  qryAdminSkate.Active := True;


  strRidingStyles.Clear;
  chkRidingStyles.Items.Clear;
  while (not qryAdminSkate.EOF) do
    begin
    txtElement := qryAdminSkate.FieldByName('Ridingstyle_id').AsString;
    strRidingStyles.Add(txtElement);
    txtElement := qryAdminSkate.FieldByName('Ridingstyle').AsString;
    chkRidingStyles.Items.Add(txtElement);
    qryAdminSkate.Next;
    end;
  qryAdminSkate.Active := False;

  qryBoardStyle.Active := True;
  qryWheels.Active := True;
  qryBear.Active := True;
  qryTracks.Active := True;
  //lcmbBoardStyle.Refresh ;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  strRidingStyles := TStringList.Create;
end;


end.
