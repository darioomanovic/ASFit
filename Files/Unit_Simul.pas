unit Unit_Simul;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Buttons, VrControls, VrBlinkLed;

type
  TForm_Simul = class(TForm)
    SG_Fit_Table: TStringGrid;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Panel1: TPanel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    CB_Fix_Width: TCheckBox;
    CB_Fix_Pos: TCheckBox;
    StringGrid1: TStringGrid;
    SpeedButton3: TSpeedButton;
    Button1: TButton;
    LabeledEdit19: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    Blink: TVrBlinkLed;
    procedure SG_Fit_TableMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure SG_Fit_TableMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SG_Fit_TableDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Simul: TForm_Simul;

implementation
uses mainUnit;
{$R *.dfm}

procedure TForm_Simul.Button1Click(Sender: TObject);
vaR
fnE, fnG,fld,fmeth: String;
fl: TextFIle;
od, ka,i: Integer;
xf, yf, lin: String;
BEGIN
  fmeth := '_ExpGauss\';
  fld := ExtractFilepath(Files[0]) + fmeth;
  if DirectoryExists(fld) = false then
    if not CreateDir(fld) then
      raise Exception.Create('Error creating folders: ' + fld);

fnE := ChangeFileExt(ExtractFIleName(Files[FOrm1.CheckListBOx1.ItemIndex]), '.exg');
fnE := fld + '_ExpG_E_'+fnE;
AssignFile(fl, fnE);
od:=StrToInt(Form1.Edit3.text);
ka:= StrToInt(Form1.Edit4.text);
Rewrite(fl);
for i := od to ka do
  begin
  yf :=StringGrid1.Cells[1,i];
  Xf := StringGrid1.Cells[0,i];
  lin := Xf + #9 + yf;
  WriteLn(fl, lin);
  end;
  CloseFile(fl);

fnE := ChangeFileExt(ExtractFIleName(Files[FOrm1.CheckListBOx1.ItemIndex]), '.exg');
fnE := fld + '_ExpG_G_'+fnE;
AssignFile(fl, fnE);
od:=StrToInt(Form1.Edit3.text);
ka:= StrToInt(Form1.Edit4.text);
Rewrite(fl);
for i := od to ka do
  begin
  yf :=StringGrid1.Cells[8,i];
  Xf := StringGrid1.Cells[0,i];
  lin := Xf + #9 + yf;
  WriteLn(fl, lin);
  end;
  CloseFile(fl);

end;

procedure TForm_Simul.FormCreate(Sender: TObject);
begin
Form1.OpenIniFIle;
SG_Fit_TAble.ColWidths[0]:=75;
SG_Fit_TAble.Cells[0,1]:='a0 or G-Height';
SG_Fit_TAble.Cells[0,2]:='S or G-Width';
SG_Fit_TAble.Cells[0,3]:='K or G-Pos';
SG_Fit_TAble.Cells[1,0]:='Exp';
//SG_Fit_TAble.Cells[2,0]:='Gauss 1';
//SG_Fit_TAble.Cells[3,0]:='Gauss 2';
//SG_Fit_TAble.Cells[4,0]:='Gauss 3';
end;

procedure TForm_Simul.SG_Fit_TableDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

Rect.Right:=Rect.Right-2;
if (acol>0) and (SG_Fit_Table.Cells[acol, 2]<>'') and (arow=2)then
 if StrTofloat(SG_Fit_Table.Cells[acol, 2])>=StrToFloat(form_Simul.LabeledEdit19.Text) then SG_Fit_Table.Canvas.Font.Color:=clRed else
SG_Fit_Table.Canvas.Font.Color := clblack;;
SG_Fit_Table.Canvas.TextOut(Rect.Left+2 , Rect.Top+2, SG_Fit_Table.Cells[ACol, ARow]);

end;

procedure TForm_Simul.SG_Fit_TableMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
row,col,f,i: Integer;
pomak: Double;
begin
Handled := true;
row:=SG_Fit_Table.Row;
Col:=SG_Fit_Table.Col;
if row=3 then pomak:=0.995 else pomak:=0.98;
SG_Fit_TAble.Cells[col,row]:=FormatFloat('0.0000',StrToFloat(SG_Fit_TAble.Cells[col,row])*pomak);
form1.SpeedButton3Click(self);

