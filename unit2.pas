unit Unit2;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, sqldb, db, FileUtil, Forms, Controls, Graphics,
Dialogs, StdCtrls, ExtCtrls, DbCtrls;

type

{ TForm2 }

TForm2 = class(TForm)
  Bearings: TLabel;
  Boardstyle: TLabel;
  dsBoardStyle: TDataSource;
  lcmbBoardStyle: TDBLookupComboBox;
  dsAdminSkate: TDataSource;
  Fordescr: TEdit;
  Lblname: TLabel;
  chkRidingStyles: TCheckGroup;
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
  qryAdminSkate: TSQLQuery;
  qryBoardStyle: TSQLQuery;
  Tracks: TLabel;
  Wheels: TLabel;
  procedure FormCreate(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure ImgloadClick(Sender: TObject);
private
  { private declarations }
public
  { public declarations }
end;

var
Form2: TForm2;
strRidingStyles:TStringList;
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

procedure TForm2.FormShow(Sender: TObject);
var
   txtSql:string;
   txtElement:string;

begin
   qryAdminSkate.Active:=false;

   //загрузка Riding_style
   txtSql:='select Ridingstyle_id,ridingstyle from Riding_Style';
   qryAdminSkate.SQL.Text:=txtSql;
   qryAdminSkate.Active:=true;


   strRidingStyles.Clear;
   chkRidingStyles.Items.Clear;
   while (not qryAdminSkate.EOF) do begin
         txtElement:=qryAdminSkate.FieldByName('Ridingstyle_id').AsString;
         strRidingStyles.Add(txtElement);
         txtElement:=qryAdminSkate.FieldByName('Ridingstyle').AsString;
         chkRidingStyles.Items.Add(txtElement);
         qryAdminSkate.Next;
   end;
   qryAdminSkate.Active:=false;

   qryBoardStyle.Active:=true;
   lcmbBoardStyle.Refresh ;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
     strRidingStyles:=TStringList.Create;
end;


end.
