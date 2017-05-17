unit Unit1;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, mssqlconn, sqldb, db, FileUtil, Forms,
		  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Grids, DbCtrls,Unit2,Unit3;

type

		  { TForm1 }

                  TForm1 = class(TForm)
				    DataSource1: TDataSource;
				    DBtxtquest: TDBText;
				    DSquestion: TDataSource;
				    DBNavigator1: TDBNavigator;
				    Label1: TLabel;
				    Label2: TLabel;
				    Label3: TLabel;
				    QueryQuest: TSQLQuery;
				    Qryforid: TSQLQuery;
				    Startimg: TImage;
				    OkPanel: TPanel;
				    MSSQLConnection1: TMSSQLConnection;
				    OpenDialog1: TOpenDialog;
				    qryTestSkate: TSQLQuery;
				    SQLTransaction1: TSQLTransaction;
				    Login: TEdit;
				    Passwod: TEdit;
				    Forpassword: TLabel;
				    GroupBox1: TGroupBox;
				    foradm: TGroupBox;
				    Forlogin: TLabel;
				    Admbutt: TPanel;
				    Wiki: TPanel;
				    procedure AdmbuttClick(Sender: TObject);
				    procedure DBNavigator1Click(
						      Sender: TObject; Button: TDBNavButtonType);
        procedure foradmClick(Sender: TObject);
	procedure FormActivate(Sender: TObject);
	procedure GroupBox2Click(Sender: TObject);
        procedure Image1Click(Sender: TObject);
	procedure AcceptClick(Sender: TObject);
	procedure Label1Click(Sender: TObject);
	procedure Label2Click(Sender: TObject);
	procedure Label3Click(Sender: TObject);
	procedure questIMGClick(Sender: TObject);
	procedure StartIMGClick(Sender: TObject);
	procedure MSSQLConnection1AfterConnect(Sender: TObject);
	procedure OkPanelClick(Sender: TObject);
	procedure Panel2Click(Sender: TObject);
        procedure printnextquest(isfirst:boolean = false);
	procedure WikiClick(Sender: TObject);
        procedure Choosevar( var_id: string);
                  private
                                    { private declarations }
                  public
                                    { public declarations }
                  end;

var
                  Form1: TForm1;
                  mass_label_id: array [1..3] of string;

implementation

{$R *.lfm}

{ TForm1 }
procedure Tform1.printnextquest(isfirst:boolean = false);
var
   iLabel:integer;
begin
     if (not isfirst) then
        QueryQuest.Next;
     qryTestSkate.Filtered:=false;
     qryTestSkate.Filter:='quest_id="' + QueryQuest.FieldByName('quest_id').Value+'"';
     qryTestSkate.Filtered:=true;
     qryTestSkate.First;
     iLabel := 1;
     while (not qryTestSkate.EOF) do begin
          case iLabel of
             1: label1.Caption:=qryTestSkate.FieldByName('Text').Value;
             2: label2.Caption:=qryTestSkate.FieldByName('Text').Value;
             3: label3.Caption:=qryTestSkate.FieldByName('Text').Value;
          end;
          mass_label_id [iLabel]:= qryTestSkate.FieldByName('Answer_Id').AsString;
          inc(iLabel);
          qryTestSkate.Next;
     end;
end;

procedure TForm1.WikiClick(Sender: TObject);
begin
   Form3.ShowModal;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.AcceptClick(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin
      Choosevar(mass_label_id[(Sender as tlabel).Tag]);
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
                  Choosevar(mass_label_id[(Sender as tlabel).Tag]);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
                  Choosevar(mass_label_id[(Sender as tlabel).Tag]);
end;

procedure TForm1.questIMGClick(Sender: TObject);
begin

end;


procedure TForm1.StartIMGClick(Sender: TObject);
begin
     QueryQuest.Active:=false;
     QueryQuest.SQL.Clear;
     QueryQuest.SQL.Add('select quest_id,description from dbo.questions');
     QueryQuest.Active:=true;
     Dbtxtquest.DataField:='description';

  qryTestSkate.Active:=false;
     qryTestSkate.SQL.Clear;
     qryTestSkate.SQL.Add('select * from dbo.test_quest_skate');
     qryTestSkate.Active:=true;
     //DBtxtquest.DataField:='Text';
     //dbrdgrAnswers.DataField:='Text';
     printnextquest(true);


end;

procedure TForm1.MSSQLConnection1AfterConnect(Sender: TObject);
begin

end;

procedure Tform1.Choosevar( var_id: string);
var cond:string;
begin
      Qryforid.sql.Text:='select Selection from Answers where Answer_id=''' + var_id + '''';

     Qryforid.Active:=true;
     cond := Qryforid.FieldByName('Selection').AsString;
     Qryforid.Active:=false;
     if cond <> '' then
     begin
          Form3.Qryinfo.Active:=false;
          Form3.Qryinfo.SQL.Add(' And '+ cond);
          Form3.Qryinfo.Active:=true;
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

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

procedure TForm1.AdmbuttClick(Sender: TObject);
begin
  if Foradm.Visible = false then
  Foradm.Visible:=true
  else
    Foradm.Visible:=false;
end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
begin
  if (button=nbNext) then
  begin
         printnextquest;
  end;
                  DBtxtquest.Refresh;
  end;


end.

