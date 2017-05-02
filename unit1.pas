unit Unit1;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, mssqlconn, sqldb, db, FileUtil, Forms,
		  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Grids, DbCtrls;

type

		  { TForm1 }

                  TForm1 = class(TForm)
				    DataSource1: TDataSource;
				    DBNavigator1: TDBNavigator;
				    DBText1: TDBText;
				    Panel1: TPanel;
				    StartIMG: TImage;
				    questIMG: TImage;
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
	procedure GroupBox2Click(Sender: TObject);
        procedure Image1Click(Sender: TObject);
	procedure AcceptClick(Sender: TObject);
	procedure questIMGClick(Sender: TObject);
	procedure StartIMGClick(Sender: TObject);
	procedure MSSQLConnection1AfterConnect(Sender: TObject);
	procedure Panel1Click(Sender: TObject);
	procedure Panel2Click(Sender: TObject);
                  private
                                    { private declarations }
                  public
                                    { public declarations }
                  end;

var
                  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.AcceptClick(Sender: TObject);
begin

end;

procedure TForm1.questIMGClick(Sender: TObject);
begin

end;


procedure TForm1.StartIMGClick(Sender: TObject);
begin
  qryTestSkate.Active:=false;
     qryTestSkate.SQL.Clear;
     qryTestSkate.SQL.Add('select * from dbo.test_quest_skate');
     qryTestSkate.Active:=true;
     dbtext1.DataField:='Text';
     StartIMG.Visible:=False;
     questIMG.Visible:=true;
end;

procedure TForm1.MSSQLConnection1AfterConnect(Sender: TObject);
begin

end;

procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel2Click(Sender: TObject);
begin

end;

procedure TForm1.foradmClick(Sender: TObject);
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
                  dbtext1.Refresh;
end;

end.

