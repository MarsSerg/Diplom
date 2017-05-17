unit Unit4;

{$mode objfpc}{$H+}

interface

uses
                  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, 
				    Dialogs, StdCtrls, ExtCtrls;

type

		  { TForm4 }

                  TForm4 = class(TForm)
				    Grpparts: TGroupBox;
				    LblDescription: TLabel;
				    Lblstyles: TLabel;
				    Lbltrcks: TLabel;
				    Lbltrsize1: TLabel;
				    Lblbrname: TLabel;
				    Lblmdof: TLabel;
				    Lblwhhrd: TLabel;
				    LblWhls: TLabel;
				    Lbltrsize: TLabel;
				    Lbltrtype: TLabel;
				    Lblbr: TLabel;
				    Parts: TLabel;
				    Grparam: TGroupBox;
				    grride: TGroupBox;
				    Lblwidth: TLabel;
				    Lbllength: TLabel;
				    Lblwhlbs: TLabel;
				    Lblnose: TLabel;
				    Lbltail: TLabel;
				    Lbldcktp: TLabel;
				    Riding_styles: TLabel;
				    Grpdskr: TGroupBox;
				    Grpdeck: TGroupBox;
				    Image1: TImage;
				    Description: TLabel;
				    Name_of_deck: TLabel;
				    Params: TLabel;
                  private
                                    { private declarations }
                  public
                                    { public declarations }
                  end;

var
                  Form4: TForm4;

implementation

{$R *.lfm}

end.