f:=Form1.Checklistbox1.ItemIndex;
Form1.StringGrid1.Cells[2, f + 1] := FormatFloat('0.00000', vg[1]);
 Form1.StringGrid1.Cells[3, f + 1] := FormatFloat('0.00000', sg[1]);
  Form1.StringGrid1.Cells[6, f + 1] := FormatFloat('0.0000', vg[0]);

  Form1.StringGrid1.Cells[16, f + 1] := FormatFloat('0.0000', vg[2]); // Edit2.Text;
  for i := 0 to NoGauss - 1 do
  begin
    Form1.StringGrid1.Cells[6 * 3 + i * 3, f + 1] :=      FormatFloat('0.0000', vg[3 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 1, f + 1] :=       FormatFloat('0.00', vg[4 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 2, f + 1] :=     FormatFloat('0.0', vg[5 + 3 * i]); // Edit2.Text;
  end;
Form1.StringGrid1.Refresh;
ParManChanged:=true;
end;

procedure TForm_Simul.SG_Fit_TableMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
row,col, f,i: Integer;
pomak: Double;
begin
Handled := true;
row:=SG_Fit_Table.Row;
Col:=SG_Fit_Table.Col;
if row=3 then pomak:=1.005 else pomak:=1.02;
SG_Fit_TAble.Cells[col,row]:=FormatFloat('0.0000',StrToFloat(SG_Fit_TAble.Cells[col,row])*pomak);
form1.SpeedButton3Click(self);
f:=Form1.Checklistbox1.ItemIndex;
Form1.StringGrid1.Cells[2, f + 1] := FormatFloat('0.00000', vg[1]);
 Form1.StringGrid1.Cells[3, f + 1] := FormatFloat('0.00000', sg[1]);
  Form1.StringGrid1.Cells[6, f + 1] := FormatFloat('0.0000', vg[0]);

  Form1.StringGrid1.Cells[16, f + 1] := FormatFloat('0.0000', vg[2]); // Edit2.Text;
  for i := 0 to NoGauss - 1 do
  begin
    Form1.StringGrid1.Cells[6 * 3 + i * 3, f + 1] :=      FormatFloat('0.0000', vg[3 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 1, f + 1] :=       FormatFloat('0.00', vg[4 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 2, f + 1] :=     FormatFloat('0.0', vg[5 + 3 * i]); // Edit2.Text;
  end;
//form1.SpeedButton3C
Form1.StringGrid1.Refresh;
ParManChanged:=true;
end;

procedure TForm_Simul.SpeedButton1Click(Sender: TObject);
var
i: Integer;
begin
NoPointsA[0]:=540;

for I := 1 to NoPointsA[0] do
    begin
      x[0,i]:=209+i;
    end;
form1.Edit3.Text:='1';
form1.Edit4.Text:='350';

Form1.Simulate(1, NoPointsA[0], CheckBox1.Checked);
Form1.SpeedButton3Click(self);
end;

procedure TForm_Simul.SpeedButton2Click(Sender: TObject);
VAR
f: TextFile;
Fname: String;
i: Integer;
bl:Boolean;
begin
fname:=ExtractFilePath(ParamStr(0))+'TempFile.txt';
AssignFIle(f, fname);
rewrite(f);
for i := NoPointsA[0] downto 1  do Writeln(f,FormatFloat('000',x[0,i])+#9+FormatFloat('0.000000000',y[0,i]));
closefile(f);
files.Clear;
FIles.Add(fname);
FOrm1.StringGrid1.RowCount:=2;
FOrm1.StringGrid1.Rows[1].Clear;

Form1.Caption:='ASFit - '+ExtractFilePath(files[0]);
resetSP:=True;
FOrm1.CheckListBox1.Clear;
if (FileExists(FOrm1.FileNameEdit1.FileName)=False) and FOrm1.RB3.Checked then bl:=False else bl:=True;

if resetSP then
begin
FOrm1.OpenFile(x[0],y[0], PathL[0],NoPointsA[0],FIles[0]);
if FOrm1.CheckBox8.Checked then FOrm1.Reconstructspectra(x[0],y[0],NoPointsA[0]);
if FOrm1.CB_Smooth.Checked then FOrm1.SGSmutiranje(y[0], 1, NoPointsA[0], FOrm1.SpinEdit1.Value);
if bl then FOrm1.SubtractBaseline(x[0],y[0],YBln[0],NoPointsA[0]);
if FOrm1.CB_Derivative.Checked then FOrm1.DeriveSG(y[0],1,NoPointsA[0]);
end;

FOrm1.CheckListBox1.Items.Add(ExtractFIleName(files[0]));
FOrm1.CheckListBox1.State[FOrm1.CheckListBox1.items.Count-1]:=cbChecked;
BOja[0]:=clBlack;
FOrm1.CheckListBox1.ItemIndex:=0;
FOrm1.Label5.Caption:='Number of files: '+IntToStr(1);
FOrm1.RChart1.Caption:=FOrm1.CheckListBox1.items[0];

FOrm1.Plotallspectra1Click(Self);
end;

procedure TForm_Simul.SpeedButton3Click(Sender: TObject);
begin
 Form1.CopyTable(StringGrid1);
end;

procedure TForm_Simul.SpinEdit1Change(Sender: TObject);
var
I,stWL, pomak, st, sel,f : Integer;
stWL2:Double;
begin


//if sender=Form1.Button6 then SHowMessage('Button6') else ShowMessage(Sender.UnitName);
//SpinEdit1.Text:=Form1.SpinEdit2.Text;
Form1.SpinEdit4.Value:=SpinEdit1.Value;
sel:=Form1.CheckListBox1.itemindex;
//Form1.SpinEdit2.Value:=SpinEdit1.Value;
Nogauss:=SpinEdit1.value;
stWL2:=StrToFloat(Form1.LabeledEdit6.text);
st:=0;
for I := 1 to NoPointsA[sel]-1 do
  if abs(x[sel,i]-stWL2)<2 then
    begin
    st:=i;
    break;
    end;
if st=0 then st:=20;

for I := 1 to 6 do
     if  i>Nogauss then
      begin
      SG_Fit_TAble.cols[i+1].Clear;
      end;
for I := 1 to Nogauss do
    Form_Simul.SG_Fit_Table.Cells[i+1, 0] := 'Gauss '+IntToStr(i);;

if sender=SpinEdit1 then exit;

if Form1.CB_slope.Checked then
  begin
    SG_Fit_Table.Cells[1, 1] := '0';
    SG_Fit_Table.Cells[1, 2] := '0';
    SG_Fit_Table.Cells[1, 3] := '0';
    stWL:=270;
  end else
  begin

    SG_Fit_Table.Cells[1, 1] := formatFloat('0.000',Y[sel, st]);
    SG_Fit_Table.Cells[1, 2] := '0.020';
    SG_Fit_Table.Cells[1, 3] := '0';
    stWL:=270;
  end;





//form1.Button6Click(Self);
 case Nogauss of
 2: pomak:=80;
 3: pomak:=60;
 4: pomak:=40;
 5: pomak:=30;
 6: pomak:=30;
 end;
if Form1.CB_slope.Checked then pomak:=50;
SG_Fit_Table.Cells[1, 0] := 'Exp 1';
//ShowMessage(IntToStr(Nogauss));
for I := 1 to Nogauss do
  begin
//  if Form1.CB_slope.Checked then pomak:=pomak+0;
    SG_Fit_Table.Cells[i+1, 0] := 'Gauss '+IntToStr(i);;
    if Form1.CB_slope.Checked then SG_Fit_Table.Cells[i+1, 1] := formatFloat('0.000',0.06*Y[sel, st]*(36/i/i))
    else SG_Fit_Table.Cells[i+1, 1] := formatFloat('0.000',0.003*Y[sel, st]*(36/i/i));
    SG_Fit_Table.Cells[i+1, 2] := formatFloat('0.0',15*(1+0.18*i));
    if (Form1.CheckBox13.Checked=false) or (sender=Form1.SpinEdit2) then
     begin
     SG_Fit_Table.Cells[i+1, 3]:=IntToStr(stWL+(i-1)*pomak);

    // if I=1 then SG_Fit_Table.Cells[i+1, 3] := '270';
     //if I=2 then SG_Fit_Table.Cells[i+1, 3] := '300';
     //if I=3 then SG_Fit_Table.Cells[i+1, 3] := '330';
     //if I=4 then SG_Fit_Table.Cells[i+1, 3] := '360';
     //if I=5 then SG_Fit_Table.Cells[i+1, 3] := '390';
     //if I=6 then SG_Fit_Table.Cells[i+1, 3] := '420';;
     end;

    end;

SG_Fit_Table.Refresh;
//
if (sender=Form1.SpinEdit2) or (sender=Form1.button6) then form1.SpeedButton3Click(self);
exit;

f:=Form1.Checklistbox1.ItemIndex;
Form1.StringGrid1.Rows[f+1].Clear;
Form1.StringGrid1.Cells[2, f + 1] := FormatFloat('0.00000', vg[1]);
 Form1.StringGrid1.Cells[3, f + 1] := FormatFloat('0.00000', sg[1]);
  Form1.StringGrid1.Cells[6, f + 1] := FormatFloat('0.0000', vg[0]);

  Form1.StringGrid1.Cells[16, f + 1] := FormatFloat('0.0000', vg[2]); // Edit2.Text;
  for i := 0 to NoGauss - 1 do
  begin
    Form1.StringGrid1.Cells[6 * 3 + i * 3, f + 1] :=      FormatFloat('0.0000', vg[3 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 1, f + 1] :=       FormatFloat('0.00', vg[4 + 3 * i]); // Edit2.Text;
    Form1.StringGrid1.Cells[6 * 3 + i * 3 + 2, f + 1] :=     FormatFloat('0.0', vg[5 + 3 * i]); // Edit2.Text;
  end;
end;

end.

