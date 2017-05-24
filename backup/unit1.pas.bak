unit Unit1;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, mssqlconn, sqldb, db, FileUtil, Forms,
		  Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Grids, DbCtrls,Unit2,Unit3;

type

		  { TForm1 }

                  TForm1 = class(TForm)
                                    QueryQuest: TSQLQuery;
				    Qryforid: TSQLQuery;
                                    MSSQLConnection1: TMSSQLConnection;
				    qryTestSkate: TSQLQuery;
				    SQLTransaction1: TSQLTransaction;
				    DSquestion: TDataSource;
				    DBtxtquest: TDBText;
				    DBNavigator1: TDBNavigator;
				    Image1: TImage;
				    Rbvar1: TRadioButton;
				    Rbvar2: TRadioButton;
				    Rbvar3: TRadioButton;
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
				    procedure DBNavigator1Click(
						      Sender: TObject; Button: TDBNavButtonType);
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
                  first_quest:boolean;

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
             1: Rbvar1.Caption:=qryTestSkate.FieldByName('Text').Value;

             2: Rbvar2.Caption:=qryTestSkate.FieldByName('Text').Value;
             3: Rbvar3.Caption:=qryTestSkate.FieldByName('Text').Value;
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



procedure TForm1.Label1Click(Sender: TObject);
begin
      Choosevar(mass_label_id[(Sender as tradiobutton).Tag]);
      printnextquest;
      DBtxtquest.Refresh;
  end;


procedure TForm1.Label2Click(Sender: TObject);
begin
                  Choosevar(mass_label_id[(Sender as tradiobutton).Tag]);
          printnextquest;
      DBtxtquest.Refresh;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
     Choosevar(mass_label_id[(Sender as tradiobutton).Tag]);
     printnextquest;
     DBtxtquest.Refresh;
end;



procedure TForm1.StartIMGClick(Sender: TObject);
begin
     first_quest:=true;
     Rbvar3.Visible:=true;
     Rbvar2.Visible:=true;
     Rbvar1.Visible:=true;
     Startimg.Visible:=false;
     Dbtxtquest.DataField:='description';

     QueryQuest.Active:=false;
     QueryQuest.SQL.Clear;
     QueryQuest.SQL.Add('select quest_id,description from dbo.questions');
     QueryQuest.Active:=true;


  qryTestSkate.Active:=false;
     qryTestSkate.SQL.Clear;
     qryTestSkate.SQL.Add('select * from dbo.test_quest_skate');
     qryTestSkate.Active:=true;
     //DBtxtquest.DataField:='Text';
     //dbrdgrAnswers.DataField:='Text';
     printnextquest(true);
     Image1.Visible:=true;


end;



procedure Tform1.Choosevar( var_id: string);
var
   cond:string;
   sql_text:string;
   sql_text_cond:string;
begin
     sql_text:='select Selection from Answers where Answer_id=''' + var_id + '''';
      Qryforid.sql.Text:=sql_text;

     Qryforid.Active:=true;
     cond := Qryforid.FieldByName('Selection').AsString;
     Qryforid.Active:=false;
     if cond <> '' then
     begin
          sql_text_cond:=form3.qryinfo.SQL.Text;

          Form3.Qryinfo.Active:=false;
          if (not first_quest) then begin
             sql_text_cond:= sql_text_cond + ' And ';
	  end
          else
               first_quest:=false;
	  sql_text_cond:= sql_text_cond + cond;

              Form3.Qryinfo.SQL.Text := sql_text_cond;
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

procedure TForm1.FormCreate(Sender: TObject);
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


