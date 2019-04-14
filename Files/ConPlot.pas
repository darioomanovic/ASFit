unit ConPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SDL_rchart, Vcl.StdCtrls, grids;

type
  TForm2 = class(TForm)
    RChart1: TRChart;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RChart1MouseMoveInChart(Sender: TObject; InChart: Boolean;
      Shift: TShiftState; rMousePosX, rMousePosY: Double);
    procedure RChart1DblClick(Sender: TObject);
    procedure RChart1MouseLeave(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses mainunit;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
RChart1.CopyToClipboard(false);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.CheckBox2.Checked:=False;
end;

procedure TForm2.RChart1DblClick(Sender: TObject);
begin
Rchart1.autorange(1,5);
RChart1.showgraf;
end;

procedure TForm2.RChart1MouseLeave(Sender: TObject);
begin
 RChart1.CrossHairSetPos(1,50,-100);
end;

procedure TForm2.RChart1MouseMoveInChart(Sender: TObject; InChart: Boolean;
  Shift: TShiftState; rMousePosX, rMousePosY: Double);
begin
if inChart then
  begin
  RChart1.CrossHairSetPos(1,round(rMousePosX),rMousePosY);
  Form1.CheckListBox1.ItemIndex:=round(rMousePosX)-1;
  Form1.StringGrid1.Selection:=TGridRect(Rect(0,Form1.CheckListBox1.ItemIndex + 1,Form1.StringGrid1.ColCount-1,Form1.CheckListBox1.ItemIndex + 1));
  //orm1.ListBox1Click(self);
  end;
end;

end.
