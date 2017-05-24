unit Unit1;

{$mode objfpc}{$H+}

interface

uses
Classes, SysUtils, mssqlconn, sqldb, DB, FileUtil, Forms,
Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Grids, DBCtrls, Unit2, Unit3;

type

{ TForm1 }

TForm1 = class(TForm)
		  DataSource1: TDataSource;
		  Rbvar1: TLabel;
  QueryQuest: TSQLQuery;
  Qryforid: TSQLQuery;
  MSSQLConnection1: TMSSQLConnection;
  qryTestSkate: TSQLQuery;
  Rbvar2: TLabel;
  Rbvar3: TLabel;
  SQLTransaction1: TSQLTransaction;
  DSquestion: TDataSource;
  DBtxtquest: TDBText;
  DBNavigator1: TDBNavigator;
  Image1: TImage;
  Startimg: TImage;
  OkPanel: TPanel;
  Login: TEdit;
  Passwod: TEdit;
  Forpassword: TLabel;
  GroupBox1: TGroupBox;
  foradm: TGroupBox;
  Forlogin: TLabel;
  Admbutt: TPanel;
  Wiki: TPanel;
  procedure AdmbuttClick(Sender: TObject);
  procedure DBNavigator1Click(Sender: TObject;
    Button: TDBNavButtonType);
  procedure foradmClick(Sender: TObject);
  procedure FormActivate(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure GroupBox2Click(Sender: TObject);


  procedure Label1Click(Sender: TObject);
  procedure Label2Click(Sender: TObject);
  procedure Label3Click(Sender: TObject);


  procedure StartIMGClick(Sender: TObject);

  procedure OkPanelClick(Sender: TObject);
  procedure Panel2Click(Sender: TObject);
  procedure printnextquest(isfirst: boolean = False);
  procedure WikiClick(Sender: TObject);
  procedure Choosevar(var_id: string);
private
  { private declarations }
public
  { public declarations }
end;

var
Form1: TForm1;
mass_label_id: array [1..3] of string;
first_quest: boolean;
is_clicked:boolean;

implementation

{$R *.lfm}

{ TForm1 }
procedure Tform1.printnextquest(isfirst: boolean = False);
var
  iLabel: integer;
  next_quest_id:string;
begin
  if (not isfirst)and (not QueryQuest.EOF) then begin
    //QueryQuest.Next;
    Qryforid.Active := True;
    next_quest_id:= Qryforid.FieldByName('quest_id').AsString

  end
  else if (isfirst) then begin
      QueryQuest.Next;
      next_quest_id:=QueryQuest.FieldByName('quest_id').Value;
  end;

  qryTestSkate.Filtered := False;
  qryTestSkate.Filter := 'quest_id="' + next_quest_id + '"';
  qryTestSkate.Filtered := True;
  qryTestSkate.First;
  iLabel := 1;
  while (not qryTestSkate.EOF) do
    begin
    case iLabel of
      1 : Rbvar1.Caption := qryTestSkate.FieldByName('Text').Value;

      2 : Rbvar2.Caption := qryTestSkate.FieldByName('Text').Value;
      3 : Rbvar3.Caption := qryTestSkate.FieldByName('Text').Value;
      end;
    mass_label_id[iLabel] := qryTestSkate.FieldByName('Answer_Id').AsString;
    Inc(iLabel);
    qryTestSkate.Next;
    end;
end;

procedure TForm1.WikiClick(Sender: TObject);
begin
  Form3.ShowModal;
end;



procedure TForm1.Label1Click(Sender: TObject);
begin
  if (not is_clicked) then
    begin
    is_clicked:=true;
  Choosevar(mass_label_id[(Sender as tlabel).Tag]);
  printnextquest;
  DBtxtquest.Refresh;
  is_clicked:=false;
    end;
end;


procedure TForm1.Label2Click(Sender: TObject);
begin
  if (not is_clicked) then
    begin
    is_clicked:=true;
  Choosevar(mass_label_id[(Sender as tlabel).Tag]);
  printnextquest;
  DBtxtquest.Refresh;
  is_clicked:=false;
    end;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  if (not is_clicked) then
    begin
    is_clicked:=true;
  Choosevar(mass_label_id[(Sender as tlabel).Tag]);
  printnextquest;
  DBtxtquest.Refresh;
  is_clicked:=false;
    end;
end;



procedure TForm1.StartIMGClick(Sender: TObject);
begin
  is_clicked:=false;
  first_quest := True;
  Rbvar3.Visible := True;
  Rbvar2.Visible := True;
  Rbvar1.Visible := True;
  Startimg.Visible := False;
  Dbtxtquest.DataField := 'description';

  QueryQuest.Active := False;
  QueryQuest.SQL.Clear;
  QueryQuest.SQL.Add('select quest_id,description from dbo.questions');
  QueryQuest.Active := True;


  qryTestSkate.Active := False;
  qryTestSkate.SQL.Clear;
  qryTestSkate.SQL.Add('select * from dbo.test_quest_skate');
  qryTestSkate.Active := True;
  DBtxtquest.DataField:='Text';
  //dbrdgrAnswers.DataField:='Text';
  printnextquest(True);
  Image1.Visible := True;

end;



procedure Tform1.Choosevar(var_id: string);
var
  cond: string;
  sql_text: string;
  sql_text_cond: string;
begin

  sql_text := 'select Quest_id,Selection from Answers where Answer_id=''' + var_id + '''';
  Qryforid.sql.Text := sql_text;

  Qryforid.Active := True;

  cond := Qryforid.FieldByName('Selection').AsString;
  Qryforid.Active := False;

  if cond <> '' then
    begin
    sql_text_cond := form3.qryinfo.SQL.Text;

    Form3.Qryinfo.Active := False;
    if (not first_quest) then
      begin
      sql_text_cond := sql_text_cond + ' And ';
      end
    else
      first_quest := False;
    sql_text_cond := sql_text_cond + cond;

    Form3.Qryinfo.SQL.Text := sql_text_cond;
    Form3.Qryinfo.Active := True;
    end;
end;

procedure TForm1.OkPanelClick(Sender: TObject);

begin
  Form2.ShowModal;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.foradmClick(Sender: TObject);
begin

end;

procedure TForm1.FormActivate(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

procedure TForm1.AdmbuttClick(Sender: TObject);
begin
  if Foradm.Visible = False then
    Foradm.Visible := True
  else
    Foradm.Visible := False;
end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
begin
  if (button = nbNext) then
    begin
    printnextquest;
    end;
  DBtxtquest.Refresh;
end;


end.

