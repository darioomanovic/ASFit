unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SDL_rchart, Vcl.Buttons, ComObj,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Clipbrd, Vcl.ComCtrls, Registry,
  shellapi, OleCtnrs,
  SDL_math2, math, Vcl.Menus, Vcl.Mask, RxToolEdit, Vcl.CheckLst, RxCombos,
  Vcl.Samples.Spin, ActiveX, Vcl.AppEvnts, SDL_statis, SDL_Vector, IniFIles,
  SDL_plot3d, SDL_sdlBase,ExtActns;

// type
// TTestFitterEventSink = class(TInterfacedObject, IInterface, IDispatch)
// private
// FCP: IConnectionPoint; // these two used to connect and disconnect events
// FCookie: integer;
// protected
// IInterface
// function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
// IDispatch
// function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
// function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
// function GetIDsOfNames(const IID: TGUID; Names: Pointer;
// NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
// function Invoke(DIID: Integer; const IID: TGUID;
// LocaleID: Integer; Flags: Word; var Params;
// VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
// public
// constructor Create(Fitter: IDispatch);
// destructor Destroy; override;
// end;

{ TTestFitterEventSink }

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit6: TEdit;
    Edit7: TEdit;
    SaveDialog1: TSaveDialog;
    CurveFit1: TCurveFit;
    SpeedButton8: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Splitter2: TSplitter;
    StringGrid1: TStringGrid;
    Splitter3: TSplitter;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    GroupBox2: TGroupBox;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    RB2: TRadioButton;
    RB1: TRadioButton;
    RB0: TRadioButton;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    GroupBox3: TGroupBox;
    Edit9: TEdit;
    Edit1: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    Edit5: TEdit;
    Edit8: TEdit;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    LabeledEdit12: TLabeledEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    CheckBox5: TCheckBox;
    PopupMenu1: TPopupMenu;
    Plotdatafromcolumn1: TMenuItem;
    Bevel1: TBevel;
    SpeedButton9: TSpeedButton;
    RB3: TRadioButton;
    CheckBox6: TCheckBox;
    CheckListBox1: TCheckListBox;
    PopupMenu2: TPopupMenu;
    Plotallspectra1: TMenuItem;
    Copyspectra1: TMenuItem;
    SpeedButton10: TSpeedButton;
    CheckBox7: TCheckBox;
    Label7: TLabel;
    CB_Smooth: TCheckBox;
    SpinEdit1: TSpinEdit;
    CB_Derivative: TCheckBox;
    SpeedButton11: TSpeedButton;
    LabeledEdit13: TLabeledEdit;
    Edit2: TEdit;
    Edit10: TEdit;
    Memo2: TMemo;
    ApplicationEvents1: TApplicationEvents;
    Panel9: TPanel;
    StaticText1: TStaticText;
    CB_Fit_K: TCheckBox;
    CB_Fit_Gauss: TCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    CB_Weighted: TCheckBox;
    SpinEdit2: TSpinEdit;
    CheckBox1: TCheckBox;
    RandGen1: TRandGen;
    Bevel2: TBevel;
    CB_Save_Slp: TCheckBox;
    N1: TMenuItem;
    PasteXYspectradata1: TMenuItem;
    LabeledEdit14: TLabeledEdit;
    ListBox1: TListBox;
    Label9: TLabel;
    FilenameEdit1: TFilenameEdit;
    N2: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    N61: TMenuItem;
    N71: TMenuItem;
    N81: TMenuItem;
    N91: TMenuItem;
    N101: TMenuItem;
    N111: TMenuItem;
    N121: TMenuItem;
    N131: TMenuItem;
    N141: TMenuItem;
    N151: TMenuItem;
    N161: TMenuItem;
    N171: TMenuItem;
    N181: TMenuItem;
    N191: TMenuItem;
    N201: TMenuItem;
    N211: TMenuItem;
    N221: TMenuItem;
    CB_Trans: TCheckBox;
    Copyallcheckedspectra1: TMenuItem;
    N3: TMenuItem;
    Removefilefromlist1: TMenuItem;
    CB_Slope: TCheckBox;
    N231: TMenuItem;
    N23241: TMenuItem;
    N251: TMenuItem;
    N261: TMenuItem;
    N271: TMenuItem;
    N281: TMenuItem;
    N291: TMenuItem;
    N301: TMenuItem;
    N311: TMenuItem;
    SpinEdit5: TSpinEdit;
    SpeedButton12: TSpeedButton;
    AssignXvalue1: TMenuItem;
    Panel12: TPanel;
    StringGrid2: TStringGrid;
    Panel13: TPanel;
    Button1: TButton;
    Button2: TButton;
    N4: TMenuItem;
    GroupBox5: TGroupBox;
    SpinEdit3: TSpinEdit;
    Label8: TLabel;
    SpinEdit4: TSpinEdit;
    Label6: TLabel;
    CheckBox8: TCheckBox;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RChart1: TRChart;
    Panel8: TPanel;
    RChart2: TRChart;
    Splitter4: TSplitter;
    RChart3: TRChart;
    Splitter1: TSplitter;
    CheckBox3: TCheckBox;
    Plot3D1: TPlot3D;
    SpinEdit6: TSpinEdit;
    Label10: TLabel;
    Button5: TButton;
    CheckBox9: TCheckBox;
    CB_Fit_a0: TCheckBox;
    CheckBox10: TCheckBox;
    Edit11: TEdit;
    CheckBox11: TCheckBox;
    PopupMenu3: TPopupMenu;
    Copyactivedata1: TMenuItem;
    Button6: TButton;
    CheckBox13: TCheckBox;
    LabeledEdit17: TLabeledEdit;
    Button7: TButton;
    MakeAveragespectraselected1: TMenuItem;
    SaveAveragespectra1: TMenuItem;
    SaveDialog2: TSaveDialog;
    CheckBox14: TCheckBox;
    Memo1: TMemo;
    PopupMenu4: TPopupMenu;
    Replot1: TMenuItem;
    Replot2: TMenuItem;
    RB4: TRadioButton;
    ComboBox1: TComboBox;
    CheckBox16: TCheckBox;
    LabeledEdit20: TLabeledEdit;
    Savetreatedspectra1: TMenuItem;
    SetPathLength1: TMenuItem;
    N1cm1: TMenuItem;
    N5cm1: TMenuItem;
    N10cm1: TMenuItem;
    TabSheet3: TTabSheet;
    Memo3: TMemo;
    CB_Constr: TCheckBox;
    N100cm1: TMenuItem;
    Memo4: TMemo;
    CheckBox17: TCheckBox;
    Performadditionalfitting1: TMenuItem;
    CheckBox18: TCheckBox;
    RB_Double: TRadioButton;
    RB_Triple: TRadioButton;
    Bevel3: TBevel;
    LabeledEdit18: TLabeledEdit;
    LabeledEdit19: TLabeledEdit;
    LabeledEdit21: TLabeledEdit;
    CheckBox12: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox15: TCheckBox;
    Edit12: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Procedure SaveIniFIle;
    Procedure OpenIniFIle;
    Procedure DoDownload(Source, Dest: String);
    procedure ApplicationEvents1Hint(Sender: TObject);
    Procedure Reconstructspectra(var xr, yr: array of double; np:Integer);
    Procedure LogTransform(var xr, yr: array of double; np:Integer);
    Procedure Normalize(var xr, yr: array of double; np:Integer;wl: double);
    Procedure SGSmutiranje(var Y: array of double; NoPoc, NoKraj, m: integer);
    procedure DeriveSG(var Y: array of double; poc, kraj: integer);
//    Procedure OdrediTocku(pozX: double; x: array of double;
  //    NoPoc, NoKraj: integer; var Point: integer);
    function RefToCell(RowID, ColID: integer): string;
    function StringGridToExcelSheet(Grid: TStringGrid;
      SheetName, FileName: string; ShowExcel, SaveExcel: Boolean): Boolean;
    procedure SpeedButton1Click(Sender: TObject);
    procedure OpenFile(var xout, yout: array of double; pathLen: double; var np:Integer; Fname: String);
    procedure OptimizeOne(XpPik, YpPik: array of double;
      NoPoc, NoKraj, slNo: integer; weight: Boolean);
    procedure OptimizeScatter(XpPik, YpPik: array of double; NoPoc, NoKraj: integer; alter: Boolean;var con,bas: Double);
    procedure OptimizeOneBKGauss(XpPik, YpPik: array of double;
      NoPoc, NoKraj, slNo,iterations: integer; weight, bc: Boolean);
    procedure OptimizeLog(XpPik, YpPik: array of double;
      NoPoc, NoKraj, slNo: integer; weight: Boolean);
    procedure NacrtajGraf(graf: TRChart;x, Y: array of double; od, ka: integer; boja: TColor;
      log, line, ClearPlot, autorange, Show: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Calculate(fno: integer; onefile: Boolean);
    procedure AddGauss_Izraz(peaks: integer; log: Boolean;
      var izraz: OleVariant);
    procedure AbsAtPos(pos: double);
    procedure SubtractBlank(var Xbase, Ybase, Bric: array of double; np: Integer;fn: String);
    procedure SubtractBaseline(var Xbase, Ybase, Bric: array of double; np: Integer);
    procedure SubtractBaselineMoving(var Xbase, Ybase: array of double; mouseposX, mouseposY: double; np: Integer);
    procedure CheckSlope(Xbase, Ybase: array of double; np: Integer);
    procedure Simulate(od, ka: integer; noise: Boolean);
    procedure PlotFit(sl, od, ka: integer);
    procedure RChart1MouseMoveInChart(Sender: TObject; InChart: Boolean;
      Shift: TShiftState; rMousePosX, rMousePosY: double);
    procedure TranslateManual(XRot,YRot:array of double; NoPoc, NoKraj: Integer; center, XRight, YRight: Double);
    procedure TranslateLamp(var XRot,YRot:array of double; NoPoc, NoKraj: Integer; Position: Double);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CopyTable(Table1: TStringGrid);
    procedure CopyColumn(Table1: TStringGrid; col:integer);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RChart1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Panel8Resize(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, Y: integer);
    procedure Plotdatafromcolumn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FilenameEdit1AfterDialog(Sender: TObject; var AName: string;
      var Action: Boolean);
    procedure Plotallspectra1Click(Sender: TObject);
    procedure Copyspectra1Click(Sender: TObject);
    procedure CheckListBox1DrawItem(Control: TWinControl; Index: integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DifferencePeaks(xd, yd: array of double; od, ka: integer;
      var Nopiks: integer; var pikpos: array of integer;
      var PikH: array of double);
    procedure StringGrid1FixedCellClick(Sender: TObject; ACol, ARow: integer);
    procedure CheckBox8Click(Sender: TObject);
    procedure RChart1ZoomPan(Sender: TObject);
    procedure LabeledEdit12Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
    procedure LabeledEdit5Change(Sender: TObject);
    procedure RChart1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; xx, yY: integer);
    procedure Label7Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure RChart1MouseLeave(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure CB_Fit_GaussClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GroupBox3DblClick(Sender: TObject);
    procedure PasteXYspectradata1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure CB_TransClick(Sender: TObject);
    procedure Copyallcheckedspectra1Click(Sender: TObject);
    procedure Removefilefromlist1Click(Sender: TObject);
    procedure CB_SlopeClick(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AssignXvalue1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Change(Sender: TObject);
    procedure Copyactivedata1Click(Sender: TObject);
    procedure GroupBox4DblClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure MakeAveragespectraselected1Click(Sender: TObject);
    procedure SaveAveragespectra1Click(Sender: TObject);
    procedure RChart1Click(Sender: TObject);
    procedure Replot1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Replot2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Savetreatedspectra1Click(Sender: TObject);
    procedure N1cm1Click(Sender: TObject);
    procedure N5cm1Click(Sender: TObject);
    procedure N10cm1Click(Sender: TObject);
    procedure LabeledEdit20Change(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabeledEdit6Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N100cm1Click(Sender: TObject);
    procedure Performadditionalfitting1Click(Sender: TObject);
    procedure Splitter3CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure StaticText1Click(Sender: TObject);
  private

  protected

  public

  end;

const
  maxFiles = 1000;
  maxpoints = 5000;
var
  Form1: TForm1;
  ColSel, NoGauss, BrojParametara, NoFIles: integer;
  NoPointsA: array[0..maxFiles] of integer;
  PathL:array[0..maxFiles] of double;
  Xorg, Yorg,x, Y ,YBln: array [0 .. maxFiles, 0 .. maxpoints] of double;
  Xbl, Ybl, Xavg, Yavg, Yresidue: array [0 .. maxpoints] of double;
  slope, LambdaStart, startTime, endTime: double;
  Files, BlFIles: TStrings;
  XLApp, Sheet, Data, xNewSeries, xValues, YValues, XChart,
    currentaxis: OleVariant;
  stop, diff, moving, resetSP: Boolean;
  boja: array [0 .. maxFiles] of TColor;
  vg, sg: array [0 .. 30] of double;
  Fitter: variant;
    nwl1,nwl2,nwl3, nwl4,nwl5,nwl6,E2,E3, FavL, FavR: Integer;
    center,YStartTranslate: double;
    translating: Boolean;
    DefGLW,DefGHW, DefSSLW,DefSSHW : String;
    version: Integer;
    ParManChanged, NoGChanged:Boolean;

implementation

uses about, ConPlot,  Unit_Simul, Unit_warning;
{$R *.dfm}


procedure ReadBinaryPE(FileName: string; var xLen: Int32; var xValue, yValue: array of double);

var
  AFile: TMemoryStream;
  BR: TBinaryReader;
  BlockID, i: int16;
  BlockSize: Int32;
  ADouble: double;
  AChar: Char;
  AString, opis: String;
  innerCode, length, xLength, ucharIndex, uncharIndex: int16;
  c, j, k, n, p: integer;
  length32, iCountLoop: Int32;
  X0, xEnd, xDelta, Data: double;
  description, text: String;
  Xlabel, yLabel, alias, OriginalName: String;
const
  DSet2DC1DIBlock = 120;
  HistoryRecordBlock = 121;
  InstrHdrHistoryRecordBlock = 122;
  InstrumentHeaderBlock = 123;
  IRInstrumentHeaderBlock = 124;
  UVInstrumentHeaderBlock = 125;
  FLInstrumentHeaderBlock = 126;
  // Data member IDs
  DataSetDataTypeMember = -29839;
  DataSetAbscissaRangeMember = -29838;
  DataSetOrdinateRangeMember = -29837;
  DataSetIntervalMember = -29836;
  DataSetNumPointsMember = -29835;
  DataSetSamplingMethodMember = -29834;
  DataSetXAxisLabelMember = -29833;
  DataSetYAxisLabelMember = -29832;
  DataSetXAxisUnitTypeMember = -29831;
  DataSetYAxisUnitTypeMember = -29830;
  DataSetFileTypeMember = -29829;
  DataSetDataMember = -29828;
  DataSetNameMember = -29827;
  DataSetChecksumMember = -29826;
  DataSetHistoryRecordMember = -29825;
  DataSetInvalidRegionMember = -29824;
  DataSetAliasMember = -29823;
  DataSetVXIRAccyHdrMember = -29822;
  DataSetVXIRQualHdrMember = -29821;
  DataSetEventMarkersMember = -29820;
  // Type code IDs
  ShortType = 29999;
  UShortType = 29998;
  IntType = 29997;
  UIntType = 29996;
  LongType = 29995;
  BoolType = 29988;
  CharType = 29987;
  CvCoOrdPointType = 29986;
  StdFontType = 29985;
  CvCoOrdDimensionType = 29984;
  CvCoOrdRectangleType = 29983;
  RGBColorType = 29982;
  CvCoOrdRangeType = 29981;
  DoubleType = 29980;
  CvCoOrdType = 29979;
  ULongType = 29978;
  PeakType = 29977;
  CoOrdType = 29976;
  RangeType = 29975;
  CvCoOrdArrayType = 29974;
  EnumType = 29973;
  LogFontType = 29972;

begin
  AFile := TMemoryStream.Create;
   AFile.LoadFromFile(filename);
  BR := TBinaryReader.Create(AFile, TEncoding.UTF7, false);
  opis := '';
  for i := 0 to 3 do
  begin
    AChar := BR.ReadChar;
    opis := opis + Char(AChar);
  end;
  if opis <> 'PEPE' then
  begin
    xLen := 0;
    Exit;
  end;
  opis := '';
  for i := 4 to 43 do
  begin
    AChar := BR.ReadChar;
    opis := opis + Char(AChar);
  end;

  for i := 1 to 18 do
  begin
    BlockID := BR.ReadInt16;
    BlockSize := BR.ReadInt32;

    Case BlockID of
      DSet2DC1DIBlock:
        begin
        end;

      DataSetAbscissaRangeMember:
        begin
          innerCode := BR.ReadInt16;
          X0 := BR.ReadDouble;
          xEnd := BR.ReadDouble;
        end;

      DataSetIntervalMember:
        begin
          innerCode := BR.ReadInt16;
          xDelta := BR.ReadDouble;
        end;

      DataSetNumPointsMember:
        begin
          innerCode := BR.ReadInt16;
          xLen := BR.ReadInt32;
        end;

      DataSetXAxisLabelMember:
        begin
          innerCode := BR.ReadInt16;
          length := BR.ReadInt16;
          Xlabel := '';
          for c := 1 to length do
          begin
            Xlabel := Xlabel + BR.ReadChar;
          end;
        end;

      DataSetYAxisLabelMember:
        begin
          innerCode := BR.ReadInt16;
          length := BR.ReadInt16;
          yLabel := '';
          for c := 1 to length do
          begin
            yLabel := yLabel + BR.ReadChar;
          end;
        end;

      DataSetAliasMember:
        begin
          innerCode := BR.ReadInt16;
          length := BR.ReadInt16;
          alias := '';
          for c := 1 to length do
          begin
            alias := alias + BR.ReadChar;
          end;
        end;

      DataSetNameMember:
        begin
          innerCode := BR.ReadInt16;
          length := BR.ReadInt16;
          OriginalName := '';
          for c := 1 to length do
          begin
            OriginalName := OriginalName + BR.ReadChar;
          end;
        end;

      DataSetDataMember:
        begin
          innerCode := BR.ReadInt16;
          length32 := BR.ReadInt32;
          alias := '';
          for c := 1 to xLen do
          begin
            yValue[c] := BR.ReadDouble;
          end;
        end;

    else
      BR.ReadBytes(BlockSize);
    end;

  End;

  for c := 1 to xLen do
  begin
    xValue[c] := X0 + (c - 1) * xDelta;
  end;

  // xLen:=Xlen-1;
  BR.Close;
  BR.Free;
  AFile.Free
end;

procedure ReadBinarySPC(FileName: string; var xLen: Int32; var xValue, yValue: array of double);
var
  AFile: TMemoryStream;
  BR: TBinaryReader;
  i,a, Nolines, nula: Integer;
  line:Char;
  znak:String;
  conc: Double;
begin
AFile := TMemoryStream.Create;
AFile.LoadFromFile(filename);
BR := TBinaryReader.Create(AFile, TEncoding.ASCII, false);
i:=0;
//BR.BaseStream.Seek(19968,0);
BR.BaseStream.Seek(10240,0);
nula:=0;
I:=0;
 repeat
  i:=i+1;
  YValue[i]:=Br.Readdouble;
  if YValue[i]=0 then nula:=nula+1 else nula:=0;

 until nula=10;//XValue[i]=0;

xLen:=i-10;

//BR.BaseStream.Seek(10240,0);
for I := 1 to 5 do Br.ReadDouble;

for I := 1 to xLen do XValue[i]:=Br.ReadDouble;

BR.Close;
BR.Free;
AFile.Free
end;

procedure ReadBinarySpecord(FileName: string; var xLen: Int32; var xValue, yValue: array of double);
var
  AFile: TMemoryStream;
  BR: TBinaryReader;
  i,a, Nolines: Integer;
  line:Char;
  znak:String;
  conc: Double;
begin
AFile := TMemoryStream.Create;
AFile.LoadFromFile(filename);
BR := TBinaryReader.Create(AFile, TEncoding.ASCII, false);
i:=0;
for I := 0 to 30000 do
  begin
  znak:=BR.ReadChar;
  if (znak='[') and (BR.ReadChar='D') and (BR.ReadChar='A') then
    begin
    for a := 1 to 13 do BR.ReadChar;
    break;
    end;
  end;
I:=0;
 repeat
  i:=i+1;
  xValue[i]:=Br.ReadSingle;
 until (formatFloat('0.000',xValue[i])='868.157');

xLen:=i-1;
for a := 1 to 6 do BR.ReadChar;
for I := 1 to xLen do YValue[i]:=Br.ReadSingle;
BR.Close;
BR.Free;
AFile.Free
end;


function IsDiskWriteable(const AName: string): Boolean;
var
  FileName: String;
  H: THandle;
begin
  FileName := IncludeTrailingPathDelimiter(AName) + 'chk.tmp';
  H := CreateFile(PChar(FileName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    CREATE_NEW, FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE, 0);
  Result := H <> INVALID_HANDLE_VALUE;
  if Result then
    CloseHandle(H);
end;


function GetPointNum(x: array of double; nopoc,nokraj: Integer; pozX: double): integer;
var
  i, point: integer;
begin
  if ((x[NoPoc] < x[NoKraj]) and (pozX < x[NoPoc])) or
    ((x[NoPoc] > x[NoKraj]) and (pozX > x[NoPoc])) then
  begin
    Point := NoPoc;
    Exit;
  end;
  if ((x[NoPoc] < x[NoKraj]) and (pozX > x[NoKraj])) or
    ((x[NoPoc] > x[NoKraj]) and (pozX < x[NoKraj])) then
  begin
    Point := NoKraj;
    Exit;
  end;
  for i := NoPoc + 1 to NoKraj - 1 do
  begin
    if ((pozX < x[i + 1]) and (pozX > x[i - 1])) or
      ((pozX > x[i + 1]) and (pozX < x[i - 1])) then
    begin
      Point := i;
      break;
    end;
  end;
  Result:=Point;
end;

procedure AutoSizeCol(Grid: TStringGrid);
var
  Column, i, W, WMax: integer;
begin
  for Column := 2 to Grid.ColCount - 1 do
  begin
    WMax := 0;
    for i := 0 to (Grid.RowCount - 1) do
    begin
      W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
      if W > WMax then
        WMax := W;
    end;
    Grid.ColWidths[Column] := WMax + 8;
  end;
end;

Procedure Preuzmiboju(var boja: TColor; RB: integer);
begin
  case RB of
    0:      boja := ClBlack;
    1:      boja := ClBlue;
    2:      boja := ClRed;
    3:      boja := ClMaroon;
    4:      boja := ClGreen;
    5:      boja := ClOlive;
    6:      boja := ClPurple;
    7:      boja := ClTeal;
    8:      boja := ClGray;
    9:      boja := ClLime;
    10:      boja := ClSilver;
    11:      boja := ClYellow;
    12:      boja := ClFuchsia;
    13:      boja := ClBlack;
    14:      boja := ClBlue;
    15:      boja := ClRed;
    16:      boja := ClMaroon;
    17:      boja := ClGreen;
    18:      boja := ClOlive;
    19:      boja := ClPurple;
    20:      boja := ClTeal;
  end;
end;

procedure PeakfindMin(X,Y: array of double; INB, INE:Integer; var BrojPikova: Integer;var ipp:array of integer);
var
I: Integer;
begin
BrojPikova:=0;
for I := inb+2 to ine-2 do
  begin
  if (Y[i]<Y[i-2])and (Y[i]<Y[i-1]) and (Y[i]<Y[i+1]) and (Y[i]<Y[i+2]) then
    if (BrojPikova>0) and (x[i]>x[ipp[BrojPikova]]+20)then
    begin
     BrojPikova:=BrojPikova+1;
     ipp[BrojPikova]:=i;
    end else
    if BrojPikova=0 then
    begin
     BrojPikova:=BrojPikova+1;
     ipp[BrojPikova]:=i;
    end;
  end;
end;

Procedure TForm1.DoDownload(Source, Dest: String);
begin
   with TDownloadURL.Create(self) do
	 try
		 URL:=Source;
		 FileName := Dest;
		 ExecuteTarget(nil) ;
	 finally
		Free;
   end;
end;



procedure TForm1.ApplicationEvents1Hint(Sender: TObject);
begin
  Panel2.Caption := Application.Hint;
end;

procedure TForm1.AssignXvalue1Click(Sender: TObject);
begin
StringGrid2.RowCount:=CheckListBOx1.Items.Count+1;
Panel12.Height:=64+StringGrid2.RowCount*20;
Panel12.Visible:=True;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Panel12.Visible:=False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
StringGrid2.Cols[0].Clear;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
GroupBox5.Visible:=True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
GroupBox5.Visible:=False;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
XRes, YRes :Integer;
XXT, yyT,YHigh, Ylow, Xlow, XHigh : double;
aa,j,i, step,cc, Oznaceni,q: Integer;
ColorScaleHighMax, ColorScaleLowMin:Single;
begin

step:=SpinEdit6.Value;
  ColorScaleHighMax:=-1e13;
  ColorScaleLowMin:=1e10;
  Xlow:=RChart1.Scale1X.RangeLow;
  XHigh:=RChart1.Scale1X.RangeHigh;
  J:=0;
  For cc:=1 to NoPointsA[0] do
       IF (X[0,cc]>=XLow) and (X[0,cc]<=XHIgh) then j:=j+1;
  //j:=NoPointsA[0];
  Oznaceni:=0;
  for I:= 0 to CheckListBox1.Count-1 do if CheckListBox1.Checked[i] then Oznaceni:=Oznaceni+1;
  Xres:=Oznaceni;
  YRes:=j-1;
  Plot3D1.Clear;
  Plot3D1.SuppressPaint:=True;
  Plot3D1.Gridmat.Resize (XRes,round(YRes/step));
  aa:=0;


  for i:=1 to CheckListBox1.Count do
    if CheckListBox1.Checked[i-1] then
      begin
      j:=0;
      aa:=aa+1;
     // ShowMessage(FloatToStr(Y[i-1,1]));
      For cc:=1 to NoPointsA[i-1] do
       if ((cc mod step)=0) and (X[i-1,cc]>=XLow) and (X[i-1,cc]<=XHIgh) then
       begin
        //ShowMessage(FloatTostr(X[i-1,cc]));
        j:=j+1;
        if j=1 then Ylow:=X[i-1,cc];
        YHigh:=X[i-1,cc];
        YYT:=Y[i-1,cc];
        Plot3D1.GridMat.Elem[aa,j]:= YYT;
        if ColorScaleHighMax<YYT then ColorScaleHighMax:=YYT;
        if ColorScaleLowMin>YYT then ColorScaleLowMin:=YYT;
       end;
      end;

  //ShowMessage(FloatTostr(ColorScaleHighMax));
  if aa <10 then Plot3d1.MinTickX:=aa-2 else Plot3d1.MinTickX:=10;
  Plot3d1.CentX:=round(Plot3d1.Width/2);
  Plot3d1.Centy:=Plot3d1.height-round(Plot3d1.height/2);
  Plot3d1.ColorScaleLow:=ColorScaleLowMin;
  Plot3d1.ColorScaleHigh:=ColorScaleHighMax;
  //Plot3D1.AutoScale;
  Plot3D1.Magnification:=Screen.Height/800;
  Plot3D1.RangeZHigh:=ColorScaleHighMax+(ColorScaleHighMax-ColorScaleLowMin)*0.03;
  Plot3D1.RangeZlow:=ColorScaleLowMin-(ColorScaleHighMax-ColorScaleLowMin)*0.03;
  Plot3D1.RangeYlow:=Ylow;
  Plot3D1.RangeYHigh:=YHigh;
  Plot3D1.RangeXlow:=1;
  Plot3D1.RangeXHigh:=aa;
  //PageControl2.ActivePage:=TabSheet11;
    Plot3D1.SuppressPaint:=False;
//  Plot3d1.Show;
  //Plot3D1.Reset;
end;


procedure TForm1.Button6Click(Sender: TObject);
var
   a,i, lf, f, stp, od, ka, mwp, step, Nopnt: integer;
  xtemp, Ytemp, Yslp: Array [0 .. maxpoints] of double;

  WLimit: Double;
 bp: Integer;
ipp: array[0..50] of integer;
begin
 if CB_Fit_Gauss.Checked then
  begin
  DefGLW:=LabeledEdit6.text;
  DefGHW:=LabeledEdit7.text;
  end else
  begin
  DefSSLW:=LabeledEdit6.text;
  DefSSHW:=LabeledEdit7.text;
  end;
  if Files.Count = 0 then
    Exit;
ParManChanged:=False;
NoGChanged:=False;
  //Panel9.Visible:=True;
 wlimit:=StrToFloat(LAbeledEdit17.Text);
 stop := False;
  ProgressBar1.Visible := True;
  resetSP := True;
  lf := Files.Count - 1;
  ProgressBar1.max := NoPointsA[0];
  if sender=button6 then RChart1.ClearGraf;
  Form_Simul.Visible:=true;
 // for f := 0 to Files.Count - 1 do
 f:=CheckListBOx1.ItemIndex;
    if CheckListBox1.Checked[f] then
    begin
      lf := f;
      CheckListBox1.Selected[f] := True;
         // Progressbar1.Position:=f+1;
      ProgressBar1.update;
//      if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
  //      bl := false else bl := True;
      if resetSP then
      begin
        OpenFile(xtemp, Ytemp,  PathL[f],Nopnt,Files[f]);
        if CheckBox8.Checked then
          Reconstructspectra(xtemp, ytemp,Nopnt);
         if CheckBox15.Checked then
          TranslateLamp(xtemp,xtemp, 1, Nopnt, StrToFloat(Edit12.text));
        //if CB_Smooth.Checked then
          SGSmutiranje(ytemp, 1, Nopnt, 20);
        //if CheckBox8.Checked then
        //  LogTransform(x[f], Y[f],NoPointsA[f]);
       // if RB3.Checked then
       //   SubtractBlank(x[f], Y[f], NoPointsA[f],BlFIles[f])
       // ELSE if bl then
        //  SubtractBaseline(x[f], Y[f], NoPointsA[f]);
      end;
      step := round(2/(xtemp[2] - xtemp[1]));
      //ShowMEssage(IntToStr(step));
      //step:=1;
      mwp := 25; //120
      od := 0;
      ka := mwp;
      bp:=SpinEdit2.Value;
   if CheckBox13.Checked then
     begin
       for a := step to Nopnt do Yslp[a]:=ytemp[a];
       stp:=Nopnt;
     ProgressBar1.Visible := false;
      SGSmutiranje(Yslp, step, stp, 20);
      DeriveSG(Yslp, step, stp);
      SGSmutiranje(Yslp, step, stp, 20);
      DeriveSG(Yslp, step, stp);
      SGSmutiranje(Yslp, step, stp, 20);
      DeriveSG(Yslp, step, stp);

      PeakfindMin(xtemp,Yslp, step,stp, bp, ipp);
  // ShowMessage(intToStr(bp));
      for i := 1 to bp do if xtemp[ipp[i]]>StrToFloat(LabeledEdit7.text)-15 then bp:=bp-1;

     end;

      if bp=0 then bp:=3;
      for I := bp+1 to 6 do Form_Simul.SG_Fit_TAble.cols[i+1].Clear;
      SpinEdit2.Value:=bp;
       if CheckBox13.Checked then for i := 1 to bp do Form_Simul.SG_Fit_Table.Cells[i+1,3]:=formatFloat('0.0',xtemp[ipp[i]]-5);
       if sender=button6 then Form_Simul.SpinEdit1Change(sender);
      end;


  StringGrid1.Cells[2, f + 1] := FormatFloat('0.00000', vg[1]);
  StringGrid1.Cells[3, f + 1] := FormatFloat('0.00000', sg[1]);
  StringGrid1.Cells[6, f + 1] := FormatFloat('0.0000', vg[0]);

  StringGrid1.Cells[16, f + 1] := FormatFloat('0.0000', vg[2]); // Edit2.Text;
  for i := 0 to NoGauss - 1 do
  begin
    StringGrid1.Cells[6 * 3 + i * 3, f + 1] :=      FormatFloat('0.0000', vg[3 + 3 * i]); // Edit2.Text;
    StringGrid1.Cells[6 * 3 + i * 3 + 1, f + 1] :=       FormatFloat('0.00', vg[4 + 3 * i]); // Edit2.Text;
    StringGrid1.Cells[6 * 3 + i * 3 + 2, f + 1] :=     FormatFloat('0.0', vg[5 + 3 * i]); // Edit2.Text;
  end;
  ProgressBar1.Visible := false;
 if  CB_Fit_Gauss.Checked then
  begin
  //OptimizeLog(xtemp, Y, od, ka, 1, CB_Weighted.Checked);
 // Form_Simul.SG_Fit_TAble.Cells[1,1]:=FormatFloat('0.0000',vg[0]*0.85);
 // Form_Simul.SG_Fit_TAble.Cells[1,2]:=FormatFloat('0.0000',vg[1]);
 // Form_Simul.SG_Fit_TAble.Cells[1,3]:=FormatFloat('0',vg[2]);
 // ShowMessage(FormatFloat('0.0000',vg[1]));
  end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var
cl:TStrings;
i: Integer;
begin
  cl:=TStringList.Create;
  if Clipboard.HasFormat(CF_TEXT) then cl.Text:=Clipboard.AsText;
for I := 1 to StringGrid2.RowCount-1 do if i<=cl.Count then StringGrid2.Cells[0,i]:=cl[i-1];
  cl.Free;

end;

procedure TForm1.SaveAveragespectra1Click(Sender: TObject);
var
  i, a: integer;
  //PathL: double;
  fld, fn, Method, Xf, yf, ln, fmeth: String;
  f: textFile;
begin
//SaveDialog2.InitialDir:=ExtractFilePath(Files[0]);
//SaveDialog2.FileName:='_avg_'+ExtractFileName(Files[0]);
SaveDialog2.FilterIndex:=1;
if SaveDialog2.execute then
begin
    fn:=SaveDialog2.filename;
   // fn:=copy(fn,1,length(fn)-5);
    AssignFile(f, fn);
    Rewrite(f);
    //PathL := StrToFloat(LabeledEdit12.text);
    for i :=  NoPointsA[0] downto 1 do
    begin
      yf := FormatFloat('0.000000000', Yavg[i]);
      Xf := FormatFloat('0.0', xavg[i]);
      ln := Xf + #9 + yf;
      WriteLn(f, ln);
    end;
    CloseFile(f);
    SaveDialog2.InitialDir:=ExtractFilePath(SaveDialog2.FileName);
end;

end;

Procedure TForm1.SaveIniFIle;
var
  ProcedureIni: TIniFile;
  i: integer;
begin
  if IsDiskWriteable(ExtractFilepath(ParamStr(0))) = false then
  begin
    ShowMessage('Drive is not writable.' + #13 + #13 +
      'Default program parameters will be not saved!');
    Exit;
  end;
  ProcedureIni := TIniFile.Create(ExtractFilepath(ParamStr(0)) + 'ASFit.ini');
  // ProcedureIni := TIniFile.Create('SigCount.ini');
  ProcedureIni.WriteString('Procedure', 'Initial Dir', OpenDialog1.InitialDir);
  ProcedureIni.WriteString('Procedure', 'Cutoff', LabeledEdit14.text);
  ProcedureIni.WriteString('Procedure', 'CutoffH', LabeledEdit20.text);
  ProcedureIni.WriteInteger('Procedure', 'Smooth', SpinEdit1.Value);
  ProcedureIni.WriteBool('Procedure', 'Convert', CheckBox6.Checked);
  ProcedureIni.WriteString('Procedure', 'PathL', LabeledEdit12.text);
  ProcedureIni.WriteString('Procedure', 'LowWL', LabeledEdit4.text);
  ProcedureIni.WriteString('Procedure', 'HighWL', LabeledEdit5.text);
  ProcedureIni.WriteString('Procedure', 'MaxChHW', Form_Simul.LabeledEdit19.text);
  ProcedureIni.WriteString('Procedure', 'MaxChpos', Form_Simul.LabeledEdit18.text);
  ProcedureIni.WriteString('Procedure', 'LeftNode', LabeledEdit15.text);
  ProcedureIni.WriteString('Procedure', 'RightNode', LabeledEdit16.text);

  ProcedureIni.WriteString('Procedure', 'S1L', DefSSLW);
  ProcedureIni.WriteString('Procedure', 'S1R', DefSSHW);
  ProcedureIni.WriteString('Procedure', 'G1L', DefGLW);
  ProcedureIni.WriteString('Procedure', 'G1R', DefGHW);
  ProcedureIni.WriteString('Procedure', 'S2L', LabeledEdit8.text);
  ProcedureIni.WriteString('Procedure', 'S2R', LabeledEdit9.text);

  ProcedureIni.WriteString('Procedure', 'WL1', LabeledEdit1.text);
  ProcedureIni.WriteString('Procedure', 'WL2', LabeledEdit2.text);
  ProcedureIni.WriteString('Procedure', 'WL3', LabeledEdit3.text);
  ProcedureIni.WriteString('Procedure', 'WL4', LabeledEdit18.text);
  ProcedureIni.WriteString('Procedure', 'WL5', LabeledEdit19.text);
  ProcedureIni.WriteString('Procedure', 'WL6', LabeledEdit21.text);
  for i := 2 to 32 do
  begin
    if i<15 then ProcedureIni.WriteBool('Table', 'Col' + intToStr(i),PopupMenu1.Items[i].Checked)
      else ProcedureIni.WriteBool('Table', 'Col' + intToStr(i),false);
  end;

  ProcedureIni.Free;
end;

procedure TForm1.Savetreatedspectra1Click(Sender: TObject);
var
  i, a: integer;
  //PathL: double;
  fld, fn, Method, Xf, yf, ln, fmeth: String;
  f: textFile;
begin
//SaveDialog2.InitialDir:=ExtractFilePath(Files[0]);
SaveDialog2.FilterIndex:=2;
SaveDialog2.FileName:=ExtractFileName(Files[CheckListBox1.itemindex]);
if SaveDialog2.execute then
begin
    fn:=SaveDialog2.filename;
   // fn:=copy(fn,1,length(fn)-5);
    AssignFile(f, fn);
    Rewrite(f);
    //PathL := StrToFloat(LabeledEdit12.text);
    for i :=  NoPointsA[CheckListBox1.itemindex] downto 1 do
    begin
      yf := FormatFloat('0.000000000', y[CheckListBox1.itemindex,i]);
      Xf := FormatFloat('0.0', x[CheckListBox1.itemindex,i]);
      ln := Xf + #9 + yf;
      WriteLn(f, ln);
    end;
    CloseFile(f);
    SaveDialog2.InitialDir:=ExtractFilePath(SaveDialog2.FileName);
end;

end;

Procedure TForm1.OpenIniFIle;
var
  ProcedureIni: TIniFile;
  i: integer;
begin

  ProcedureIni := TIniFile.Create(ExtractFilepath(ParamStr(0)) + 'ASFit.ini');
  OpenDialog1.InitialDir := ProcedureIni.ReadString('Procedure',
    'Initial Dir', 'c:\');
  // SpinEdit1.Value:=ProcedureIni.ReadInteger('Procedure', 'Smooth', 15);
//  version:=ProcedureIni.ReadString('Procedure', 'Version', '1000');
  LabeledEdit12.text:=ProcedureIni.ReadString('Procedure', 'PathL', '0.1');
  LabeledEdit4.text:= ProcedureIni.ReadString('Procedure', 'LowWL', '550');
  LabeledEdit5.text:= ProcedureIni.ReadString('Procedure', 'HighWL', '600');

    LabeledEdit14.text := ProcedureIni.ReadString('Procedure', 'Cutoff', '50');
  LabeledEdit20.text := ProcedureIni.ReadString('Procedure', 'CutoffH', '700');
//  ShowMessage(LabeledEdit5.text);
  LabeledEdit1.text:=ProcedureIni.ReadString('Procedure', 'WL1', '254');
  LabeledEdit2.text:=ProcedureIni.ReadString('Procedure', 'WL2', '280');
  LabeledEdit3.text:=ProcedureIni.ReadString('Procedure', 'WL3', '325');
  LabeledEdit18.text:=ProcedureIni.ReadString('Procedure', 'WL4', '355');
  LabeledEdit19.text:=ProcedureIni.ReadString('Procedure', 'WL5', '412');
  LabeledEdit21.text:=ProcedureIni.ReadString('Procedure', 'WL6', '440');
  Form_Simul.LabeledEdit18.text:=ProcedureIni.ReadString('Procedure', 'MaxChpos', '40');
  Form_Simul.LabeledEdit19.text:=ProcedureIni.ReadString('Procedure', 'MaxChHW', '60');
  LabeledEdit15.text:=ProcedureIni.ReadString('Procedure', 'LeftNode', '326');
  LabeledEdit16.text:=ProcedureIni.ReadString('Procedure', 'RightNode', '386');

  LabeledEdit6.text:=ProcedureIni.ReadString('Procedure', 'S1L', '275');
  if LabeledEdit6.text='' then LabeledEdit6.text:='275';
  LabeledEdit7.text:=ProcedureIni.ReadString('Procedure', 'S1R', '295');
  if LabeledEdit7.text='' then LabeledEdit7.text:='295';
  LabeledEdit8.text:=ProcedureIni.ReadString('Procedure', 'S2L', '350');
  LabeledEdit9.text:=ProcedureIni.ReadString('Procedure', 'S2R', '400');
  DefGLW:=ProcedureIni.ReadString('Procedure', 'G1L', '245');
  DefGHW:=ProcedureIni.ReadString('Procedure', 'G1R', '450');
  if DefGLW='' then DefGLW:='245';
  if DefGHW='' then DefGHW:='450';
  DefSSLW:=LabeledEdit6.text;
  DefSSHW:=LabeledEdit7.text;
  CheckBox6.Checked:=ProcedureIni.ReadBool('Procedure', 'Convert', True);
  for i := 2 to 32 do
  begin
    PopupMenu1.Items[i].Checked := ProcedureIni.rEADBool('Table',
      'Col' + intToStr(i), True);
  end;

  ProcedureIni.Free;
end;


Procedure TForm1.Reconstructspectra(var xr, yr: array of double; np: integer);
var
  left, Right, fq: double;
  i, Tocka1, tocka2: integer;
  ReconFit: TCurveFit;
  ns: Boolean;
  koef: array [0 .. 10] of double;
begin
  left := StrToInt(LabeledEdit15.Text);
  Right := StrToInt(LabeledEdit16.Text);
  for i := 0 to 10 do
    koef[i] := 0;

  Tocka1:=GetPointNum (xr, 1, np, Left);
  Tocka2:= GetPointNum(xr, 1, np, right);
  ReconFit := TCurveFit.Create(nil);

  ReconFit.init;
  for i := Tocka1 - 15 to Tocka1 do
    ReconFit.EnterStatValue(xr[i], yr[i]);
  for i := tocka2 to tocka2 + 25 do
    ReconFit.EnterStatValue(xr[i], yr[i]);
  ReconFit.CalcPolyFit(3, koef, fq, ns);

  for i := Tocka1 to tocka2 do
    yr[i] := koef[4] * xr[i] * xr[i] * xr[i] * xr[i] + koef[3] * xr[i] * xr[i] *
      xr[i] + koef[2] * xr[i] * xr[i] + koef[1] * xr[i] + koef[0];
end;



Procedure TForm1.LogTransform(var xr, yr: array of double; np: integer);
var
  i: integer;
begin
//for i := 1 to np do
  //  if yr[i]>0 then yr[i]:= log10(yr[i]) else yr[i]:= yr[i-1];
end;

procedure TForm1.MakeAveragespectraselected1Click(Sender: TObject);
var
//XTmp, YTmp: array[0..3000] of double;
i,j,  a, NoSelected: Integer;
begin
//OpenFile(x[i], Y[i],NoPointsA[i], Files[i]);

for I:= 1 to NoPointsA[0] do  YAvg[i]:=0;
for I:= 1 to NoPointsA[0] do  xAvg[i]:=X[0,i];
NoSelected:=0;
for a := 0 to CheckListBox1.Items.count-1 do
  if CheckListBox1.Checked[a] then
  begin
  NoSelected:=NoSelected+1;
   for I:= 1 to NoPointsA[a] do Yavg[i]:=Yavg[i]+Y[a,i];
  end;

for I:= 1 to NoPointsA[0] do Yavg[i]:=Yavg[i]/NoSelected;
NacrtajGraf(RChart1,xavg, yavg, 1, NoPointsA[0], ClLime, CheckBox5.Checked, True, True, CheckBox3.Checked, True);
end;


Procedure TForm1.Normalize(var xr, yr: array of double; np: integer;wl: double);
var
p, i: integer;
yn: Double;
begin
wl:=round(wl);
p:=GetPointNum(xr,0,np,wl);

if (wl<xr[0]) or(wl>xr[np]) then  exit;

{for i := 1 to np do
    if abs((xr[i]-wl))=0 then
      begin
      p:=i;
      break;
      end;}
yn:=abs(yr[p]);
for i := 1 to np do yr[i]:= yr[i]/yn;
end;





Procedure TForm1.SGSmutiranje(var Y: array of double;  NoPoc, NoKraj, m: integer);
var
  e, a, NoPeaksTemp, W, i, m2, mip: integer;
  dolje, Ytemps, max, min, MP, raspon: double;
  Ytemp: Array [-500 .. maxpoints] of single;
  sgKoef: array [-50 .. 50] of integer;
  ext: TcurveFit;
  k0, k1, k2, fq: Double;
  log: Boolean;
begin
if m>=3 then
  begin
mip:=0;
for e := NoPoc to NoKraj do
  if Y[e]<0 then mip:=mip+1;
log:=True;
if (mip/(nokraj-nopoc))>0.1 then log:=False;
//ShowMessage(IntToStr(mip)+' '+IntToStr(nokraj-nopoc));
//if log=false then Showmessage('nolog');

if log then
 for e := NoPoc to NoKraj do
  if Y[e]>0 then Y[e]:=ln(Y[e]) else Y[e]:=Y[e-1];

ext:=TCurveFIt.Create(nil);
ext.Init;
for e := NoPoc to noPoc+m do ext.EnterStatValue(e,Y[e]);
Ext.CalcParabolFit(k0, k1, k2, fq);
for e := NoPoc-m-1 to noPoc-1 do
   begin
   Y[e]:=k0+k1*e+k2*e*e;
   end;
ext.Init;
for e := Nokraj-m to NoKraj do ext.EnterStatValue(e,Y[e]);
Ext.CalcParabolFit(k0, k1, k2, fq);
for e := NoKraj+1 to NoKraj+m+1 do
   begin
   Y[e]:=k0+k1*e+k2*e*e;
   end;
   ext.Free;
  end;

if m>=3 then m2:=0 else m2:=m;

for e := NoPoc+m2 to NoKraj-m2 do
  begin
    Ytemps := 0;
    for a := -m to m do
    begin
      sgKoef[a] := 3 * m * m + 3 * m - 1 - 5 * a * a;
      Ytemps := Ytemps + sgKoef[a] * Y[e + a];
    end;
    dolje := (2 * m + 3) * (2 * m + 1) * (2 * m - 1) / 3;
    Ytemp[e] := Ytemps / dolje;
  end;

  for e := NoPoc+m2 to NoKraj-m2 do
  begin
    if log then Y[e] := exp(Ytemp[e]) else Y[e] := Ytemp[e];
  end;
 //ShowMessage('ok');
end;

procedure TForm1.DeriveSG(var Y: array of double; poc, kraj: integer);
var
  i,e: integer;
  CurDer: array [0 .. maxpoints] of double;
  dx: double;
  ext: TcurveFit;
  k0, k1, k2, fq: Double;
begin

ext:=TCurveFIt.Create(nil);
ext.Init;
for e := poc to poc+4 do ext.EnterStatValue(e,Y[e]);
Ext.CalcParabolFit(k0, k1, k2, fq);
for e := poc-4-1 to poc-1 do
  begin
  Y[e]:=k0+k1*e+k2*e*e;
  end;
ext.Init;
for e := kraj-4 to kraj do ext.EnterStatValue(e,Y[e]);
Ext.CalcParabolFit(k0, k1, k2, fq);
for e := kraj+1 to kraj+4+1 do
  begin
  Y[e]:=k0+k1*e+k2*e*e;
  end;
ext.Free;


 // For i := poc + 4 to kraj - 4 do
    For i := poc  to kraj  do
    CurDer[i] := (4 * (Y[i + 4] - Y[i - 4]) + 3 * (Y[i + 3] - Y[i - 3]) + 2 *
      (Y[i + 2] - Y[i - 2]) - Y[i - 1] + Y[i + 1]);

  For i := poc to kraj do
  begin
    Y[i] := -CurDer[i];
  end;
end;

procedure TForm1.RChart1Click(Sender: TObject);
begin
//SubtractBaselineMoving(x[0], Y[0], RChart1.MousePosX,NoPointsA[0]);
end;

procedure TForm1.RChart1DblClick(Sender: TObject);
begin
  Plotallspectra1Click(self);
  RChart1.autorange(1, 5);
  RChart1.SuppressPaint:=False;
  moving := false;
end;

procedure TForm1.RChart1MouseLeave(Sender: TObject);
begin
  RChart1.CrossHairSetPos(1, 50, -100);
  RChart2.CrossHairSetPos(1, 50, -100);
  RChart3.CrossHairSetPos(1, 50, -100);

end;

procedure TForm1.RChart1MouseMoveInChart(Sender: TObject; InChart: Boolean;
  Shift: TShiftState; rMousePosX, rMousePosY: double);
begin
  if InChart then
  begin
    RChart1.CrossHairSetPos(1, rMousePosX, rMousePosY);
    RChart2.CrossHairSetPos(1, rMousePosX, rMousePosY);
    RChart3.CrossHairSetPos(1, rMousePosX, rMousePosY);
    Form2.RChart1.CrossHairSetPos(1, rMousePosX, rMousePosY);
    Panel2.Caption := 'WL = ' + FormatFloat('0.0', rMousePosX) + ',  a = ' +
      FormatFloat('0.00000', rMousePosY);

  end;
  if Translating  and (ssLEft in Shift) then
   begin
   TranslateManual(x[CheckListBox1.itemindex],y[CheckListBox1.itemindex],0,NoPointsA[CheckListBox1.itemindex],center,RChart1.MousePosX,RChart1.MousePosY);
   end;
end;

procedure TForm1.TranslateManual(XRot,YRot:array of double; NoPoc, NoKraj: Integer; center, XRight, YRight: Double);
var
piki,i,NoPointsTemp: Integer;
q, FixX, FIxY: Double;
YYF,XTmp,Ytmp,ZTmp:array[0..4000] of Double;
Postotak: Double;
begin
if Xrot[NoPoc]<Xrot[NoKraj] then if center<Xrot[NoPoc] then center:=Xrot[NoPoc+2];
if Xrot[NoPoc]<Xrot[NoKraj] then if center>Xrot[NoKraj] then center:=Xrot[NoKraj-2];
if Xrot[NoPoc]>Xrot[NoKraj] then if center>Xrot[NoPoc] then center:=Xrot[NoPoc+2];
if Xrot[NoPoc]>Xrot[NoKraj] then if center<Xrot[NoKraj] then center:=Xrot[NoKraj-2];

for i:= NoPoc to NoKraj-1 do
if ((XRot[i]<=center) and (XRot[i+1]>=center) and (XRot[i+1]>=XRot[i])) or
 ((XRot[i]>=center) and (XRot[i+1]<=center)and (XRot[i]>=XRot[i+1]))
then
begin
favL:= i;
//center:= i;
break;
end;

if XRot[NoPoc]>XRot[NoKraj] then if center<=XRot[NoKraj] then favL:=NoKraj;
if XRot[NoPoc]<XRot[NoKraj] then if center>=XRot[NoKraj] then favL:=NoKraj;
if XRot[NoPoc]<XRot[NoKraj] then if center<=XRot[NoPoc] then favL:=NoPoc;
if XRot[NoPoc]>XRot[NoKraj] then if center>=XRot[NoPoc] then favL:=NoPoc;

if FavL<NoPoc then FavL:=NoPoc;
if FavR>NoKraj then FavR:=NoKraj;
//YStartTranslate:=YRot[FAvL];


for i:= Nopoc to NoKraj do
  begin
  if i>favL then YYF[i]:=YRot[i]-(YStartTranslate-YRight)
  else YYF[i]:=YRot[i];
  end;

RChart1.ClearGraf;
RCHArt1.MarkAt(XRot[FAvL],YRot[FAvL],24 );
NacrtajGraf(RChart1,XRot, YYF, Nopoc, NoKraj, clBlack, CheckBox5.Checked, True,
          false, false, true);
          RCHArt1.ShowGraf;
end;

procedure TForm1.TranslateLamp(var XRot,YRot:array of double; NoPoc, NoKraj: Integer; Position: Double);
var
piki,i,NoPointsTemp: Integer;
q, FixX, FIxY: Double;
//YYF,XTmp,Ytmp,ZTmp:array[0..4000] of Double;
delta: Double;
begin

for i:= NoPoc to NoKraj-1 do
if ((XRot[i]<=Position) and (XRot[i+1]>=Position) and (XRot[i+1]>=XRot[i])) or
 ((XRot[i]>=Position) and (XRot[i+1]<=Position)and (XRot[i]>=XRot[i+1]))
then
begin
favL:= i;
break;
end;

if (XRot[favL]<XRot[favL+1]) then delta:=((YRot[favL-5]+YRot[favL])/2-4*((YRot[favL-5]-YRot[favL])/6))-((YRot[favL+6]+YRot[favL+1])/2+3*((YRot[favL+1]-YRot[favL+6])/6))else delta:=0;//(YRot[favL-10]-YRot[favL])/5;

for i:= Nopoc to NoKraj do
  begin
  if i<=favL then YRot[i]:=YRot[i]-delta;
  end;
end;



procedure TForm1.RChart1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; xx, yY: integer);
var
i: Integer;
 begin
  if (Button = mbright) and (CheckBox2.Checked) then
  begin
  Plotallspectra1Click(self);
    AbsAtPos(RChart1.MousePosX);
  end;
  // moving:=False;
RChart1.MouseAction:=SDL_sdlBase.maZoomWindPos;
 if Translating then
  begin
  Translating:=False;
  for i:= 0 to NoPointsA[CheckListBox1.itemindex] do
   begin
   if i>favL then y[CheckListBox1.itemindex,i]:=y[CheckListBox1.itemindex,i]-(YStartTranslate-RChart1.MousePosY);

   end;
   NacrtajGraf(RChart1,x[CheckListBox1.itemindex], Y[CheckListBox1.itemindex], 1, NoPointsA[CheckListBox1.itemindex], ClBlack, CheckBox5.Checked, True, True, false, true);
   //RChart1.ShowGraf;
  end;
end;

procedure TForm1.RChart1ZoomPan(Sender: TObject);
begin
  CheckBox3.Checked := false;
  // moving:=True;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
var
  f: textFile;
  i, prevFiles: integer;
begin
  if OpenDialog1.Execute then
  begin
    //CheckListBox1.Clear;
    resetSP := True;
    prevFiles:=FIles.Count+1;
    Files.AddStrings(OpenDialog1.Files);
    NoFIles := Files.Count;
    StringGrid1.RowCount := Files.Count + 1;
    StringGrid2.RowCount:=StringGrid1.RowCount;
    for i := 1 to NoFIles do
      StringGrid1.Rows[i].Clear;
    for i := prevFiles to NoFIles do
    begin
      CheckListBox1.Items.Add(ExtractFIleName(Files[i - 1]));
      CheckListBox1.Checked[CheckListBox1.Items.Count - 1] := True;
      Preuzmiboju(boja[i - 1], i - 1);
      pathL[i-1]:=StrToFloat(LabeledEdit12.Text);
    end;
    CheckListBox1.ItemIndex := 0;
    ProgressBar1.max := NoFIles;
    Panel7.Enabled := True;
    Label5.Caption := 'Number of files: ' + intToStr(NoFIles);
    OpenDialog1.InitialDir := ExtractFilepath(Files[prevFiles-1]);
    Plotallspectra1Click(Self);
  end;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var
  lw1, rw1, i, od, ka, a, f, stp, lf, mwp, step,sg: integer;
  Ytemp: Array [0 .. maxpoints] of double;
  bl: Boolean;
  fn, fld, Xf, yf, lin, fmeth: String;
  fl: textFile;
  WLimit: Double;
begin
  if Files.Count = 0 then  Exit;
startTime := now;
  Panel9.Visible:=True;
  if CB_Save_Slp.Checked then
  begin
  fmeth := '_movingS\';
  fld := ExtractFilepath(Files[0]) + fmeth;
  if DirectoryExists(fld) = false then
    if not CreateDir(fld) then
      raise Exception.Create('Error creating folders: ' + fld);
  end;
 wlimit:=StrToFloat(LAbeledEdit17.Text);
 stop := False;
 ProgressBar1.Position:=0;
  ProgressBar1.Visible := True;
  resetSP := True;
  lf := Files.Count - 1;
  ProgressBar1.max := NoPointsA[0];
  RChart1.ClearGraf;

  for f := 0 to Files.Count - 1 do
    if CheckListBox1.Checked[f] then
    begin
      lf := f;
      CheckListBox1.Selected[f] := True;
      Application.ProcessMessages;
      if stop then
        break;

      // Progressbar1.Position:=f+1;
      ProgressBar1.update;
      if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
        bl := false
      else
        bl := True;
      if resetSP then
      begin
        OpenFile(x[f], Y[f],  PathL[f],NoPointsA[f],Files[f]);
        if CheckBox8.Checked then
          Reconstructspectra(x[f], Y[f],NoPointsA[f]);
        if CheckBox15.Checked then
          TranslateLamp(x[f], Y[f],1, NoPointsA[f], StrToFloat(Edit12.text));
        if CB_Smooth.Checked then
          SGSmutiranje(Y[f], 1, NoPointsA[f], SpinEdit1.Value);
        if CheckBox8.Checked then
          LogTransform(x[f], Y[f],NoPointsA[f]);
        if RB3.Checked then
          SubtractBlank(x[f], Y[f],Ybl[f], NoPointsA[f],BlFIles[f])
        ELSE if bl then
          SubtractBaseline(x[f], Y[f], Ybl[f], NoPointsA[f]);
      end;
      step := round(x[f, 2] - x[f, 1]) * 10;

      mwp := StrToInt(LabeledEdit13.text);
      stp:=round(mwp/10);
      //stp:=1;
      od := 0;
      ka := mwp;
      for a := 1 to NoPointsA[f]-mwp do
      //if a mod stp = 0 then
      begin
      Application.ProcessMessages;
      //if a mod 3 = 0 then ka:=ka+2;
      if stop then  break;
        od := od + 1;
        ka := ka + 1;
        if (Y[f, a] < 0.00001) or (x[f, a] > wlimit) then
          break; // X[f,nopoints-mwp-1]
        stp := a;
        // Edit3.Text:=IntTostr(od);
        // Edit4.Text:=IntTostr(ka);
         if CheckBox1.Checked then OptimizeLog(x[f], Y[f], od, ka, 1, false) else OptimizeOne(x[f], Y[f], od, ka, 1, false);
        if a mod 10 = 0 then
          ProgressBar1.Position := a;
        if CheckBox1.Checked then Ytemp[a] := vg[1] else Ytemp[a] := vg[2];
      end;// else Ytemp[a] := Ytemp[a-1];


     NoPointsA[f]:=stp;
      //for a := stp to NoPointsA[f] do
      //  Ytemp[a] := 0;
      for a := 1 to NoPointsA[f] do
        Y[f, a] := Ytemp[a];
      if CheckBox12.Checked then
          SGSmutiranje(Y[f], 1, NoPointsA[f], SpinEdit1.Value+5);

      if CB_Derivative.Checked then
        begin
        DeriveSG(Y[f], 1, NoPointsA[f]);
        if SpinEdit5.value=2 then
          begin
          if CB_Smooth.Checked then SGSmutiranje(Y[f], 1, NoPointsA[f], SpinEdit1.Value);
          DeriveSG(Y[f], 1, NoPointsA[f]);
          end;
        end;

      if f = 0 then
        NacrtajGraf(RChart1,x[f], Y[f], 1, NoPointsA[f], boja[f], CheckBox5.Checked, True,
          True, false, false)
      else
        NacrtajGraf(RChart1,x[f], Y[f], 1, NoPointsA[f], boja[f], CheckBox5.Checked, True,
          false, false, false);
     if CB_Smooth.Checked then sg:=SpinEdit1.Value else sg:=0;

      if CB_Save_Slp.Checked then
      begin
        //fld := ExtractFilepath(Files[f]);
        fn := ChangeFileExt(ExtractFIleName(Files[f]), '.slp');
        fn := fld + '_movS_w'+Labelededit13.Text+'_SG'+inttosTR(sg) +'_'+ fn;
        AssignFile(fl, fn);
        Rewrite(fl);
        for i := 1 to NoPointsA[f] do
        begin
          yf := FormatFloat('0.000000000', Y[f, i]);
          Xf := FormatFloat('0.0', x[f, i]);
          lin := Xf + #9 + yf;
          WriteLn(fl, lin);
        end;
        CloseFile(fl);
      end;

    end;
  NacrtajGraf(RChart1,x[lf], Y[lf], 1, NoPointsA[f], boja[lf], CheckBox5.Checked, True,
    false, True, True);;
  ProgressBar1.Visible := false;
  resetSP := false;
  Panel9.Visible:=False;
  endTime := now;
  Label1.Caption := 'Calculation time: ' + FormatFloat('0.00 s',
    (endTime - startTime) * 86400);
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
if PageControl1.TabIndex=0 then RChart1.CopyToClipboard(false) else
      Plot3d1.CopyToClipboard(false);
end;

procedure TForm1.DifferencePeaks(xd, yd: array of double; od, ka: integer;
  var Nopiks: integer; var pikpos: array of integer; var PikH: array of double);
var
  a, i: integer;
  xtemp, Ytemp, yder: Array [0 .. maxpoints] of double;
  // max:array[0..5] of integer;
  maxtemp: double;
begin
  for a := od to ka do
  begin
    Ytemp[a] := yd[a];
    xtemp[a] := xd[a];
  end;
  OptimizeOne(xtemp, Ytemp, od, ka, 1, false);
  vg[0] := Ytemp[od];
  // ShowMessage(FloatToStr(vg[1]));
  vg[1] := vg[1] * 1.2;

  for a := od to ka do
  begin
    Ytemp[a] := vg[0] * exp(-vg[1] * (xtemp[a] - xtemp[od]));
    yder[a] := -(yd[a] - Ytemp[a]);
  end;

  // NacrtajGraf(xtemp, ytemp, od, ka,clRed,CheckBox5.Checked,true, false,false, false);;
  SGSmutiranje(yder, od, ka, 15);
  DeriveSG(yder, od, ka);
  SGSmutiranje(yder, od, ka, 15);
  DeriveSG(yder, od, ka);
  // NacrtajGraf(xd, yder, od, ka,clBlue,CheckBox5.Checked,true, true,CheckBox3.Checked, true);;

  Nopiks := 0;
  pikpos[0] := -10;
  for a := od + 10 to ka - 20 do
  begin
    if (yder[a] > yder[a - 3]) and (yder[a] > yder[a - 2]) and
      (yder[a] > yder[a - 1]) and (yder[a] > yder[a + 1]) and
      (yder[a] > yder[a + 2]) and (yder[a] > yder[a + 3]) then
      if ((yd[a] - Ytemp[a]) > yd[od] * 0.05) and ((a - pikpos[Nopiks]) > 20)
      then
      begin
        Nopiks := Nopiks + 1;
        pikpos[Nopiks] := a;
        PikH[Nopiks] := (yd[a] - Ytemp[a]) * 0.8;
      end;
    if xd[a] > 380 then
      break;
  end;
  // for I := 1 to nopiks do ShowMessage(FloatToStr(abs(yd[pikpos[i]]-ytemp[pikpos[i]])));

end;

procedure TForm1.Edit11Change(Sender: TObject);
begin
if StrToFloat(Edit11.text)>x[1,0] then Plotallspectra1Click(CheckBox5);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  f: textFile;
  i: integer;
begin
  if OpenDialog1.Execute then
  begin
    resetSP := True;
    CheckListBox1.Clear;
    BlFIles.Clear;
    ListBox1.Clear;
    FilenameEdit1.Clear;
    CheckBox3.Checked := True;
    CheckBox14.Checked := False;
    CheckBox7.State := cbChecked;
    CheckBox7.Caption := 'Unselect All';
    // CheckBox8.Checked:=False;
    RB0.Checked := True;
    Files.Clear;

    Files.CommaText := OpenDialog1.Files.CommaText;
    NoFIles := Files.Count;
    StringGrid1.RowCount := Files.Count + 1;
    StringGrid2.RowCount:=StringGrid1.RowCount;
    for i := 1 to NoFIles do
      StringGrid1.Rows[i].Clear;
    Form1.Caption := 'ASFit - ' + ExtractFilepath(Files[0]);
    OpenDialog1.InitialDir := ExtractFilepath(Files[0]);
    Panel7.Enabled := True;
    for i := 1 to NoFIles do
    begin
      CheckListBox1.Items.Add(ExtractFIleName(Files[i - 1]));
      CheckListBox1.State[CheckListBox1.Items.Count - 1] := cbChecked;
      pathL[i-1]:=StrToFloat(LabeledEdit12.Text);
      // .Checked[CheckListBox1.items.Count-1]:=True;
      Preuzmiboju(boja[i - 1], i - 1);
    end;
    CheckListBox1.ItemIndex := 0;
    ProgressBar1.max := NoFIles;

    Label5.Caption := 'Number of files: ' + intToStr(NoFIles);

    RChart1.Caption := CheckListBox1.Items[0];

    Plotallspectra1Click(Self);
  end;
end;

procedure TForm1.OpenFile(var xout, yout: array of double; pathLen: double; var np:Integer; Fname: String);
var
  f: textFile;
  i, a, e, mip: integer;
  xt, yt, s1, wlstart, wlend, fkt,fktx: double;
  line: String;
  reverse, volt: Boolean;
  nop: Int32;
  Str: TStringList;
  xtmp, ytmp, xbn, ybn: array [0 .. maxpoints] of double;
  ds: Char;
  FS: TFormatSettings;
  data: TStringList;
begin
  wlstart := StrToFloat(LabeledEdit14.text);
  wlend := StrToFloat(LabeledEdit20.text);
  //if Checkbox16.Checked then wlstart := 1240/wlstart;
  //if Checkbox16.Checked then wlend := 1240/wlend;
  //ShowMessage(FloatToStr(wlstart));
 volt:=false;
 ds:=',';
 memo3.Clear;
 //tabsheet3.TabVisible:=False;
 pageCOntrol1.ActivePageIndex:=0;
 FS:=TFOrmatSettings.Create;
 data:=TStringlist.Create;
 data.StrictDelimiter:=True;
 Data.Delimiter:=#9;
  //wlstart:=190;
  if lowercase(ExtractFileExt(Fname)) = '.sp' then
  begin
    ReadBinaryPE(Fname, nop, xbn, ybn);
    np := nop;
    i := 0;
    for a := 1 to np do
      if (xbn[a] <> 0) and (xbn[a] >= wlstart) and (xbn[a] <= wlend)then
      begin
        i := i + 1;
        xtmp[i] := xbn[a];
        ytmp[i] := ybn[a];
      end;
    np := i;
  end;

  if lowercase(ExtractFileExt(Fname)) = '.spc' then
  begin
    ReadBinarySPC(Fname, nop, xbn, ybn);

    np := nop;
    i := 0;
    for a := 1 to np do
      if (xbn[a] <> 0) and (xbn[a] >= wlstart) and (xbn[a] <= wlend)then
      begin
        i := i + 1;
        xtmp[i] := xbn[a];
        ytmp[i] := ybn[a];
      end;
    np := i;
  end;
//ShowMessage(FloatToStr(np)+' '+FloatToStr(xbn[1]));

  if lowercase(ExtractFileExt(Fname)) = '.dat' then
  begin
    ReadBinarySpecord(Fname, nop, xbn, ybn);

    np := nop;
    i := 0;
    for a := 1 to np do
      if (xbn[a] <> 0) and (xbn[a] >= wlstart) and (xbn[a] <= wlend)then
      begin
        i := i + 1;
        xtmp[i] := xbn[a];
        ytmp[i] := ybn[a];
      end;
    np := i;
     //ShowMessage(IntToStr(np));
  end;


 if lowercase(ExtractFileExt(Fname)) = '.csv' then    //cary4
  begin
   AssignFile(f, Fname);
    reset(f);
    str:=TStringList.Create;
    //str.Delimiter:=',';
    //str.StrictDelimiter:=True;
    readln(f, line);
    if copy(line, 1, 1)<>'W' then readln(f, line);
    i:=0;
    while not eof(f) do
    begin
    readln(f,line);
    if line='' then break;
    Str.DelimitedText:=Line;
    if (StrToFloat(str[0])>= wlstart) and (StrToFloat(str[0])<= wlend) then
     begin
     i:= i + 1;
     xtmp[i] := StrToFloat(str[0]);
     ytmp[i] := StrToFloat(str[1]);
     end;

    end;
      np := i;

     CloseFile(f);
    end;


 if (lowercase(ExtractFileExt(Fname))<>'.sp') and (lowercase(ExtractFileExt(Fname))<>'.csv') and (lowercase(ExtractFileExt(Fname))<>'.dat') and (lowercase(ExtractFileExt(Fname))<>'.spc') then
  begin
    AssignFile(f, Fname);
    reset(f);
    i := 0;
    AboutBox.Memo1.Clear;
    a := 0;
    fkt:=1;
    fktx:=1;
    if (lowercase(ExtractFileExt(Fname)) = '.oew') or (lowercase(ExtractFileExt(Fname)) = '.vmd') then
      begin
      volt:=true;
        readln(f, line);
        readln(f, line);
        fkt:=1e9;
        fktx:=1e3;
      end;


    if ExtractFileExt(Fname) = '.txt' then
      while (line <> 'XYDATA') do
      begin
        readln(f, line);
        AboutBox.Memo1.Lines.Add(line);
        a := a + 1;
          if line='Wavelenght	CDPIni' then a:=0;
        if line='[HEADER]' then
          repeat
          a:=0;
         // tabsheet3.TabVisible:=True;
          readln(f, line);
          memo3.Lines.Add(line);
          until line='[DATA]';
        // ShowMessage(copy(line, 1, 1) );
        if copy(line, 1, 1)='"' then
          begin
          a:=0;
          readln(f, line);
          FS.DecimalSeparator:= ds;
          FS.ThousandSeparator := '.';
          System.SysUtils.FormatSettings := FS;
          Application.UpdateFormatSettings := False;
          break;
          end;
        if AboutBox.Memo1.Lines[0] <> 'TITLE	' then
          begin
          a:=0;
          break;
          end;
      end;
   //SHowMessage('sadas');

    if ExtractFileExt(Fname) = '.asc' then   //PE ascii
      while (line <> 'XYDATA') do
      begin
        readln(f, line);
        a := a + 1;
        //tabsheet3.TabVisible:=True;
        memo3.Lines.Add(line);
        if (line = '#DATA') then
        begin
          // ShowMessage(IntToStr(a));
          a := 0;
          break;
        end;
        if (a > 200) then
        begin
          break;
        end;
      end;
    // ShowMessage(IntToStr(a));
    //if a=0 then  reset(f);
   //SHowMessage(FloatToStr(a));
   i := 0;
    while not eof(f) do
    begin
      //readln(f, xt, yt);
      readln(f, line);
      if (length(line)<1) then break;
      if length(line)<5 then continue;

      data.DelimitedText:=line;
      if data[1]=' ' then continue;

      Xt:=StrToFloat(data[0]);
      Yt:=StrToFloat(data[1]);

      if (xt <> 0) and (abs(xt) >= wlstart) and (abs(xt) <= wlend)then
      begin
        i := i + 1;
        //if i<3 then ShowMessage(data[0]+' '+data[1]);
        xtmp[i]:= abs(xt)*fktx;
        xtmp[i]:= roundto(xtmp[i],-1);
        //if i<5 then showMessage(floatToStr(xtmp[i]));
        ytmp[i] := yt*fkt;
      end;
    end;
    np := i;
    mip:=0;
    for e:= 1 to np do  if ytmp[e]<0 then mip:=mip+1;
        if ((mip/mip)>0.3) and volt then for e:= 1 to np do  ytmp[e]:=-ytmp[e];
   // ShowMessage(IntToStr(mip));
    CloseFile(f);
  end;

data.Free;
FS.DecimalSeparator:= '.';
FS.ThousandSeparator := ',';
System.SysUtils.FormatSettings := FS;

 // ShowMessage(IntToStr(np));
 // PathL := StrToFloat(LabeledEdit12.text);
  // ShowMessage(intToStr(Nopoints));
  if xtmp[5] > xtmp[10] then
    reverse := True
  else
    reverse := false;

  if reverse then
    for a := 1 to np do
    begin
      xout[a] := xtmp[np - a + 1];
      if Checkbox16.Checked then xout[a] := 1240/xout[a];
      if CheckBox6.Checked then
        yout[a] := ytmp[np - a + 1] * 2.303 / PathLen
      else
        yout[a] := ytmp[np - a + 1];
    if CB_Trans.Checked then yout[a]:= power(10, -yout[a])*100;

    end;
  if reverse = false then
    for a := 1 to np do
    begin
      xout[a] := xtmp[a];
      if Checkbox16.Checked then xout[a]:= 1240/xout[a];
      if CheckBox6.Checked then
        yout[a] := ytmp[a] * 2.303 / PathLen
      else
        yout[a] := ytmp[a];;
       if CB_Trans.Checked then yout[a]:= power(10, -yout[a])*100;
    end;



  if StrToFloat(LabeledEdit6.text) < xout[1] then
  begin
    LabeledEdit6.text := FormatFloat('0', xout[1]);
    LabeledEdit7.text := FormatFloat('0', xout[1] + 20);
  end;
  // closeFile(f);
end;

procedure TForm1.N100cm1Click(Sender: TObject);
begin
PathL[CheckListBox1.ItemIndex]:=1;
resetSP:=True;
Plotallspectra1Click(Self);
end;

procedure TForm1.N10cm1Click(Sender: TObject);
begin
PathL[CheckListBox1.ItemIndex]:=0.1;
resetSP:=True;
Plotallspectra1Click(Self);
end;

procedure TForm1.N11Click(Sender: TObject);
var
  i: integer;
begin
  for i := 2 to PopupMenu1.Items.Count - 1 do
  if i<15+SpinEdit2.Value*3 then
  begin
    if PopupMenu1.Items[i].Checked then
      StringGrid1.ColWidths[i] := 55
    else
      StringGrid1.ColWidths[i] := 0;
  end else PopupMenu1.Items[i].Checked:=False;;
end;

procedure TForm1.N1cm1Click(Sender: TObject);
begin
PathL[CheckListBox1.ItemIndex]:=0.01;
resetSP:=True;
Plotallspectra1Click(Self);
end;

procedure TForm1.N5cm1Click(Sender: TObject);
begin
PathL[CheckListBox1.ItemIndex]:=0.05;
resetSP:=True;
Plotallspectra1Click(Self);
end;

procedure TForm1.NacrtajGraf(graf:TRchart;x, Y: array of double; od, ka: integer;
  boja: TColor; log, line, ClearPlot, autorange, Show: Boolean);
var
  i, st: integer;
  ytmp, wlstart: double;
begin
  if ClearPlot then graf.ClearGraf;
  RChart2.ClearGraf;
  RChart3.ClearGraf;
  graf.DataColor := boja;
  graf.SuppressPaint := True;
//log:=False;
if CheckBox16.Checked then  wlstart:=(1240/StrToFloat(LabeledEdit20.Text))else
  wlstart := StrToFloat(LabeledEdit14.text);

  st:=0;
  for i := od to ka do
   if (x[i] <> 0) and (x[i] >= wlstart) then
  begin
  st:=st+1;
    if log then
      if (Y[i] > 0) then Y[i] := ln(Y[i])
      else continue;;
    if line then
    begin
      if st = 1 then
        graf.MoveTo(x[i], Y[i])
      else
        graf.DrawTo(x[i], Y[i]);
    end
    else
      graf.MarkAt(x[i], Y[i], 7);

     // graf.autorange(1, 5);
     // graf.ShowGraf;
  end;// else if i<10 then showMessage(FloatToStr(x[i])+' '+FloatToStr(wlstart));;

  if autorange then
    graf.autorange(1, 5);
  graf.DataColor:=ClSilver;
  graf.Line(x[od],0,x[ka],0);
  if Show then graf.SuppressPaint:= false;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i: integer;
  bl: Boolean;
begin
  // Form_Simul.Visible:=True;
  if CB_Fit_Gauss.Checked then
  begin
  DefGLW:=LabeledEdit6.text;
  DefGHW:=LabeledEdit7.text;
  end else
  begin
  DefSSLW:=LabeledEdit6.text;
  DefSSHW:=LabeledEdit7.text;
  end;
  
  RChart1.SetFocus;
  NoGauss := 0;
  if CheckListBox1.Items.Count < 1 then
    Exit;
  CB_Derivative.State := cbUnchecked;

 //if SpiNEdit2.Value<1 then CB_Fit_Gauss.Checked:=False;

  for i := 1 to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[i].Clear;
  stop := false;
  startTime := now;
  ProgressBar1.Visible := True;
  StringGrid1.Cells[2, 0] := 'S @ ' + LabeledEdit6.text;
  StringGrid1.Cells[4, 0] := 'S @ ' + LabeledEdit8.text;
  StringGrid1.Cells[6, 0] := 'a@' + LabeledEdit6.text+ ' (fit)';
  StringGrid1.Cells[7, 0] := 'a@' + LabeledEdit8.text+ ' (fit)' ;
  StringGrid1.Cells[8, 0] := 'a @ ' + LabeledEdit1.text;
  StringGrid1.Cells[9, 0] := 'a @ ' + LabeledEdit2.text;
  StringGrid1.Cells[10, 0] := 'a @ ' + LabeledEdit3.text;
  StringGrid1.Cells[11, 0] := 'a @ ' + LabeledEdit18.text;
  StringGrid1.Cells[12, 0] := 'a @ ' + LabeledEdit19.text;
  StringGrid1.Cells[13, 0] := 'a @ ' + LabeledEdit21.text;


  resetSP := True;

  if (FileExists(FilenameEdit1.FileName) = false) and (RB3.Checked = True) then
    bl := false
  else
    bl := True;
  if bl = false then
  begin
    ShowMessage('Select BLANK file!');
    // RB0.Checked:=True;
    Exit;
  end;

  if Sender <> SpeedButton4 then
  begin
    Panel9.Visible := True;
    Panel9.update;

    for i := 0 to Files.Count - 1 do
      if CheckListBox1.Checked[i] then
      begin

      ProgressBar1.Refresh;
        StringGrid1.Rows[i + 1].BeginUpdate;
        CheckListBox1.Selected[i] := True;
        CheckListBox1.update;
       // ProgressBar1.Position := i+1;
       //if CheckBox13.Checked and
       // else Form_Simul.SpinEdit1Change(SpinEdit2);
       if  CB_Fit_Gauss.Checked then Button6Click(button6);
        ProgressBar1.Visible := True;
       ProgressBar1.Max:= Files.Count;
       ProgressBar1.Position := i+1;
        ProgressBar1.Refresh;
        //ShowMessage('dasda');
        Calculate(i, false);

        if CB_Fit_Gauss.Checked then if CheckBox14.Checked then
          begin
         // SpeedButton3Click(Self);
         // Form_Simul.Button1Click(self);
          end;

        Form_Simul.SG_Fit_Table.Refresh;
        StringGrid1.Refresh;
        Application.ProcessMessages;
        if stop then  break;
         if CB_Fit_Gauss.Checked then if CheckBox14.Checked then
          begin
          SpeedButton3Click(Self);
          Form_Simul.Button1Click(self);
          end else
          SpeedButton3Click(Self);
                               // ShowMessage('Dalje');
      end; // Label6.Caption:=FOrmatFloat('0.000',LambdaStart);
    // CheckListBox1.Selected[0]:=True;
   // ShowMessage('Select BLANK file!');
    SpeedButton3Click(Self);
    // CheckListBox1DblClick(Self);
  end;

  if Sender = SpeedButton4 then
  begin
    // ShowMessage('dasda');
    Calculate(CheckListBox1.ItemIndex + 1, True);
    // SpeedBUtton3Click(Self);
    // PlotFit(1);
  end;

  StringGrid1.Refresh;
  // Label6.Caption:=FOrmatFloat('0.000',LambdaStart);
  // SpeedBUtton3Click(Self);
  ProgressBar1.Visible := false;
  Panel9.Visible := false;

  endTime := now;
  Label1.Caption := 'Calculation time: ' + FormatFloat('0.00 s',
    (endTime - startTime) * 86400);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  item: integer;
begin
  item := CheckListBox1.ItemIndex;
  if item < 0 then
    item := 0;
 // RChart1.ClearGraf;
  NacrtajGraf(RChart1,x[item], Y[item], 1, NoPointsA[item], ClBlack, CheckBox5.Checked, false, True, false, false);
 //showMessage('ssdf');
 if CB_Slope.Checked then Edit3.text:='1';

 PlotFit(1, StrToInt(Edit3.text), StrToInt(Edit4.text));
  if CB_Fit_Gauss.Checked = false then
    PlotFit(2, StrToInt(Edit6.text), StrToInt(Edit7.text));;

end;

procedure TForm1.Calculate(fno: integer; onefile: Boolean);
var
  od, ka: integer;
  lw1, rw1, lw2, rw2, lw3, rw3: integer;
  i: integer;
  sl1, sl2: double;
  bl, fwc, fpc: Boolean;
  Method: String;
begin
if RB0.Checked and Checkbox17.Checked then
  begin
  Form3.StaticText1.Visible:=True;
  Form3.StaticText2.Visible:=false;
  if (Checkbox6.Checked=false) then Form3.StaticText2.Visible:=True;
  Form3.Timer1.Enabled:=True;
  Form3.Show;
  Form3.Refresh;
  end;

  if (Checkbox6.Checked=false) and Checkbox17.Checked then
  begin
  Form3.StaticText1.Visible:=False;
  if (RB0.Checked) then Form3.StaticText1.Visible:=True;
  Form3.StaticText2.Visible:=True;
  Form3.Timer1.Enabled:=True;
  Form3.Show;
  Form3.Refresh;
  end;
//Form_Simul.Blink.Visible:=True;
//Form_Simul.Blink.EnableBlinking:=True;
//Form_Simul.Blink.Refresh;
Screen.Cursor:=crHourglass;//crAppStart;
//Form1.Cursor := MyCursor;

if Checkbox16.Checked or CB_Trans.Checked then
  begin
  Checkbox16.Checked:=False;
  CB_Trans.Checked:=False;
  end;

  od := 0;
  ka := 0;
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false  else bl := True;
  if resetSP then
  begin
    OpenFile(x[fno], Y[fno],  PathL[fno],NoPointsA[fno],Files[fno]);
    if CheckBox8.Checked then  Reconstructspectra(x[fno], Y[fno],NoPointsA[fno]);
    if CheckBox15.Checked then TranslateLamp(x[fno], Y[fno],1, NoPointsA[fno], StrToFloat(Edit12.text));

    if CB_Smooth.Checked then  SGSmutiranje(Y[fno], 1, NoPointsA[fno], SpinEdit1.Value);
    if RB3.Checked then SubtractBlank(x[fno], Y[fno],YBln[fno],NoPointsA[fno], BlFIles[fno])
    else if bl then SubtractBaseline(x[fno], Y[fno], YBln[fno],NoPointsA[fno]);
    if CheckBox5.Checked then  LogTransform(x[fno], Y[fno],NoPointsA[fno]);
    {if CB_Derivative.Checked then
      begin
      DeriveSG(Y[fno], 1, NoPointsA[fno]);
      if SpinEdit5.value=2 then
        begin
        if CB_Smooth.Checked then SGSmutiranje(Y[fno], 1, NoPointsA[fno], SpinEdit1.Value);
        DeriveSG(Y[fno], 1, NoPointsA[fno]);
        end;
      end;}
  end;

  if RB0.Checked then    Method := ' (BL_No)';
  if RB1.Checked then    Method := ' (BL_AVG)';
  if RB2.Checked then    Method := ' (BL_Lin)';
  if RB3.Checked then    Method := ' (BL_File)';
  if RB4.Checked then    Method := ' (BL_Bric)';

  if CB_Fit_a0.Checked then    Method := Method + '_a0';
  if CB_Fit_K.Checked then    Method := Method + '_K';
  if CB_Fit_Gauss.Checked then    Method := Method + '_Gauss';

  if onefile then
    NacrtajGraf(RChart1,x[fno], Y[fno], 1, NoPointsA[fno], boja[CheckListBox1.ItemIndex], CheckBox5.Checked, false, True, CheckBox3.Checked, True);
  // if onefile then fno:=1;

  {for i := 1 to NoPointsA[fno] do
  begin
    if round(x[fno, i]) = StrToInt(LabeledEdit1.text) then       nwl1 := i;;
    if round(x[fno, i]) = StrToInt(LabeledEdit2.text) then       nwl2 := i;;
    if round(x[fno, i]) = StrToInt(LabeledEdit3.text) then       nwl3 := i;;
    if round(x[fno, i]) = 250 then       E2:= i;;
    if round(x[fno, i]) = 365 then       E3 := i;;
  end;}

  nwl1:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit1.text));
  nwl2:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit2.text));
  nwl3:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit3.text));
  nwl4:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit18.text));
  nwl5:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit19.text));
  nwl6:=GetPointNum(x[fno], 1, NoPointsA[fno], StrToInt(LabeledEdit21.text));
  E2:=GetPointNum(x[fno], 1, NoPointsA[fno], 250);
  E3:=GetPointNum(x[fno], 1, NoPointsA[fno], 365);

  lw1 := StrToInt(LabeledEdit6.text);
  rw1 := StrToInt(LabeledEdit7.text);
  lw2 := StrToInt(LabeledEdit8.text);
  rw2 := StrToInt(LabeledEdit9.text);
  // lw3:=StrtoInt(Form_Simul.SG_Fit_Table.cells[1,1]);
  // rw3:=StrtoInt(Form_Simul.SG_Fit_Table.cells[1,2]);
StringGrid1.Cells[15, 0] := 'a250/a365';

  for i := 1 to NoPointsA[fno] do
  begin
    if x[fno, i] <= lw1 then      od := od + 1;
    if x[fno, i] <= rw1 then      ka := ka + 1;
  end;

  Edit3.text := intToStr(od);
  Edit4.text := intToStr(ka);
 //ShowMessage('1st');
 //
{if CheckBox13.Checked and CB_Fit_Gauss.Checked then
  begin
  Button6Click(Self);
  end else Form_Simul.SpinEdit1Change(CheckListBox1);
 }
 //ShowMessage('asda');


 fwc:=Form_Simul.CB_Fix_Width.Checked;
 fpc:=Form_Simul.CB_Fix_Pos.Checked;
 if fpc=false then if (RB_double.Checked or RB_Triple.Checked) then Form_Simul.CB_Fix_Pos.Checked:=False;

 if CB_Fit_Gauss.Checked  and (RB_double.Checked or RB_Triple.Checked)  and (CB_Slope.Checked=False) then
    begin
    Form_Simul.CB_Fix_Width.Checked:=True;
   /////////////CB_Fit_a0.Checked:=false;
    end;

   if CheckBox1.Checked then OptimizeLog(x[fno], Y[fno], od, ka, 1, CB_Weighted.Checked)
  else OptimizeOneBKGauss(x[fno], Y[fno], od, ka, 1, SpinEdit3.value,CB_Weighted.Checked,CB_Constr.Checked);

  if CB_Fit_Gauss.Checked  and (RB_double.Checked or RB_Triple.Checked) then
   begin
   if fwc=false then
     if (RB_double.Checked or RB_Triple.Checked)then Form_Simul.CB_Fix_Width.Checked:=False;
   SpeedButton3Click(self);
   OptimizeOneBKGauss(x[fno], Y[fno], od, ka, 1, SpinEdit3.value,CB_Weighted.Checked,CB_Constr.Checked);

   if RB_Triple.Checked then SpeedButton3Click(self);
   if RB_Triple.Checked then OptimizeOneBKGauss(x[fno], Y[fno], od, ka, 1, SpinEdit3.value,CB_Weighted.Checked,CB_Constr.Checked);
   end;


  sl1 := vg[1];
  StringGrid1.Cells[2, fno + 1] := FormatFloat('0.00000', vg[1]);
  StringGrid1.Cells[3, fno + 1] := FormatFloat('0.00000', sg[1]);
  StringGrid1.Cells[6, fno + 1] := FormatFloat('0.0000', vg[0]);

  StringGrid1.Cells[16, fno + 1] := FormatFloat('0.0000', vg[2]); // Edit2.Text;

  for i := 0 to NoGauss - 1 do
  begin
    StringGrid1.Cells[6 * 3 + i * 3, fno + 1] :=      FormatFloat('0.00000', vg[3 + 3 * i]); // Edit2.Text;
    StringGrid1.Cells[6 * 3 + i * 3 + 1, fno + 1] :=       FormatFloat('0.00', vg[4 + 3 * i]); // Edit2.Text;
    StringGrid1.Cells[6 * 3 + i * 3 + 2, fno + 1] :=     FormatFloat('0.0', vg[5 + 3 * i]); // Edit2.Text;
  end;

Form_Simul.SG_Fit_Table.Refresh;

  if CB_Fit_Gauss.Checked = false then
  begin
    od := 0;
    ka := 0;
    for i := 1 to NoPointsA[fno] do
    begin
      if x[fno, i] <= lw2 then        od := od + 1;
      if x[fno, i] <= rw2 then        ka := ka + 1;
    end;
    Edit6.text := intToStr(od);
    Edit7.text := intToStr(ka);

    if CheckBox1.Checked then OptimizeLog(x[fno], Y[fno], od, ka, 2, CB_Weighted.Checked)
    else  OptimizeOneBKGauss(x[fno], Y[fno], od, ka, 2,SpinEdit3.Value, CB_Weighted.Checked, CB_Constr.Checked);

    sl2 := vg[1];
    StringGrid1.Cells[4, fno + 1] := FormatFloat('0.00000', vg[1]);
    StringGrid1.Cells[5, fno + 1] := FormatFloat('0.00000', sg[1]);
    StringGrid1.Cells[7, fno + 1] := FormatFloat('0.0000', vg[0]);
    StringGrid1.Cells[17, fno + 1] := FormatFloat('0.0000', vg[2]);
    //ShowMessage(FormatFloat('0.0000', vg[2]));
  end;

  StringGrid1.Cells[0, fno + 1] := intToStr(fno + 1);

  if onefile then
    StringGrid1.Cells[1, fno + 1] := CheckListBox1.Items[CheckListBox1.ItemIndex] + Method
  else
   StringGrid1.Cells[1, fno + 1] := CheckListBox1.Items[fno] + Method;
   if CB_Fit_Gauss.Checked=false then
   begin
   StringGrid1.Cells[8, fno + 1] := FormatFloat('0.0000', Y[fno, nwl1]);
   StringGrid1.Cells[9, fno + 1] := FormatFloat('0.0000', Y[fno, nwl2]);
   StringGrid1.Cells[10, fno + 1] := FormatFloat('0.0000', Y[fno, nwl3]);
   StringGrid1.Cells[11, fno + 1] := FormatFloat('0.0000', Y[fno, nwl4]);
   StringGrid1.Cells[12, fno + 1] := FormatFloat('0.0000', Y[fno, nwl5]);
   StringGrid1.Cells[13, fno + 1] := FormatFloat('0.0000', Y[fno, nwl6]);
   StringGrid1.Cells[15, fno + 1] := FormatFloat('0.000', Y[fno, E2]/Y[fno, E3]);
   end;
  if sl2 <> 0 then
    StringGrid1.Cells[14, fno + 1] := FormatFloat('0.000', sl1 / sl2);
//Form_Simul.Blink.Visible:=false;
//Form_Simul.Blink.EnableBlinking:=false;
Screen.Cursor:=crDefault;
end;

procedure TForm1.CB_Fit_GaussClick(Sender: TObject);
var
I: Integer;
lw1,rw1, od, ka: Integer;
begin
Button6.Enabled:=CB_Fit_Gauss.Checked;
CheckBox13.Enabled:=CB_Fit_Gauss.Checked;
if CheckBox1.Checked then CheckBox1.Checked:= not CB_Fit_Gauss.Checked;
CheckBox1.Enabled:=not CB_Fit_Gauss.Checked;
CheckBox14.Enabled:=CB_Fit_Gauss.Checked;
RB_Double.Enabled:=CB_Fit_Gauss.Checked;
RB_Triple.Enabled:=CB_Fit_Gauss.Checked;
CheckBox14.Enabled:=CB_Fit_Gauss.Checked;
if CB_Fit_Gauss.Checked=false  then CheckBox14.Checked:=False;
//CheckBox15.Enabled:=CB_Fit_Gauss.Checked;
SpinEdit2.Visible:=CB_Fit_Gauss.Checked;
StaticText1Click(Self);
  if CB_Fit_Gauss.Checked then
  begin
    LabeledEdit6.text := DefGLW;//'245';
    LabeledEdit7.text := DefGHW;//'450';
    LabeledEdit8.Visible := false;
    LabeledEdit9.Visible := false;
    if StrToFloat(LabeledEdit6.text) < x[0, 1] then
    begin
      LabeledEdit6.text := FormatFloat('0', x[0, 1]);
    end;
    lw1 := StrToInt(LabeledEdit6.text);
    rw1 := StrToInt(LabeledEdit7.text);
    od:=0;
    ka:=0;
  for i := 1 to NoPointsA[0] do
   begin
    if x[0, i] <= lw1 then      od := od + 1;
    if x[0, i] <= rw1 then      ka := ka + 1;
   end;

  Edit3.text := intToStr(od);
  Edit4.text := intToStr(ka);
 // Button6Click(CB_Fit_Gauss);

  end
  else
  begin
  SpinEdit2.Value:=0;
  //ShowMessage('asda');

    if LabeledEdit6.text<>DefSSLW then LabeledEdit6.text := DefSSLW;//'275';
    if LabeledEdit7.text<>DefSSHW then LabeledEdit7.text := DefSSHW;////////////'295';
    LabeledEdit8.Visible := True;
    LabeledEdit9.Visible := True;
    if StrToFloat(LabeledEdit6.text) < x[0, 1] then
    begin
      LabeledEdit6.text := FormatFloat('0', x[0, 1]);
      LabeledEdit7.text := FormatFloat('0', x[0, 1] + 20);
    end;
//   SpinEdit2.Value:=0;
    // Form_Simul.SG_Fit_Table.Visible:=false;
  end;

end;

procedure TForm1.CB_SlopeClick(Sender: TObject);
begin
if Cb_Fit_Gauss.Checked=False then CB_slope.checked:=False;
if CB_slope.Checked then
  begin
  CB_Fit_a0.Checked:=False;
  CB_Fit_K.Checked:=False;
  Form_Simul.SG_Fit_Table.cells[1,1]:='0';
  Form_Simul.SG_Fit_Table.cells[1,2]:='0';
  Form_Simul.SG_Fit_Table.cells[1,3]:='0';
  end;

CB_Fit_a0.Enabled:=not CB_slope.Checked;
CB_Fit_a0.Checked:=not CB_slope.Checked;
StaticText1Click(Self);
end;

procedure TForm1.CB_TransClick(Sender: TObject);
begin
 RB0.Checked:=True;
if Checkbox6.checked then Checkbox6.State:=cbUnchecked;
Plotallspectra1Click(CB_Trans);
if CB_Trans.Checked then RChart1.Scale1Y.Caption:='Transmittance (%)' Else RChart1.Scale1Y.Caption:='Abs. coeff. (m-1)';
end;

procedure TForm1.AddGauss_Izraz(peaks: integer; log: Boolean;
  var izraz: OleVariant);
begin
  if log then
  begin
    if peaks = 1 then
      izraz := 'p4*exp(-((exp(cx)-exp(p6))^2)/(2*p5^2))';
    if peaks = 2 then
      izraz := 'p4*exp(-((exp(cx)-exp(p6))^2)/(2*p5^2))+p7*exp(-((exp(cx)-exp(p9))^2)/(2*p8^2))';
    if peaks = 3 then
      izraz := 'p4*exp(-((exp(cx)-exp(p6))^2)/(2*p5^2))+p7*exp(-((exp(cx)-exp(p9))^2)/(2*p8^2))+p10*exp(-((exp(cx)-exp(p12))^2)/(2*p11^2))';
  end
  else
  begin
    if peaks = 1 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))';
    if peaks = 2 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))+p7*exp(-((cx-p9)^2)/(2*p8^2))';
    if peaks = 3 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))+p7*exp(-((cx-p9)^2)/(2*p8^2))+p10*exp(-((cx-p12)^2)/(2*p11^2))';
    if peaks = 4 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))+p7*exp(-((cx-p9)^2)/(2*p8^2))+p10*exp(-((cx-p12)^2)/(2*p11^2))+p13*exp(-((cx-p15)^2)/(2*p14^2))';
    if peaks = 5 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))+p7*exp(-((cx-p9)^2)/(2*p8^2))+p10*exp(-((cx-p12)^2)/(2*p11^2))+p13*exp(-((cx-p15)^2)/(2*p14^2))+p16*exp(-((cx-p18)^2)/(2*p17^2))';
    if peaks = 6 then
      izraz := 'p4*exp(-((cx-p6)^2)/(2*p5^2))+p7*exp(-((cx-p9)^2)/(2*p8^2))+p10*exp(-((cx-p12)^2)/(2*p11^2))+p13*exp(-((cx-p15)^2)/(2*p14^2))+p16*exp(-((cx-p18)^2)/(2*p17^2))+p19*exp(-((cx-p21)^2)/(2*p20^2))';
  end;

end;

procedure TForm1.AbsAtPos(pos: double);
var
  od, ka, nwl1, nwl2, nwl3: integer;
  lw1, rw1, lw2, rw2: integer;
  i, a: integer;
  sl1, sl2: double;
  bl: Boolean;
  Method: String;
begin

  StringGrid1.cols[14].Clear;
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false
  else
    bl := True;
  for i := 0 to CheckListBox1.Items.Count - 1 do
    if CheckListBox1.Checked[i] then
    begin
      nwl1 := -1;
      if resetSP then
      begin
        OpenFile(x[i], Y[i], PathL[i],NoPointsA[i],Files[i]);
        if CheckBox8.Checked then Reconstructspectra(x[i], Y[i],NoPointsA[i]);
        if CheckBox15.Checked then TranslateLamp(x[i], Y[i],1, NoPointsA[i], StrToFloat(Edit12.text));
        if CB_Smooth.Checked then  SGSmutiranje(Y[i], 1, NoPointsA[i], SpinEdit1.Value);
       if RB3.Checked then SubtractBlank(x[i], Y[i], YBln[i],NoPointsA[i], BlFIles[i])
       else if bl then SubtractBaseline(x[i], Y[i],YBln[i],NoPointsA[i]);
      if CheckBox5.Checked then
          LogTransform(x[i], Y[i],NoPointsA[i]);
        if CB_Derivative.Checked then
          begin
          DeriveSG(Y[i], 1, NoPointsA[i]);
          if SpinEdit5.value=2 then
            begin
            if CB_Smooth.Checked then SGSmutiranje(Y[i], 1, NoPointsA[i], SpinEdit1.Value);
            DeriveSG(Y[i], 1, NoPointsA[i]);
            end;
          end;
      end;
      {for a := 1 to NoPointsA[i]-1 do
        if ((x[i, a] <= pos) and (x[i, a+1] >= pos)) or ((x[i, a] >= pos) and (x[i, a+1] <= pos)) then
        begin
          nwl1 := a;
          break;
        end;  }
      nwl1:=GetPointNum (x[i], 1, NoPointsA[i], pos);

      if nwl1 = -1 then
        Exit;
      StringGrid1.Cells[17, i + 1] := FormatFloat('0.00000', Y[i, nwl1]);
    end;

  ColSel := 17;

  Plotdatafromcolumn1Click(Self);
  StringGrid1.Cells[ColSel, 0] := 'Y@' + floatToStr(roundto(x[0, nwl1],-1)) + ' nm';
  Form2.RChart1.Caption := StringGrid1.Cells[ColSel, 0];
  StringGrid1.Refresh;
end;

procedure TForm1.CheckBox16Click(Sender: TObject);
begin
RB0.Checked:=True;
Plotallspectra1Click(CB_Trans);
if CheckBox16.Checked then
  begin
 // LabeledEdit14.Text:=FloatToStr(1240/StrToFloat(LabeledEdit14.Text));
  RChart1.Scale1X.Caption:='Energy (eV)'
  end
  Else
  begin
  RChart1.Scale1X.Caption:='WL (nM)';
  //LabeledEdit14.Text:=FloatToStr(1240/StrToFloat(LabeledEdit14.Text));
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then if CB_Fit_K.Checked then CB_Fit_K.Checked:=False;

end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Form2.Visible := CheckBox2.Checked;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
if CheckBox3.checked then Plotallspectra1Click(Self);
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  diff := CheckBox4.Checked;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  // if Checkbox7.checked then Plotallspectra1Click(Self) else nacrtajGraf(x, y, 1, nopoints,boja[CheckListBox1.ItemIndex],CheckBox5.Checked,false, True,CheckBox3.Checked, True);
  Plotallspectra1Click(CheckBox5);
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
var
  i: integer;
begin
  if CheckBox7.Checked then
  begin
    CheckBox7.Caption := 'Unselect All';
    for i := 0 to CheckListBox1.Items.Count - 1 do
      CheckListBox1.State[i] := cbChecked;
  end
  else
  begin
    CheckBox7.Caption := 'Select All';
    for i := 0 to CheckListBox1.Items.Count - 1 do
      CheckListBox1.State[i] := cbUnchecked;
  end;
  Plotallspectra1Click(Self);
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin

//LabeledEdit15.Visible:=CheckBox8.Checked;
//LabeledEdit16.Visible:=CheckBox8.Checked;
  resetSP := True;
  if FilenameEdit1.text <> 'Blank File' then
  begin
    // OpenFIle(Xbl, ybl, FileNameEdit1.FileName);
    // if CheckBox8.Checked then Reconstructspectra(Xbl, Ybl);
    // if CB_Smooth.Checked then SGSmutiranje(ybl, 1, nopoints, SpinEdit1.Value);
  end;
  Plotallspectra1Click(Self);
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
begin
panel8.Visible:=CheckBox9.Checked;
//panel8.Align:=alBottom;
if CheckBox9.Checked then Splitter1.Align:=alBottom else Splitter1.Align:=alNone;
end;

procedure TForm1.CheckListBox1Click(Sender: TObject);
var
i: Integer;
begin
 // StringGrid1.Row := CheckListBox1.ItemIndex + 1;

StringGrid1.Selection:=TGridRect(Rect(0,CheckListBox1.ItemIndex + 1,StringGrid1.ColCount-1,CheckListBox1.ItemIndex + 1));
//i:=CheckListBox1.ItemIndex;
if Form2.Visible then
 begin
// NacrtajGraf(Form2.RChart1,Xorg[i], Yorg[i],1, NoPointsA[i], ClBlack, CheckBox5.Checked, false, True, false, false);
 //NacrtajGraf(Form2.RChart1,X[i], YBln[i],1, NoPointsA[i], ClRed, CheckBox5.Checked, True, false, CheckBox3.Checked, True);
 end;
 ParManChanged:=False;
StringGrid1Click(StringGrid1);
end;

procedure TForm1.CheckListBox1DrawItem(Control: TWinControl; Index: integer;
  Rect: TRect; State: TOwnerDrawState);
var
i: Integer;
cl: Tcolor;
begin
with (Control as TCheckListBox).Canvas do
  begin
  cl:=boja[Index];
  FillRect(Rect);
  //if odSelected in State then font.Style:=[fsBold] else font.Style:=[];
 // if odSelected in State then Brush.Color := $00FFD2A6;//clMenuHighlight;//clSkyBLue;//$00FFD2A6;
  if odSelected in State then cl:=clHighlightText;//clBlack;
  font.Color := cl;
  FillRect(Rect);
  TextOut(Rect.left, Rect.Top+2,(Control as TCheckListBox).Items[Index]);
  if odFocused In State then
    begin
     // Brush.Color := CheckListBox1.Color;
     // DrawFocusRect(Rect);
    end;

  end;
end;

procedure TForm1.SubtractBlank(var Xbase, Ybase, bric: array of double; np: Integer; fn: String);
var
  i, od, ka,npt: integer;
  pl: Double;
begin
  if (fn <> 'Blank File') then
  begin
  pl:=StrToFloat(LabeledEdit12.Text);
    OpenFile(Xbl, Ybl, pl,npt, fn);
    if CheckBox8.Checked then Reconstructspectra(Xbl, Ybl,np);
    if CheckBox15.Checked then TranslateLamp(Xbl, Ybl,1, np, StrToFloat(Edit12.text));
     //if CheckBox5.Checked then LogTransform(Xbl, Ybl,np);

    if CB_Smooth.Checked then
      SGSmutiranje(Ybl, 1, np, SpinEdit1.Value);
  end;
  for i := 1 to np do
  begin
    Xbase[i] := Xbase[i];
    if CheckBox11.Checked then
      BEGIN
      IF Ybl[i]=0 THEN Ybl[i]:=Ybl[i-1];
      Ybase[i] := abs(Ybase[i]/Ybl[i]);
      END;
    if CheckBox11.Checked=fALSE then  Ybase[i] := Ybase[i] - Ybl[i];
    Bric[i]:=Ybl[i];
  end;
end;

procedure TForm1.SubtractBaseline(var Xbase, Ybase, Bric: array of double; np: Integer);
var
  i, od, ka,a: integer;
  sum, avg, lbl, rbl, k, d, fq, Y,con,bas: double;
 // Bric: array[0..maxpoints] of double;
begin

  if RB0.Checked then
    begin
    for i := 1 to np do Bric[i]:= 0;
    Exit;
    end;
  if RB3.Checked then    Exit;

  od := 0;
  ka := 0;
  CurveFit1.init;
  lbl := StrToFloat(LabeledEdit4.text);
  rbl := StrToFloat(LabeledEdit5.text);
  for i := 1 to np do
  begin
    if Xbase[i] < lbl then
      od := od + 1;
    if Xbase[i] <= rbl then
      ka := ka + 1;
  end;

  if od = 0 then
    od := 1;
  if ka = 0 then
    ka := np ;
  sum := 0;
  if (ka-od)<3 then
  begin
    // CUrveFit1.Free;
    od:=ka-3;//Exit;
    LabeledEdit4.text:=FloatToStr(Xbase[od]);
    ShowMessage('L bound WL corrected! Increase first R bound WL or increase upper range of plotting data!');
  end;

  for i := od to ka do
  begin
    sum := sum + Ybase[i];
    CurveFit1.EnterStatValue(Xbase[i], Ybase[i]);
  end;



  CurveFit1.CalcLinFit(k, d, fq);
  avg := sum / (ka - od + 1);
  if (Combobox1.ItemIndex=0) and RB4.Checked then OptimizeScatter(Xbase, Ybase,od, ka, true, con,bas);
 // if (Combobox1.ItemIndex=1)  and RB4.Checked then OptimizeScatter(Xbase, Ybase,od, ka, False, con,bas);
 if Form2.Visible then NacrtajGraf(Form2.RChart1,xbase, ybase,1, np, ClBlack, CheckBox5.Checked, false, True, false, false);
  for i := 1 to np do
  begin
    if RB1.Checked then
    begin
      Ybase[i] := Ybase[i] - avg;
      Bric[i]:=avg;
    end;

    if RB2.Checked then
      begin
      Y := k * Xbase[i] + d;
      Ybase[i] := Ybase[i] - Y;
      Bric[i]:=Y;
      end;
    if RB4.Checked then
      begin
      //Bric[i]:=Ybase[i] - avg*((Xbase[ka]+Xbase[od])/2)/Xbase[i];//avg*Xbase[i]/((Xbase[ka]+Xbase[od])/2);
      //log10(1/(1-p*cx))+b
      //Bric[i]:=Ybase[i] -(ln(1/(1-con*Xbase[i]))+bas);
      if Combobox1.ItemIndex=0 then Bric[i]:=(log10(1/(1-con/power(Xbase[i],1)))+bas);
     // if Combobox1.ItemIndex=1 then Bric[i]:=(ln(1/(1-con/power(Xbase[i],4)))+bas);
      //if Combobox1.ItemIndex=1 then Bric[i]:=avg*Xbase[i]/((Xbase[ka]+Xbase[od])/2);;//avg*((Xbase[ka]+Xbase[od])/2)/Xbase[i];;
      //if Combobox1.ItemIndex=1 then Bric[i]:=Ybase[ka]*Xbase[i]/Xbase[ka];
      if Combobox1.ItemIndex=1 then Bric[i]:=avg*Xbase[i]/((Xbase[ka]+Xbase[od])/2);
      Ybase[i] := Ybase[i] - Bric[i];
      end;
  end;
if Form2.Visible then
begin
//NacrtajGraf(Form2.RChart1,Xorg[a], Yorg[a],1, NoPointsA[a], ClBlack, CheckBox5.Checked, false, True, True, false);
NacrtajGraf(Form2.RChart1,xbase, Bric,1, np, ClRed, CheckBox5.Checked, True, false, CheckBox3.Checked, True);
end;
end;

procedure TForm1.SubtractBaselineMoving(var Xbase, Ybase: array of double; mouseposX, mouseposY: double; np: Integer);
var
  i, od, ka: integer;
  sum, avg, lbl, rbl, k, d, fq, Y: double;

begin
 {
  if RB0.Checked then
    Exit;
  if RB3.Checked then
    Exit;
 }
 Plotallspectra1Click(RChart1);
  od := 0;
  ka := np-5;
  CurveFit1.init;
  Lbl := mouseposX;
  for i := 1 to np do
  begin
    if Xbase[i] < lbl then
      od := od + 1;
  end;

  if od = 0 then od := 1;
  if ka = 0 then  ka := np - 1;
  sum := 0;

  for i := od to ka do
  begin
    sum := sum + Ybase[i];
  end;

   //ShowMessage(FloatToStr(Xbase[od])+' '+FloatToStr(Xbase[ka]));
k:=(mouseposY-ybase[ka])/(Xbase[od]-Xbase[ka]);
d:=ybase[ka];
//ShowMessage(FloatToStr(k));

  avg := sum / (ka - od + 1);
  for i := 1 to np do
  begin
     Y := k * Xbase[i] + d;
      Ybase[i] := Ybase[i] - Y;
  end;
NacrtajGraf(RChart1,xbase, Ybase,1, NoPointsA[0], ClRed, CheckBox5.Checked, true, True, CheckBox3.Checked, True);
RChart1.DataColor:=ClGreen;
RChart1.Line(xbase[od], mouseposY, xbase[ka], ybase[ka]);
RChart1.ShowGraf;
end;

procedure TForm1.CheckSlope(Xbase, Ybase: array of double; np: Integer);
var
  i, od, ka: integer;
  sum, avg, lbl, rbl, k, d, fq, Y, PlotAbove: double;
begin
  od := 0;
  ka := 0;
  CurveFit1.init;
  lbl := StrToFloat(LabeledEdit4.text);
  rbl := StrToFloat(LabeledEdit5.text);
  for i := 1 to np do
  begin
    if Xbase[i] <= lbl then
      od := od + 1;
    if Xbase[i] <= rbl then
      ka := ka + 1;
  end;

  if od = 0 then
    od := 1;
  if ka = 0 then
    ka := np - 1;

  for i := od to ka do
  begin
    CurveFit1.EnterStatValue(Xbase[i], Ybase[i]);
  end;
  if (CurveFit1.NumData < 5) or (ka < od) then
  begin
    Exit;
  end;

  CurveFit1.CalcLinFit(k, d, fq);
  PlotAbove := StrToFloat(LabeledEdit4.text) - 20;
  Y := k * Xbase[i] + d;
  if abs(k) > StrToFloat(LabeledEdit11.text) then
    LabeledEdit10.Color := ClRed
  else
    LabeledEdit10.Color := clWhite;
 {
  Form2.RChart1.ClearGraf;

  for i := 1 to ka do
  begin
    if Xbase[i] > PlotAbove then
      Form2.RChart1.MarkAt(Xbase[i], Ybase[i], 10);
  end;

  Form2.RChart1.DataColor := ClRed;
  for i := 1 to ka do
    if Xbase[i] >= PlotAbove then
    begin
      Y := k * Xbase[i] + d;
      if Xbase[i] = PlotAbove then
        Form2.RChart1.MoveTo(Xbase[i], Y)
      else
        Form2.RChart1.DrawTo(Xbase[i], Y);
    end;
 {
  Form2.RChart1.autorange(1, 5);
  Form2.RChart1.ShowGraf;
  Form2.RChart1.DataColor := ClBlack;
 } Form2.RChart1.Caption := 'Original data - no corrected for baseline';

  LabeledEdit10.text := FormatFloat('0.00e+00', abs(k));
end;

procedure TForm1.Simulate(od, ka: integer; noise: Boolean);
var
  i, sp, g, p: integer;
  s1, s2, xl0, yt, GaussY, DeltaY, ExpY, SumDelta: double;
begin
  sp := 1;
  xl0 := x[0, od];
  for i := 0 to 2 do
    vg[i] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sp, i + 1]);
  for p := 0 to NoGauss - 1 do
    for i := 0 to 2 do
      vg[p * 3 + 3 + i] :=
        StrToFloat(Form_Simul.SG_Fit_Table.Cells[p + 2, i + 1]);

  for i := od to ka do
  begin
    GaussY := 0;
    for p := 0 to NoGauss - 1 do
    begin
      g := p * 3;
      GaussY := GaussY + vg[g + 3] *
        exp(-(x[0, i] - vg[g + 5]) * (x[0, i] - vg[g + 5]) /
        (2 * vg[g + 4] * vg[g + 4]));
    end;
    ExpY := vg[0] * exp(-vg[1] * (x[0, i] - xl0)) + vg[2];
    Y[0, i] := ExpY + GaussY;
    if noise then
      Y[0, i] := Y[0, i] + (RandGen1.Random);

  end;
  // ShowMessage('prosao');
end;

procedure TForm1.PlotFit(sl, od, ka: integer);
var
  i, sp, g,a: integer;
  s1, s2, xl0,  GaussY, yt, ExpY, SumDelta,E2Y,E3Y: double;
  SW, Pn, WStat: double;
  p, vc: integer;
  graf: TRChart;
  V1: TVector;

begin
  sp := CheckListBox1.ItemIndex;
  if sp < 0 then  sp := 0;
  Form_Simul.StringGrid1.RowCount:=ka+1;
  RChart1.DataColor := ClRed;
  RChart1.LineWidth := 3;

  if sl = 1 then graf := RChart2;
  if sl = 2 then graf := RChart3;
  graf.SuppressPaint:=True;
  xl0 := x[sp, od];
  SumDelta := 0;
  // ShowMessage(IntToStr(sl));
  for i := 0 to 2 do
    vg[i] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sl, i + 1]);



  for p := 0 to NoGauss - 1 do
    for i := 0 to 2 do
      vg[p * 3 + 3 + i] :=
        StrToFloat(Form_Simul.SG_Fit_Table.Cells[p + 2, i + 1]);

  Memo2.Clear;
  Memo2.Lines.BeginUpdate;
  // if CheckBox9.Checked then od1:=1;

  V1 := TVector.Create(Nil);
  V1.Clear;
  V1.NrOfElem := ka - od + 1;

  vc := 1;
  //StringGrid1.Cells[12, sp + 1] := intToStr(NoGauss);
  if NoGauss >= 0 then RChart3.ClearGraf;
  RChart1.SuppressPaint := True;
  RChart3.Scale1Y.Caption:='Residuals';
  RChart2.Scale1Y.Caption:='Residuals';

  for i := od to ka do
  begin
    GaussY := 0;
    for p := 0 to NoGauss - 1 do
    begin
      g := p * 3;
      GaussY := GaussY + vg[g + 3] *
        exp(-(x[sp, i] - vg[g + 5]) * (x[sp, i] - vg[g + 5]) /
        (2 * vg[g + 4] * vg[g + 4]));
    end;
    Form_Simul.StringGrid1.Cells[8,i]:=FormatFloat('0.000000', GaussY);
    ExpY := vg[0] * exp(-vg[1] * (x[sp, i] - xl0)) + vg[2];

   yt := ExpY + GaussY;

    if CheckBox5.checked then  yt:=ln( yt );

   // YResidue[i] := 100*(Y[sp, i] -  yt )/((Y[sp, od]+Y[sp, ka])/2);
    if CheckBox5.checked then
      begin
       YResidue[i] := 100*(ln(Y[sp, i]) -  (yt) )/ ln((Y[sp, od]-Y[sp, ka])/2);
      end
    else YResidue[i] := ((Y[sp, i]) -  (yt) );// YResidue[i] := 100*((Y[sp, i]) -  (yt) )/((Y[sp, od]+Y[sp, ka])/2);
    SumDelta := SumDelta + abs(YResidue[i]);
    V1.elem[vc] := YResidue[i];
    inc(vc);
    if NoGauss >= 0 then
    GRAF.MarkAt(x[sp, i], YResidue[i], 7);
     if NoGauss >= 0 then if i = od then graf.MoveTo(x[sp, i], YResidue[i]) else graf.DrawTo(x[sp, i], YResidue[i]);
    if i = od then RChart1.MoveTo(x[sp, i],  yt )
    else RChart1.DrawTo(x[sp, i],  Yt );
    Memo2.Lines.Add(FormatFloat('0.00000', x[sp, i]) + #9 +FormatFloat('0.0000000', YResidue[i]));
    graf.DataColor := ClBlack;

    {if diff then
    begin
       graf.MarkAt(x[sp, i], Y[sp, i], 10);
      graf.DataColor := ClRed;
      if i = od then graf.MoveTo(x[sp, i], yt)
      else graf.DrawTo(x[sp, i], yt);
    end
    else graf.MarkAt(x[sp, i], Y[sp, i] - yt, 16); }
  end;

  Memo2.Lines.EndUpdate;
  memo2.SelectAll;
 // memo2.CopyToClipboard;
  //Form2.RChart1.Caption := FormatFloat('0.000', SumDelta/(ka-od+1));
  //RChart3.Caption := FormatFloat('0.0 %', SumDelta/(ka-od+1));
  graf.Caption := FormatFloat('AVG residue = 0.0000', SumDelta/(ka-od+1)); //rcHART3
  if NoGauss>0 then
    begin
    StringGrid1.cells[17, 0]:='AVG residue';
    StringGrid1.cells[17, sp+1]:=FormatFloat('0.0000', SumDelta/(ka-od+1));
    end else StringGrid1.cells[17, 0]:='K2';
  {SW := ShapiroWilkTest(V1, 0, Pn, WStat);
  if Pn < 0.05 then Panel2.Caption := 'Normality test of residuals NOT PASSED! (p = ' + FormatFloat('0.0000', Pn) + ')'
  else Panel2.Caption := 'Normality test of residuals PASSED :), (p = ' + FormatFloat('0.0000', Pn) + ')';
  }
  for i := 0 to 6 do   Form_Simul.StringGrid1.Cols[i].Clear;
 for i := od to ka do  Form_Simul.StringGrid1.Cells[0,i]:=FormatFloat('0.0', x[sp,i]);

  for p := 0 to NoGauss - 1 do
  begin
    g := p * 3;
    if p = 0 then RChart1.DataColor := ClBlue;
    if p = 1 then RChart1.DataColor := ClFuchsia;
    if p = 2 then RChart1.DataColor := ClSilver;
    if p = 3 then RChart1.DataColor := ClPurple;
    if p = 4 then RChart1.DataColor := ClAqua;
    if p = 5 then RChart1.DataColor := ClMaroon;


    for i := od to ka do
    begin
      //ExpY := vg[0] * exp(-vg[1] * (x[sp, i] - xl0)) + vg[2];
      GaussY := vg[g + 3] * exp(-(x[sp, i] - vg[g + 5]) * (x[sp, i] - vg[g + 5])/ (2 * vg[g + 4] * vg[g + 4]));
      Form_Simul.StringGrid1.Cells[p+2,i]:=FormatFloat('0.0000000', GaussY);
      if i = od then RChart1.MoveTo(x[sp, i], GaussY) else RChart1.DrawTo(x[sp, i], GaussY);
    end;

  end;
   nwl1:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit1.text));
  nwl2:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit2.text));
  nwl3:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit3.text));
  nwl4:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit18.text));
  nwl5:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit19.text));
  nwl6:=GetPointNum(x[sp], 1, NoPointsA[sp], StrToInt(LabeledEdit21.text));
  E2:=GetPointNum(x[sp], 1, NoPointsA[sp], 250);
  E3:=GetPointNum(x[sp], 1, NoPointsA[sp], 365);

 RChart1.DataColor := clLime;
 if NoGauss > 0 then
    for i := od to ka do
    begin
      ExpY := vg[0] * exp(-vg[1] * (x[sp, i] - xl0)) + vg[2];
      if i = od then RChart1.MoveTo(x[sp, i], ExpY)
      else RChart1.DrawTo(x[sp, i], ExpY);
      if i=nwl1 then StringGrid1.Cells[8, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=nwl2 then StringGrid1.Cells[9, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=nwl3 then StringGrid1.Cells[10, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=nwl4 then StringGrid1.Cells[11, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=nwl5 then StringGrid1.Cells[12, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=nwl6 then StringGrid1.Cells[13, sp + 1] := FormatFloat('0.0000', ExpY);
      if i=E2 then E2Y:= ExpY;
      if i=E3 then E3Y:= ExpY;
      Form_Simul.StringGrid1.Cells[1,i]:=FormatFloat('0.0000000', ExpY);
    end;

  if CB_Fit_Gauss.Checked then
   begin
   StringGrid1.Cells[15, sp + 1] := FormatFloat('0.000', E2Y/E3Y);
   end;

//  if NoGauss >= 0 then RChart3.autorange(1, 10);
//  if NoGauss >= 0 then RChart3.ShowGraf;
  if NoGauss > 0 then RChart3.Caption := '';
//  else
//    RChart3.Caption := '';
  RChart1.DataColor := ClBlack;
  if CheckBox3.Checked then RChart1.autorange(1, 5);
  RChart1.SuppressPaint := false;
  RChart1.LineWidth := 1;
  V1.Free;
  graf.autorange(1, 10);
  graf.SuppressPaint:=False;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var
  XlsFIle, fld, fn, Method: String;
begin

  if SaveDialog1.Execute then
  begin
    { if RB0.Checked then Method:='_No_Baseline';
      if RB1.Checked then Method:='_AVG_Baseline';
      if RB2.Checked then Method:='_Linear_Baseline';
      fld:=ExtractFilePath(SaveDialog1.filename);
      fn:=ExtractFileName(SaveDialog1.filename);
      fn:=copy(fn,1,length(fn)-5); }
    XlsFIle := SaveDialog1.FileName;
    StringGridToExcelSheet(StringGrid1, 'AS results', XlsFIle, false, True);
  end;
end;

function TForm1.RefToCell(RowID, ColID: integer): string;
var
  ACount, APos: integer;
begin
  ACount := ColID div 26;
  APos := ColID mod 26;
  if APos = 0 then
  begin
    ACount := ACount - 1;
    APos := 26;
  end;

  if ACount = 0 then
    Result := Chr(Ord('A') + ColID - 1) + intToStr(RowID);

  if ACount = 1 then
    Result := 'A' + Chr(Ord('A') + APos - 1) + intToStr(RowID);

  if ACount > 1 then
    Result := Chr(Ord('A') + ACount - 1) + Chr(Ord('A') + APos - 1) +
      intToStr(RowID);
end;

procedure TForm1.Removefilefromlist1Click(Sender: TObject);
var
I,a:Integer;
begin

if CheckListBox1.Items.COunt>1 then
for i:=0 to CheckListBox1.Items.COunt-1 do
    begin
    if CheckListBox1.Selected[i] then
       begin
       CheckListBox1.items.Delete(i);
       ListBox1.Items.Delete(i);
       for a:=i+1 to CheckListBox1.Items.COunt do
           begin
           Files[a-1]:=Files[a];
           IF BlFIles.Count>0 THEN BlFIles[a-1]:=BlFIles[a];
           NoFIles:=NoFIles-1;
           //BOja[a-1]:=Boja[a];
           end;
       FIles.Delete(CheckListBox1.Items.COunt);
       IF BlFIles.Count>0 THEN  BlFIles.Delete(CheckListBox1.Items.COunt);
       break;
       end;
    end;
StringGrid1.RowCount:=CheckListBox1.Items.Count+1;
Plotallspectra1Click(CB_Smooth);
end;

procedure TForm1.Replot1Click(Sender: TObject);
var
  item: integer;
begin
{  item := CheckListBox1.ItemIndex;
  if item < 0 then
    item := 0;
  NacrtajGraf(x[item], Y[item], 1, NoPointsA[item], ClBlack, CheckBox5.Checked, true,
    True, CheckBox3.Checked, True); }
    CheckBox3.Checked:=True;
Plotallspectra1Click(Self);
end;

procedure TForm1.Replot2Click(Sender: TObject);
var
  item: integer;
begin
  item := CheckListBox1.ItemIndex;
  if item < 0 then
    item := 0;
  NacrtajGraf(RChart1,x[item], Y[item], 1, NoPointsA[item], ClBlack, CheckBox5.Checked, true,
    True, CheckBox3.Checked, True);

end;

// StringGrid Inhalt in Excel exportieren
// Export StringGrid contents to Excel

function TForm1.StringGridToExcelSheet(Grid: TStringGrid;
  SheetName, FileName: string; ShowExcel, SaveExcel: Boolean): Boolean;
const
  xlWBATWorksheet = -4167;
var
  SheetCount, SheetColCount, SheetRowCount, BookCount: integer;

  i, j, n, m, lcid: integer;
  SaveFileName: string;
begin
  // notwendige Sheetanzahl feststellen
  SheetCount := (Grid.ColCount div 256) + 1;
  if Grid.ColCount mod 256 = 0 then
    SheetCount := SheetCount - 1;
  // notwendige Bookanzahl feststellen
  BookCount := (Grid.RowCount div 65536) + 1;
  if Grid.RowCount mod 65536 = 0 then
    BookCount := BookCount - 1;

  // Create Excel-OLE Object
  Result := false;
  XLApp := CreateOleObject('Excel.Application');
  try
    // Excelsheet anzeigen
    if ShowExcel = false then
      XLApp.Visible := false
    else
      XLApp.Visible := True;
    // Workbook hinzufügen
    XLApp.DisplayAlerts := false;
    for m := 1 to BookCount do
    begin
      XLApp.Workbooks.Add(xlWBATWorksheet);
      // Sheets anlegen
      for n := 1 to SheetCount - 1 do
      begin
        XLApp.Worksheets.Add;
      end;
    end;
    // Sheet ColAnzahl feststellen
    if Grid.ColCount <= 256 then
      SheetColCount := Grid.ColCount
    else
      SheetColCount := 256;
    // Sheet RowAnzahl feststellen
    if Grid.RowCount <= 65536 then
      SheetRowCount := Grid.RowCount
    else
      SheetRowCount := 65536;

    // Sheets befüllen
    for m := 1 to BookCount do
    begin
      for n := 1 to SheetCount do
      begin
        // Daten aus Grid holen
        Data := VarArrayCreate([1, Grid.RowCount, 1, SheetColCount],
          varVariant);
        for i := 0 to SheetColCount - 1 do
          for j := 0 to SheetRowCount - 1 do
            if ((i + 256 * (n - 1)) <= Grid.ColCount) and
              ((j + 65536 * (m - 1)) <= Grid.RowCount) then
              Data[j + 1, i + 1] := Grid.Cells[i + 256 * (n - 1),
                j + 65536 * (m - 1)];
        // -------------------------

        XLApp.Worksheets[n].Select;
        XLApp.Workbooks[m].Worksheets[n].Name := SheetName + intToStr(n);
        // Zellen als String Formatieren
        XLApp.Workbooks[m].Worksheets[n].Range[RefToCell(1, 1),
          RefToCell(SheetRowCount, SheetColCount)].Select;
        // XLApp.Selection.NumberFormat := '@';
        XLApp.Workbooks[m].Worksheets[n].Range['A1'].Select;
        // Daten dem Excelsheet übergeben
        Sheet := XLApp.Workbooks[m].Worksheets[n];
        Sheet.Range[RefToCell(1, 1), RefToCell(SheetRowCount, SheetColCount)
          ].Value := Data;
      end;
    end;
    Sheet.Columns['A'].autofit;

    // Save Excel Worksheet
    //
    try
      for m := 1 to BookCount do
      begin
        SaveFileName := copy(FileName, 1, pos('.', FileName) - 1) + intToStr(m)
          + copy(FileName, pos('.', FileName), length(FileName) - pos('.',
          FileName) + 1);
        // if SaveExcel then XLApp.Workbooks[M].SaveAs(SaveFileName);
        if SaveExcel then
          XLApp.Workbooks[m].SaveAs(FileName);
        // if SaveExcel then XLApp.SaveAs;

      end;
      Result := True;
    except
      // Error ?
    end;
  finally
    // Excel Beenden
    if (not VarIsEmpty(XLApp)) and (ShowExcel = false) then
    begin
      XLApp.DisplayAlerts := false;
      XLApp.Quit;
      XLApp := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
if StringGrid1.Cells[1,1]='' then CopyColumn(StringGrid1, 12)
else   CopyTable(StringGrid1);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
var
  i, a: integer;
  //PathL: double;
  fld, fn, Method, Xf, yf, ln, fmeth: String;
  f: textFile;
  bl: Boolean;
begin
if Files.Count<1 then Exit;

  ProgressBar1.Visible := True;
  stop := false;
  Panel9.Visible := True;
    begin
     if RB0.Checked then Method:= '_' else Method:= '_BL_';
     if CB_Smooth.Checked then Method:=MEthod+ 'SG-'+INtToStr(SpinEdit1.Value)+'_';
     if CB_Derivative.Checked then Method:=MEthod+ INtToStr(SpinEdit5.Value)+'-Der_';
    end;
  if Checkbox6.Checked then Method := Method+'ac_pL_'+FloatToStr(StrToFloat(LabeledEdit12.Text)/0.01)+'cm_';
  if RB1.Checked then
    Method :=Method+ 'AVG_'+LabeledEdit4.Text+'_'+LabeledEdit5.Text;
  if RB2.Checked then
    Method := Method+'Lin_'+LabeledEdit4.Text+'_'+LabeledEdit5.Text;
  if RB3.Checked then
    Method := Method+'_File_';
   if RB4.Checked then
    Method := Method+'_Bric_';

  fmeth:='';
  if Checkbox6.Checked then fmeth := '_ac_pL_'+FloatToStr(StrToFloat(LabeledEdit12.Text)/0.01)+'cm\';
  if RB1.Checked then
    fmeth := '_Blnk-AVG\';
  if RB2.Checked then
    fmeth := '_Blnk-Lin\';
  if RB3.Checked then
    fmeth := '_Blnk-File\';
  if RB4.Checked then
    fmeth := Method+'_Blnk-Bric\';
 //
 if fmeth='' then
  begin
    Showmessage('No changes made to any spectra. Nothing will be saved.');
    exit;
  end;


  fld := ExtractFilepath(Files[0]) + fmeth;

  if DirectoryExists(fld) = false then
    if not CreateDir(fld) then
      raise Exception.Create('Error creating folders: ' + fld);
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false
  else
    bl := True;

  for a := 0 to Files.Count - 1 do
  begin
    if resetSP then
    begin
      OpenFile(x[a], Y[a], PathL[a],NoPointsA[a], Files[a]);
      if CheckBox8.Checked then
        Reconstructspectra(x[a], Y[a], NoPointsA[a]);
      if CheckBox15.Checked then TranslateLamp(x[a], Y[a],1, NoPointsA[a], StrToFloat(Edit12.text));
      if CB_Smooth.Checked then
        SGSmutiranje(Y[a], 1,  NoPointsA[a], SpinEdit1.Value);

      if RB3.Checked then
        SubtractBlank(x[a], Y[a], YBln[a], NoPointsA[a],BlFIles[a])
      else if bl then
        SubtractBaseline(x[a], Y[a],YBln[a], NoPointsA[a]);
    if CheckBox5.Checked then
        LogTransform(x[a], Y[a], NoPointsA[a]);
      if CB_Derivative.Checked then
        begin
          DeriveSG(Y[a], 1, NoPointsA[a]);
          if SpinEdit5.value=2 then
            begin
            if CB_Smooth.Checked then SGSmutiranje(Y[a], 1, NoPointsA[a], SpinEdit1.Value);
            DeriveSG(Y[a], 1, NoPointsA[a]);
            end;
        end;
    end;

   // Memo1.Clear;
  //  Memo1.Lines.Assign(AboutBox.Memo1.Lines);

    fn := ChangeFileExt(ExtractFIleName(Files[a]),'.txt');
   // Showmessage(fld);
   // Showmessage(Method + fn);
    fn := fld + Method + fn;
    //Memo1.Lines.SaveToFile(fn);
    AssignFile(f, fn);
    Rewrite(f);
    Append(f);
   // PathL := StrToFloat(LabeledEdit12.text);
    for i :=  NoPointsA[a] downto 1 do
    begin
      yf := FormatFloat('0.000000000', Y[a, i]);
       Xf := FormatFloat('0.0', x[a, i]);
      ln := Xf + #9 + yf;
      WriteLn(f, ln);
    end;
    CloseFile(f);

    ProgressBar1.Position := a;
    Application.ProcessMessages;
    if stop then
      break;
  end;
  Panel9.Visible := false;
  ProgressBar1.Visible := false;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  if CB_Fit_Gauss.Checked then LabeledEdit6.text := '245' else LabeledEdit6.text := '275';
  if CB_Fit_Gauss.Checked then LabeledEdit7.text := '450' else LabeledEdit7.text := '295';
  LabeledEdit8.text := '350';
  LabeledEdit9.text := '400';
  LabeledEdit1.text := '254';
  LabeledEdit2.text := '280';
  LabeledEdit3.text := '325';
  LabeledEdit18.text := '355';
  LabeledEdit19.text := '412';
  LabeledEdit21.text := '440';

  LabeledEdit4.text := '580';
  LabeledEdit5.text := '650';
  LabeledEdit11.text := '1.5e-3';
  Form_Simul.LabeledEdit18.text := '50';
  Form_Simul.LabeledEdit19.text := '60';
  LabeledEdit14.text := '200';
  LabeledEdit20.text := '800';
  SpinEdit1.value:= 10;
  SpinEdit3.value:= 10;
  //ShowMessage('Default values.');
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
var
i: Integer;
begin
 if SpinEdit2.Value>0 then
  begin
  Form_Simul.Visible:=true;
  CB_Fit_Gauss.Checked:=True;
  Form_Simul.SpinEdit1.Value:= SpinEdit2.Value;
  //for I := 1 to Nogauss do
  //  Form_Simul.SG_Fit_Table.Cells[i+1, 0] := 'Gauss '+IntToStr(i);;
  if NoGChanged then Form_Simul.SpinEdit1Change(Form_Simul.SpinEdit1) else
  Form_Simul.SpinEdit1Change(SpinEdit2);
  //StringGrid1.ColCount:=15+3*SpinEdit2.Value;
  end else Form_Simul.Visible:=false ;
 StringGrid1.ColCount:=18+3*SpinEdit2.Value;


  for i := 18 to PopupMenu1.Items.Count-1 do
  begin
    if i<18+spinEdit2.Value*3 then PopupMenu1.Items[i].Checked:=True else PopupMenu1.Items[i].Checked:=False;

   { if PopupMenu1.Items[i].Checked then
      StringGrid1.ColWidths[i] := 55
    else
      StringGrid1.ColWidths[i] := 0;}
  end;

end;

procedure TForm1.Splitter3CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
RChart2.Width := round(Panel8.Width / 2) + 3;
end;

procedure TForm1.StaticText1Click(Sender: TObject);
var
lab, l0,l1,l2,l3,l4: String;
begin
lab:='';
l0:='a(λ) = ';

l2:='*exp(−S(λ−λ0))';
l3:=' + K';
l4:='n*Gauss';
lab:=l0;
if CB_Fit_a0.checked then l1:='a(λ0)' else l1:='abs';
if CB_Fit_K.Checked then l3:=' + K' else l3:='';
if CB_Slope.Checked=false then lab:=lab+l1+l2;
if CB_Fit_Gauss.Checked then lab:=lab+' + '+l4;
if CB_Fit_K.Checked then lab:=lab+l3;
if CB_Slope.Checked then Lab:=l0+l4+l3;;

StaticText1.Caption:=lab;
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
var
  Row: integer;
  I: Integer;
  goFit: Boolean;
begin
//ShowMessage('dasd');
ParManChanged:=False;
NoGChanged:=False;
if sender<> StringGrid1 then exit;
Row := StringGrid1.Row;
if Form2.Visible then
 begin
 NacrtajGraf(Form2.RChart1,Xorg[Row-1], Yorg[Row-1],1, NoPointsA[Row-1], ClBlack, CheckBox5.Checked, false, True, false, false);
 NacrtajGraf(Form2.RChart1,X[Row-1], YBln[Row-1],1, NoPointsA[Row-1], ClRed, CheckBox5.Checked, True, false, CheckBox3.Checked, True);
 end;


for I := 1 to 6 do
   if StringGrid1.Cells[18+(i-1)*3,row]='' then
   begin
   NoGChanged:=True;
   SpinEdit2.Value:=i-1;
   NoGauss:=SpinEdit2.Value;
   //LAbel2.caption:=(intToStr(SpinEdit2.Value));

   break;
    end;
  ColSel := StringGrid1.Col;

  goFit:=true;
  // Panel11.Caption:=StringGrid1.Cells[col,row];
  StringGrid1.Options := StringGrid1.Options + [goRowselect];
  // if sender=StringGrid1 then
  BEGIN
    CheckListBox1.ItemIndex := Row - 1;
  END;

 Form_Simul.SG_Fit_Table.Cells[1,1]:=StringGrid1.Cells[6,row];
 Form_Simul.SG_Fit_Table.Cells[1,2]:=StringGrid1.Cells[2,row];
 Form_Simul.SG_Fit_Table.Cells[1,3]:=StringGrid1.Cells[16,row];
 if SpinEdit2.Value=0 then
 begin
 Form_Simul.SG_Fit_Table.Cells[2,1]:=StringGrid1.Cells[7,row];
 Form_Simul.SG_Fit_Table.Cells[2,2]:=StringGrid1.Cells[4,row];
 Form_Simul.SG_Fit_Table.Cells[2,3]:=StringGrid1.Cells[17,row];
 end;


if ParManChanged=False then
 for I := 1 to SpinEdit2.Value do
  begin
  Form_Simul.SG_Fit_Table.Cells[i+1,1]:=StringGrid1.Cells[18+(i-1)*3,row];
  Form_Simul.SG_Fit_Table.Cells[i+1,2]:=StringGrid1.Cells[19+(i-1)*3,row];
  Form_Simul.SG_Fit_Table.Cells[i+1,3]:=StringGrid1.Cells[20+(i-1)*3,row];
  //if Form_Simul.SG_Fit_Table.Cells[i+1,1]='' then Form_Simul.SG_Fit_Table.Cells[i+1,1]:='0';
  //if Form_Simul.SG_Fit_Table.Cells[i+1,2]='' then Form_Simul.SG_Fit_Table.Cells[i+1,2]:='0';
  //if Form_Simul.SG_Fit_Table.Cells[i+1,3]='' then Form_Simul.SG_Fit_Table.Cells[i+1,3]:='0';
  end;

 if SpinEdit2.Value>0 then
  for I := 1 to SpinEdit2.Value do
   if StringGrid1.Cells[18+(i-1)*3,row]='' then goFit:=false;
   for I := 1 to StringGrid1.colCount-1 do
   if StringGrid1.Cells[2,row]='' then goFit:=false;

 //if SpinEdit2.Value=0 then goFit:=false;
   //goFit:=true;
  Edit5.text := StringGrid1.Cells[2, Row];
  Edit1.text := StringGrid1.Cells[4, Row];
  Edit8.text := StringGrid1.Cells[6, Row];
  Edit9.text := StringGrid1.Cells[7, Row];

   if goFit then SpeedButton3Click(Self);

  exit;
  PlotFit(1, StrToInt(Edit3.text), StrToInt(Edit4.text));
  if CB_Fit_Gauss.Checked = false then
    PlotFit(2, StrToInt(Edit6.text), StrToInt(Edit7.text));
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
var
  p: TPoint;
  iColumn, iRow: Longint;
begin
  // StringGrid1.Options:=[GoEditing,goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goAlwaysShowEditor];
  GetCursorPos(p);
  With StringGrid1 do
  begin
    p := ScreenToClient(p);
    MouseToCell(p.x, p.Y, iColumn, iRow);
  end;
  if iRow = 0 then
    AutoSizeCol(StringGrid1)
  else
    //   CheckListBox1DblClick(Self);
end;

procedure TForm1.StringGrid1FixedCellClick(Sender: TObject;
  ACol, ARow: integer);
begin
  ColSel := ACol;
  Plotdatafromcolumn1Click(Self);
  Form2.RChart1.Caption := StringGrid1.Cells[ColSel, 0];
end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (Button=mbRight) and(y<33) then StringGrid1.PopupMenu:=Popupmenu1 else StringGrid1.PopupMenu:=Popupmenu2;

end;

procedure TForm1.StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, Y: integer);
begin
  StringGrid1.Options := StringGrid1.Options - [goRowselect];
end;

procedure TForm1.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
   if StringGrid2.RowCount> StringGrid2.Row+1 then StringGrid2.Row:=StringGrid2.Row+1;
   //StringGrid2.SetFocus;
   end;

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
RB4.Checked:=True;
ListBox1DblClick(Self);
end;

procedure TForm1.Copyactivedata1Click(Sender: TObject);
var
  i, sp,n: integer;
begin
  Memo1.Clear;
  sp:= CheckListBox1.ItemIndex;
  For i := 1 to  NoPointsA[sp] do
  begin
    Memo1.Lines.Add(FormatFloat('0' + FormatSettings.DecimalSeparator + '00000',
      x[sp, i]) + #9 + FormatFloat('0' + FormatSettings.DecimalSeparator +
      '00000e+0', Y[sp, i]))
  end;
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
end;

procedure TForm1.Copyallcheckedspectra1Click(Sender: TObject);
var
  i, sp,n: integer;
  ln:String;
begin
  Memo1.Clear;
  memo1.Lines.BeginUpdate;
ln:='';
for n:= 0 to CheckListBox1.Items.Count-1 do
if CheckListBox1.Checked[n] then
  begin
  if n>0 then ln:=ln+#9;
  ln:=ln+#9+ExtractFileName(Files[n]);
  end;
Memo1.Lines.add(ln);

For i := 1 to  NoPointsA[0] do
begin
ln:='';
for n:= 0 to CheckListBox1.Items.Count-1 do
if CheckListBox1.Checked[n] then
 begin
  if n>0 then ln:=ln+#9;
  ln:=ln+(FormatFloat('0' + FormatSettings.DecimalSeparator + '00000',
      x[n, i]) + #9 + FormatFloat('0' + FormatSettings.DecimalSeparator + '00000e+0', Y[n, i]));
 end;

Memo1.Lines.add(ln);
 end;
  memo1.Lines.EndUpdate;
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
end;

procedure TForm1.Copyspectra1Click(Sender: TObject);
var
  i, sp,n: integer;
begin
  Memo1.Clear;
  sp:= CheckListBox1.ItemIndex;
  For i := 1 to  NoPointsA[sp] do
  begin
    Memo1.Lines.Add(FormatFloat('0' + FormatSettings.DecimalSeparator + '00000',
      x[sp, i]) + #9 + FormatFloat('0' + FormatSettings.DecimalSeparator +
      '00000e+0', Y[sp, i]))
  end;
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
end;

procedure TForm1.CopyTable(Table1: TStringGrid);
var
  Icol, i, j: integer;
  iRow: integer;
  grSel: TGridRect;
  Sel, Method: String;
begin
  // Table:=Sender;

  grSel := Table1.Selection;
  grSel.left := 0;
  grSel.Right := Table1.ColCount - 1;
  grSel.Top := 0;
  grSel.Bottom := Table1.RowCount - 1;
  { if RB0.Checked then Sel:='No baseline'+#013+#010;
    if RB1.Checked then Sel:='AVG baseline'+#013+#010;
    if RB2.Checked then Sel:='Linear baseline'+#013+#010;
  }
  For i := grSel.Top to grSel.Bottom do
  begin
    For j := grSel.left to grSel.Right do
      if (Table1.ColWidths[j]>1) or (j=1) then
      if (j = grSel.Right)  then
        Sel := Sel + Table1.Cells[j, i]
      else
        Sel := Sel + Table1.Cells[j, i] + #009;
    if i <= grSel.Bottom then
      Sel := Sel + #013 + #010;
  end;
  Sel := Sel + #013 + #010;
  if RB0.Checked then
    Method := 'No baseline correction';
  if RB1.Checked then
    Method := 'Baseline correction method: Average: ' + LabeledEdit4.text + '/'
      + LabeledEdit5.text;
  if RB2.Checked then
    Method := 'Baseline correction Method: Linear: ' + LabeledEdit4.text + '/' +
      LabeledEdit5.text;
  if RB3.Checked then
    Method := 'Baseline correction Method: File: ' + BlFIles[0];
  if RB4.Checked then
    Method := 'Baseline correction method: Bricaud: ' + LabeledEdit5.text;
  Clipboard.AsText := Sel + Method;
end;


procedure TForm1.CopyColumn(Table1: TStringGrid; col:integer);
var
  Icol, i, j: integer;
  iRow: integer;
  grSel: TGridRect;
  Sel, Method: String;
begin
  // Table:=Sender;

  grSel := Table1.Selection;
  grSel.left := col;
  grSel.Right := col;
  grSel.Top := 0;
  grSel.Bottom := Table1.RowCount - 1;
  { if RB0.Checked then Sel:='No baseline'+#013+#010;
    if RB1.Checked then Sel:='AVG baseline'+#013+#010;
    if RB2.Checked then Sel:='Linear baseline'+#013+#010;
  }
  For i := grSel.Top to grSel.Bottom do
  begin
    For j := grSel.left to grSel.Right do
      if (Table1.ColWidths[j]>1) then
      if (j = grSel.Right)  then
        Sel := Sel + Table1.Cells[j, i]
      else
        Sel := Sel + Table1.Cells[j, i] + #009;
    if i <= grSel.Bottom then
      Sel := Sel + #013 + #010;
  end;
  Sel := Sel + #013 + #010;

  Clipboard.AsText := Sel + Method;
end;

procedure TForm1.FilenameEdit1AfterDialog(Sender: TObject; var AName: string;
  var Action: Boolean);
var
  i: integer;
begin
  BlFIles.Clear;
  ListBox1.Clear;
  for i := 0 to NoFIles - 1 do
  begin
    if FilenameEdit1.DialogFiles.Count = 1 then
      BlFIles.Add(FilenameEdit1.DialogFiles[0])
    else
      BlFIles.Add(FilenameEdit1.DialogFiles[i]);
    ListBox1.Items.Add(ExtractFIleName(BlFIles[i]));
  end;
 //ShowMessage('sdsad');
 Plotallspectra1Click(CB_Smooth);

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
i: Integer;
begin
  SaveIniFIle;
  Files.Free;
  BlFIles.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;

 
begin
{  AboutBox.GetWindowsDirectory(WinDir);
  AboutBox.GetSystemDirectory(SystemDir);
  SystemDir := SystemDir + '\';
  if AboutBox.IsWindows64 then
    SystemDir := WinDir + '\SysWOW64\';
  // ShowMessage(SystemDir);

  sAppPath := SystemDir;
  if not FileExists(sAppPath + 'fitter.dll') then
  begin
    Fname := sAppPath + 'fitter.dll';
    rStream := TResourceStream.Create(hInstance, 'fitter', RT_RCDATA);
    try
      fStream := TFileStream.Create(Fname, fmCreate);
      try
        fStream.CopyFrom(rStream, 0);
      finally
        fStream.Free;
      end;
    finally
      rStream.Free;
    end;
  end; }
 // System.Sysutils.Formatsettings.DecimalSeparator:=',';

 version:=1005;
 //SHowMEssage(getfileversion(ParamStr(0)));

  Form1.Width := Screen.Width;
  Form1.Height := Screen.Height - 40;
  Form1.Top := 0;
  Form1.left := 0;

  Files := TStringList.Create;
  BlFIles := TStringList.Create;

  StringGrid1.RowHeights[0] := 32;
  StringGrid1.ColWidths[0] := 30;
  StringGrid1.ColWidths[1] := 1; // 140;
  StringGrid1.ColWidths[11] := 65;
  StringGrid1.Cells[0, 0] := 'No';
  StringGrid1.Cells[1, 0] := 'File Name';
  StringGrid1.Cells[2, 0] := 'S @ 275';
  StringGrid1.Cells[3, 0] := '±SE';
  StringGrid1.Cells[4, 0] := 'S @ 350';
  StringGrid1.Cells[5, 0] := '±SE';
  StringGrid1.Cells[6, 0] := 'a@275(fit)';
  StringGrid1.Cells[7, 0] := 'a@350 (fit)';
  StringGrid1.Cells[8, 0] := 'WL_1';
  StringGrid1.Cells[9, 0] := 'WL_2';
  StringGrid1.Cells[10, 0] := 'WL_3';
  StringGrid1.Cells[11, 0] := 'WL_4';
  StringGrid1.Cells[12, 0] := 'WL_5';
  StringGrid1.Cells[13, 0] := 'WL_6';
  StringGrid1.Cells[14, 0] := 'SR(275/350)';
  StringGrid1.Cells[15, 0] := 'Temp';
  StringGrid1.Cells[16, 0] := 'K1';
  StringGrid1.Cells[17, 0] := 'K2';
  StringGrid1.Cells[18, 0] := 'G-H1';
  StringGrid1.Cells[19, 0] := 'G-W1';
  StringGrid1.Cells[20, 0] := 'G-P1';
  StringGrid1.Cells[21, 0] := 'G-H2';
  StringGrid1.Cells[22, 0] := 'G-W2';
  StringGrid1.Cells[23, 0] := 'G-P2';
  StringGrid1.Cells[24, 0] := 'G-H3';
  StringGrid1.Cells[25, 0] := 'G-W3';
  StringGrid1.Cells[26, 0] := 'G-P3';

  StringGrid1.Cells[27, 0] := 'G-H4';
  StringGrid1.Cells[28, 0] := 'G-W4';
  StringGrid1.Cells[29, 0] := 'G-P4';

  StringGrid1.Cells[30, 0] := 'G-H5';
  StringGrid1.Cells[31, 0] := 'G-W5';
  StringGrid1.Cells[32, 0] := 'G-P5';

  StringGrid1.Cells[33, 0] := 'G-H6';
  StringGrid1.Cells[34, 0] := 'G-W6';
  StringGrid1.Cells[35, 0] := 'G-P6';

  diff := True;

 //OpenIni premjesten u Unit_Simul
  N11Click(Self);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

if (Key = 108) or (Key = 76) then LabeledEdit15.Text:=FormatFloat('0', RChart1.MousePosX);
if (Key = 114) or (Key = 82) then LabeledEdit16.Text:=FormatFloat('0', RChart1.MousePosX);

  if (Key = 049) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[2, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[2, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
  if (Key = 050) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[3, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[3, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
  if (Key = 051) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[4, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[4, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
 if (Key = 052) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[5, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[5, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
  if (Key = 053) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[6, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[6, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
  if (Key = 054) and (ssCTRL in Shift) then
    begin
    Form_Simul.SG_Fit_Table.Cells[7, 1] := FormatFloat('0.000', RChart1.MousePosY);
    Form_Simul.SG_Fit_Table.Cells[7, 3] := FormatFloat('0', RChart1.MousePosX);
    end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
i, cent: Integer;
begin
if LabeledEdit14.Focused then if not (Key in [#8, '0'..'9']) then exit;
if LabeledEdit20.Focused then if not (Key in [#8, '0'..'9']) then exit;

if ((Key=#084) or (Key=#116))  then
   begin
   if ChecklistBOx1.Checked[CheckListBox1.itemindex]=false then exit;

   center:=RCHart1.MousePosX;
   for i:= 0 to NoPointsA[CheckListBox1.itemindex] do
    if ((x[CheckListBox1.itemindex,i]<=center) and (x[CheckListBox1.itemindex,i+1]>=center) and (x[CheckListBox1.itemindex,i+1]>=x[CheckListBox1.itemindex,i])) or
     ((x[CheckListBox1.itemindex,i]>=center) and (x[CheckListBox1.itemindex,i+1]<=center)and (x[CheckListBox1.itemindex,i]>=x[CheckListBox1.itemindex,i+1]))
      then
      begin
      cent:= i;
      break;
      end;

   RCHart1.MarkAt(x[CheckListBox1.itemindex,cent],y[CheckListBox1.itemindex,cent],24);
   RChart1.ShowGraf;
   YStartTranslate:=RCHart1.MousePosY;
   Translating:=True;
   RChart1.MouseAction:=SDL_sdlBase.maNone;

   end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
Panel8.Width:=round(Panel1.Width/2);
  RChart1.Height := round(Panel8.Height / 2);
  RChart2.Width := round(Panel8.Width / 2) + 3;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if CheckBox2.Checked then
    Form2.Show;
end;

procedure TForm1.GroupBox3DblClick(Sender: TObject);
var
  pkp: array [0 .. 10] of integer;
  pkh: array [0 .. 10] of double;
  i, pkn: integer;
begin
  Exit;
  DifferencePeaks(x[0], Y[0], 15, 250, pkn, pkp, pkh);
  RChart1.DataColor := ClRed;
  for i := 1 to pkn do
  begin
    RChart1.line(x[0, round(pkp[i])], Y[0, round(pkp[i])], x[0, round(pkp[i])],
      Y[0, round(pkp[i])] - pkh[i]);
    ShowMessage(floatToStr(x[0, round(pkp[i])]) + ' ' +
      FormatFloat('0.000', pkh[i]));
  end;
  RChart1.ShowGraf;

end;

procedure TForm1.GroupBox4DblClick(Sender: TObject);
var
i, bp: Integer;
ipp: array[0..50] of integer;
begin
Form_Simul.Visible:=true;
PeakfindMin(X[0],Y[0], 1,NoPointsA[0], bp, ipp);
for i := 1 to bp do Form_Simul.SG_Fit_Table.Cells[i+1,3]:=formatFloat('0.0',x[0,ipp[i]]);

end;

procedure TForm1.Label7Click(Sender: TObject);
var
source, dest : String;
newversion:Boolean;
begin
newversion:=false;
//Source:='https://mojoblak.srce.hr/public.php?service=files&t=79aa18620b5effda9d8a940e1cee188c&download';
//Source:='https://mojoblak.srce.hr/public.php?service=files&t=79aa18620b5effda9d8a940e1cee188c';
//Source:='https://mojoblak.srce.hr/public.php?service=files&t=ce948ba7fe3989cf8c95c2b505eb098c&path=%2FAsfit&files=ASFit.ver&download';
//
Source:='https://drive.google.com/uc?export=download&id=1n0MyM2ND_InuYcDNRlY84QIMGONYmvF8';
Dest:=ExtractFilePath(ParamStr(0))+'Ver.tmp';
DoDownload(source, dest);
memo4.Clear;
if fileexists(dest)=false then exit;

Memo4.Lines.LoadFromFile(Dest);
Memo4.lines.Add(FloatToStr(version));
if strToFloat(memo4.Lines[0])>version then newversion:=True;
if newversion then
 begin
 ShowMessage('New version of ASFit exists!'+#13+#13+'You will be redirected to download website.');
  ShellExecute(0, 'OPEN',
    PChar('https://sites.google.com/site/daromasoft/home/asfit'), '',
    '', SW_SHOWNORMAL);
 end else ShowMessage('You have the most recent version of ASFit !');
end;

procedure TForm1.LabeledEdit12Change(Sender: TObject);
var
i: Integer;
begin
if StrToFloat(LabeledEdit12.Text)=0 then exit;

for i := 0 to NoFIles-1 do
      pathL[i]:=StrToFloat(LabeledEdit12.Text);
  resetSP := True;
  Plotallspectra1Click(Self);
end;

procedure TForm1.LabeledEdit20Change(Sender: TObject);
begin
if (length(LabeledEdit20.text)<3) or (length(LabeledEdit14.text)<3) then exit;
Plotallspectra1Click(CB_Smooth);
end;

procedure TForm1.LabeledEdit5Change(Sender: TObject);
VAR
  i: integer;
begin
if (length(LabeledEdit4.text)<3) or (length(LabeledEdit5.text)<3) then exit;
if StrToFloat(LabeledEdit5.text)>StrToFloat(LabeledEdit20.text)  then
  begin
 // ShowMessage(LabeledEdit5.text);
  LabeledEdit5.text:=LabeledEdit20.text;
  ShowMessage('R bound WL corrected to upper range of data!');
  end;


resetSP := True;
  Plotallspectra1Click(Self);
  for i := 1 to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[i].Clear;
  StringGrid1.Refresh;
end;

procedure TForm1.LabeledEdit6Change(Sender: TObject);
begin
if CB_Fit_Gauss.Checked then
  begin
 // DefGLW:=LabeledEdit6.text;
 // DefGHW:=LabeledEdit7.text;
  end else
  begin
 // DefSSLW:=LabeledEdit6.text;
 // DefSSHW:=LabeledEdit7.text;
  end;
  
end;   

procedure TForm1.ListBox1DblClick(Sender: TObject);
var
  i: integer;
  bl: Boolean;
begin

  if RB1.Checked or RB2.Checked or RB4.Checked then
  begin
    //if RB4.Checked=false then
    LabeledEdit4.Visible := True;
    LabeledEdit5.Visible := True;
  end
  else
  begin
    LabeledEdit4.Visible := false;
    LabeledEdit5.Visible := false;
  end;
  if RB2.Checked then
  begin
   // LabeledEdit10.Visible := True;
    //LabeledEdit11.Visible := True;
  end
  else
  begin
    LabeledEdit10.Visible := false;
    LabeledEdit11.Visible := false;
  end;


  if (FileExists(FilenameEdit1.FileName) = false) and (RB3.Checked = True) then
    bl := false
  else
    bl := True;
  FilenameEdit1.Visible := RB3.Checked;
 // CheckBox11.Visible := RB3.Checked;
  Label9.Visible := RB3.Checked;


  if RB3.Checked=false then
    begin
    if ListBox1.Visible then Panel10.Width:=CheckListBOx1.Width+2;
    ListBox1.Visible:= false;
    end else
    begin
    Panel10.Width:=CheckListBOx1.Width+2+ListBOx1.Width;
    ListBox1.Visible:= True;
    end;


  if bl = false then
  begin
    //ShowMessage('Select BLANK file!');
    // RB0.Checked:=True;
    if FilenameEdit1.Dialog.Execute then
      begin
       BlFIles.Clear;
       ListBox1.Clear;
       for i := 0 to NoFIles - 1 do
          begin
           if FilenameEdit1.DialogFiles.Count = 1 then
           BlFIles.Add(FilenameEdit1.DialogFiles[0])
             else
           BlFIles.Add(FilenameEdit1.DialogFiles[i]);
           ListBox1.Items.Add(ExtractFIleName(BlFIles[i]));
           end;
      FilenameEdit1.FileName:=FilenameEdit1.DialogFiles[0];
     // Panel10.Width:=CheckListBOx1.Width+ListBOx1.Width;
     // ListBox1.Visible:= True;
      Plotallspectra1Click(CB_Smooth);
      end;

    Exit;
  end;

 //Panel10.Width:=CheckListBOx1.Width;
  resetSP := True;
  Plotallspectra1Click(CB_Smooth);
  for i := 1 to StringGrid1.RowCount - 1 do
    StringGrid1.Rows[i].Clear;
  StringGrid1.Refresh;
  // SpeedButton2Click(SpeedButton4);
  // exit;
end;

procedure TForm1.OptimizeOne(XpPik, YpPik: array of double;
  NoPoc, NoKraj, slNo: integer; weight: Boolean);
var
  i, pk, j, k: integer;
  ParamCount, VectorSize, nop, sln: integer;
  XPik, YPik, p, S, O, izraz, IzrazGauss, ww: OleVariant;
  str1, str2: String;
begin

  VectorSize := NoKraj - NoPoc + 1;
  ParamCount := 2;
  BrojParametara := ParamCount;
  XPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  YPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  ww := VarArrayCreate([0, VectorSize - 1], varVariant);
  For i := 0 to VectorSize - 1 do
  begin
    XPik[i] := XpPik[NoPoc + i];
    YPik[i] := YpPik[NoPoc + i];
    ww[i] := 1; // abs(YPik[i]);
  end;

  p := VarArrayCreate([0, ParamCount - 1], varVariant);
  S := VarArrayCreate([0, ParamCount - 1], varVariant); // 0, 2,
  for i := 0 to ParamCount - 1 do
    S[i] := 0;

  p[0]:=YPik[0];
  p[1] := 0.02; // StrToFloat(Edit5.Text)*0.8;

  O := VarArrayCreate([0, 2], varVariant);
 // O[0] := 1E-5;
 // O[1] := 1E-5;
  // O[2]:=0;
  // O[3]:=0;

  str2 := floatToStr(XPik[0]);
  str1 := floatToStr(YPik[0]);
  // OleInitialize(NIL);
  //izraz := str1 + '*exp(-p1*(cx-' + str2 + '))';
  izraz := 'p1*exp(-p2*(cx-' + str2 + '))';
  try
    Fitter := CreateOleObject('Fitter.LMFitter');
  except
    on e: Exception do
    begin
      WriteLn('Unable to create <Fitter.DMFitter>!');
      halt;
    end;
  end;

  Fitter.Expression := izraz;
  Fitter.ParamCount := ParamCount; // number of terms in the polynom
  Fitter.x := XPik;
  Fitter.Y := YPik;
  Fitter.weight := ww;
  Fitter.Parameters := p;
  Fitter.Sigmas := S;
  Fitter.Iterations := 100;
  Fitter.Options := O;
  if weight then
    Fitter.WeightType := 1
  else
    Fitter.WeightType := 0; // <- this step is optional
  // TestFitterEventSink:=TTestFitterEventSink.Create(Fitter);
  if Fitter.LMFit then
  begin
    p := Fitter.Parameters;
    S := Fitter.Sigmas;;
  end
  else
    ShowMessage('Fitting error #' + intToStr(Fitter.ResultCode));
 //ShowMessage(FormatFloat('0.0000', vg[2]));
  vg[2] := p[1];
end;

 procedure TForm1.OptimizeScatter(XpPik, YpPik: array of double; NoPoc, NoKraj: integer; alter: Boolean;var con,bas: Double);
var
  i, pk, j, k: integer;
  ParamCount, VectorSize, nop, sln: integer;
  XPik, YPik, p, S, O, izraz, IzrazGauss, ww: OleVariant;
  str1, str2: String;
begin

  VectorSize := NoKraj - NoPoc + 1;
  ParamCount := 2;
  XPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  YPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  ww := VarArrayCreate([0, VectorSize - 1], varVariant);
  For i := 0 to VectorSize - 1 do
  begin
    XPik[i]:= XpPik[NoPoc + i];
    YPik[i]:= YpPik[NoPoc + i];
    //if alter=false then  XPik[i]:= XPik[i]/100;
    //ww[i] := 1; // abs(YPik[i]);
  end;

  p := VarArrayCreate([0, ParamCount - 1], varVariant);
  S := VarArrayCreate([0, ParamCount - 1], varVariant); // 0, 2,
  for i := 0 to ParamCount - 1 do S[i] := 0;

   if alter then p[0]:=0.1 else p[0]:=10;
   p[1]:= YPik[VectorSize-2]; // StrToFloat(Edit5.Text)*0.8;

  O := VarArrayCreate([0, 2], varVariant);
  //O[0] := 1E-5;
 // O[1] := 1E-5;
  // O[2]:=0;
  // O[3]:=0;
 // ShowMessage('ok');
 // OleInitialize(NIL);
  if alter then izraz := 'log(1/(1-p1/cx))+p2' else izraz := 'log(1/(1-p1/cx^4))+p2';

  try
    Fitter := CreateOleObject('Fitter.LMFitter');
  except
    on e: Exception do
    begin
      WriteLn('Unable to create <Fitter.DMFitter>!');
      halt;
    end;
  end;

  Fitter.Expression := izraz;
  Fitter.ParamCount := ParamCount; // number of terms in the polynom
  Fitter.x := XPik;
  Fitter.Y := YPik;
//  Fitter.weight := ww;
  Fitter.Parameters := p;
  Fitter.Sigmas := S;
  Fitter.Iterations := 100;
  Fitter.Options := O;
 // if weight then
  //  Fitter.WeightType := 1
 // else
    //Fitter.WeightType := 0; // <- this step is optional
  // TestFitterEventSink:=TTestFitterEventSink.Create(Fitter);
  if Fitter.LMFit then
  begin
    p := Fitter.Parameters;
    S := Fitter.Sigmas;;
  end
  else
    ShowMessage('Fitting error #' + intToStr(Fitter.ResultCode));
  //if alter then con:=p[0] else con:=p[0]*1e8;
  con:=p[0];
  bas:=p[1];
  //ShowMessage(FloatToStr(con)+' '+FloatToStr(bas))
end;

procedure TForm1.OptimizeOneBKGauss(XpPik, YpPik: array of double;
  NoPoc, NoKraj, slNo, iterations: integer; weight, bc: Boolean);
var
  i, pk, j, k, a: integer;

  ParamCount, VectorSize, nop, sln, np: integer;
  Ytemp: array [0 .. maxpoints] of double;
  XPik, YPik, p, S, O, izraz, IzrazGauss, ww, sgf: OleVariant;
  // P: Array of vAriant;
  // S: Array of array of vAriant;
  // s: OlevAriant;
  str1, str2: String;
  IPL, IPS, IPR: array [0 .. 500] of integer;
  Xipl, XipR, XIPS, YipL, YipR, YIPS: array [0 .. 500] of double;
  brojPikova, bp, g, gausNoLimit: integer;
  ipw, pymin: double;
  posw, widw, fkt: Double;
  format: String;
begin

  pymin := YpPik[NoPoc + 20] * 0.01;
  posw:=StrToFloat(Form_Simul.LabeledEdit18.Text);
  widw:=StrToFloat(Form_Simul.LabeledEdit19.Text);
  VectorSize := NoKraj - NoPoc + 1;
  // VectorSize:=round(VectorSize/2);
 np:=NoKraj-NoPoc+1;
 fkt:=1;
 if (YpPik[NoPoc+10]>10) and (YpPik[NoPoc+10]<1000) then fkt:=1;//100;
 if (YpPik[NoPoc+10]<10) and (YpPik[NoPoc+10]>1) then fkt:=10;//1000;
 if (YpPik[NoPoc+10]<1) then fkt:=100;//10000;
 if (YpPik[NoPoc+10]<0.1) then fkt:=1000;//100000;

//ShowMessage(FloatToStr(fkt));

  if CB_Fit_Gauss.Checked = false then
    brojPikova := 0;
  if brojPikova > 0 then
    ParamCount := brojPikova * 3 + 3
  else
    ParamCount := 3;

  if SpinEdit2.Value > 0 then
  begin
    brojPikova := SpinEdit2.Value;
    ParamCount := SpinEdit2.Value * 3 + 3;
  end;

  BrojParametara := ParamCount;
  if SpinEdit2.Value > 0 then
    NoGauss := SpinEdit2.Value
  else
    NoGauss := brojPikova;
  XPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  YPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  ww := VarArrayCreate([0, VectorSize - 1], varVariant);

  For i := 0 to VectorSize - 1 do
  begin
    XPik[i] := XpPik[NoPoc + i];
    YPik[i] := YpPik[NoPoc + i]*fkt;
     ww[i]:=ln((abs(YPik[i])));
   //  RChart1.MarkAt(XPik[i],YPik[i],17);
  end;
 // RChart1.ShowGraf;
//SHowMessage('sdada');
if NoGauss=0 then bc:=False;

  p := VarArrayCreate([0, ParamCount - 1], varVariant);
  if bc then
  begin
    S := VarArrayCreate([0, ParamCount - 1, 0, 2], varVariant); // 0, 2,
    sgf := VarArrayCreate([0, ParamCount - 1, 0, 2], varVariant);
  end
  else
    S := VarArrayCreate([0, ParamCount - 1], varVariant); // 0, 2,

  if bc then
    for i := 0 to ParamCount - 1 do
    begin
      S[i, 0] := 0;
      S[i, 1] := 0;
      S[i, 2] := 10000;
    end
  else
    for i := 0 to ParamCount - 1 do  S[i] := 0;

  p[0] := YPik[0];
  p[1] := 0.020; // StrToFloat(Edit5.Text)*0.8;
  p[2] := 0;


  if bc then
  begin
    S[0, 1] := abs(YPik[0] * 0.2);;
    S[0, 2] := abs(YPik[0] * 2);
    S[1, 1] := 0.005;
    S[1, 2] := 0.050;
    S[2, 1] := -abs(YPik[VectorSize - 1] * 1.5);//0;
    S[2, 2] := abs(YPik[VectorSize - 1] * 1.5);
    if CB_Fit_a0.Checked = false then S[0, 0] := -1;
    if CB_Slope.Checked = true then   S[1, 0] := -1;
    if CB_Fit_K.Checked = false then S[2, 0] := -1;
  end
  else
  begin
    if CB_Fit_a0.Checked = false then
      S[0] := -1;
    if CB_Fit_K.Checked = false then
      S[2] := -1;
  end;




  // if CheckBox1.Checked=false then S[1]:=-1;

  if SpinEdit2.Value = 0 then // ovo je automatsko pridruzivanje
    for i := 0 to brojPikova - 1 do
    begin
      p[i * 3 + 3] := YIPS[i + 1]; // ((YipR[i+1]+YipL[i+1])/2)-YipR[i+1];;
      // ShowMessage(FloatToStr(p[i*3+3]));
      p[i * 3 + 4] := 15;
      p[i * 3 + 5] := XIPS[i + 1];
      if bc then
      begin
        S[i * 3 + 4, 1] := 8;
        S[i * 3 + 4, 2] := 35;
        S[i * 3 + 5, 1] := XIPS[i + 1] - 15;
        S[i * 3 + 5, 2] := XIPS[i + 1] + 15;
        if FOrm_Simul.CB_Fix_Width.Checked then S[i * 3 + 4, 0] := -1;
        if FOrm_Simul.CB_Fix_Pos.Checked then S[i * 3 + 5, 0] := -1;
      end;
    end;

  sln := slNo;

  if (NoGauss > 0)  and CB_Fit_Gauss.checked then // ovo je da bi se ocitavalo iz tablice
  begin
    if CB_Slope.Checked then
    begin
     p[0] := 0;
     p[1] := 0.0;
     p[2] := 0;
    end else
    begin
      p[0] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[1, 1])*fkt;//YPik[0]*1.0;
      p[1] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[1, 2]);//0.020; // StrToFloat(Edit5.Text)*0.8;
      p[2] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[1, 3]);//0;
    end;

    for i := 0 to SpinEdit2.Value - 1 do
    begin
      p[i * 3 + 3] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 1])*fkt;
      p[i * 3 + 4] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 2]);;
      p[i * 3 + 5] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 3]);
      if bc then
      begin
       // S[i * 3 + 3, 1] :=0;
       // S[i * 3 + 3, 2] :=p[i * 3 + 3]*30;
        S[i * 3 + 4, 1] :=8;//StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 2])-widw;//8;
        S[i * 3 + 4, 2] :=widw;//StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 2])+widw/2;//45;
        S[i * 3 + 5, 1] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 3]) - posw/2;//15;
        S[i * 3 + 5, 2] := StrToFloat(Form_Simul.SG_Fit_Table.Cells[sln + 1 + i, 3]) + posw/2;//15;
        if FOrm_Simul.CB_Fix_Width.Checked then S[i * 3 + 4, 0] := -1;
        if FOrm_Simul.CB_Fix_Pos.Checked then S[i * 3 + 5, 0] := -1;
      end;
    end;
  end;

  // Form_Simul.SG_Fit_Table.Cols[sln].Clear;
  // for I := 2 to 10 do Form_Simul.SG_Fit_Table.Cols[i].Clear;
  g := 1;
  for i := 0 to ParamCount - 1 do
  begin
    if (i > 3 * g - 1) then
    begin
      g := g + 1;
      sln := sln + 1;
    end;
    // Form_Simul.SG_Fit_Table.Cells[sln,i-3*(g-1)+1]:=FOrmatFloat('0.00000',p[i]);
  end;

  for i := 0 to ParamCount - 1 do vg[i] := p[i];
  if bc then for i := 0 to ParamCount - 1 do sg[i] := S[i, 0]
        else for i := 0 to ParamCount - 1 do sg[i] := S[i];

  O := VarArrayCreate([0, 4], varVariant);
  if bc then
  begin
   // O[0] := 1E-4;
   // O[1] := 1E-3;
   //  O[2]:=1e-17;  //-7
   //O[3]:=1e-7;  //-5
  // O[4]:=1e-5;  //-3
  end
  else
  begin
   // O[0] := 1E-17;
   // O[1] := 1E-17;
  end;


str2 := floatToStr(XPik[0]);//floatToStr(round((XPik[0]+XPik[VectorSize - 1])/2));
  IzrazGauss := '';
  if NoGauss > 0 then
  begin
    AddGauss_Izraz(brojPikova, false, IzrazGauss);
    IzrazGauss := '+' + IzrazGauss;
  end;

  OleInitialize(NIL);

  izraz := 'p1*exp(-p2*(cx-' + str2 + '))+p3' + IzrazGauss;
//ShowMessage(izraz);
  Panel2.Caption := izraz;
  try
    Fitter := CreateOleObject('Fitter.LMFitter');
  except
    on e: Exception do
    begin
      WriteLn('Unable to create <Fitter.DMFitter>!');
      halt;
    end;
  end;

  Fitter.Expression := izraz;

  Fitter.ParamCount := ParamCount; // number of terms in the polynom
  Fitter.x := XPik;
  Fitter.Y := YPik;
  Fitter.Weight:=WW;
  Fitter.Parameters := p;
  Fitter.Sigmas := S;
  if bc then  Fitter.Iterations := SpinEdit3.Value
     else Fitter.Iterations := SpinEdit3.Value*4;

  if CB_Slope.Checked then Fitter.Iterations := SpinEdit3.Value*4;
  if CB_Fit_Gauss.Checked=False then Fitter.Iterations := SpinEdit3.Value*4;

  Fitter.Options := O;
   if weight then Fitter.WeightType:=1 else Fitter.WeightType:=0; // <- this step is optional


  if Fitter.LMFit then
  begin
    p := Fitter.Parameters;
    if bc then
      sgf := Fitter.Sigmas
    else
      S := Fitter.Sigmas;
  end
  else
  begin
    panel9Click(Self);
    Panel9.Visible:=False;
    ShowMessage('Fitting error #' + intToStr(Fitter.ResultCode));
  end;


  Form_Simul.SG_Fit_Table.cols[slNo].Clear;
  Form_Simul.SG_Fit_Table.Cells[slNo,0]:='Exp '+IntToStr(slNo);
 // p[2]:=p[2]/fkt;
  // for I := 1 to 3 do Form_Simul.SG_Fit_Table.Rows[i].Clear;
  g := 1;
  for i := 0 to ParamCount - 1 do
  begin
    if (i > 3 * g - 1) then
    begin
      g := g + 1;
      slNo := slNo + 1;
    end;
    format := '0.00000';
    if slNo > 1 then
    begin
      if (i - 3 * (g - 1) + 1) = 1 then        format := '0.00000';
      if (i - 3 * (g - 1) + 1) = 2 then        format := '0.00';
      if (i - 3 * (g - 1) + 1) = 3 then        format := '0.0';
      if NoGauss = 0 then
        format := '0.00000';
    end
    else
    begin
      if (i - 3 * (g - 1) + 1) = 1 then         format := '0.0000';
      if (i - 3 * (g - 1) + 1) = 2 then         format := '0.00000';
      if (i - 3 * (g - 1) + 1) = 3 then         format := '0.0000';

    end;
    if ((i - 3 * (g - 1) + 1) = 1) or (i=2) then p[i]:=p[i]/fkt;
    Form_Simul.SG_Fit_Table.Cells[slNo, i - 3 * (g - 1) + 1] := FormatFloat(format, p[i]);
  end;

Form_Simul.SG_Fit_Table.refresh;

  for i := 0 to ParamCount - 1 do vg[i] := p[i];
  if bc then
    for i := 0 to ParamCount - 1 do sg[i] := sgf[i, 0]
  else
    for i := 0 to ParamCount - 1 do sg[i] := S[i];
end;

procedure TForm1.OptimizeLog(XpPik, YpPik: array of double;
  NoPoc, NoKraj, slNo: integer; weight: Boolean);
var
  i, pk, j, k: integer;

  ParamCount, VectorSize, nop, sln, np: integer;
  Ytemp: array [0 .. maxpoints] of double;
  XPik, YPik, p, S, O, izraz, IzrazGauss, ww: OleVariant;
  str1, str2: String;
  IPL, IPS, IPR: array [0 .. 500] of integer;
  Xipl, XipR, XIPS, YipL, YipR, YIPS: array [0 .. 500] of double;
  brojPikova, bp, g: integer;
  ipw, pymin: double;
begin
  pymin := YpPik[NoPoc + 20] * 0.01;
  VectorSize := NoKraj - NoPoc + 1;
 np:=vectorSize;
 brojPikova:=0;
 NoGauss:=0;
 ParamCount := 3;
  XPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  YPik := VarArrayCreate([0, VectorSize - 1], varVariant);
  ww := VarArrayCreate([0, VectorSize - 1], varVariant);
  For i := 0 to VectorSize - 1 do
  begin
    XPik[i] := (XpPik[NoPoc + i]);
    if YpPik[NoPoc + i]<0 then YPik[i] := ln(-YpPik[NoPoc + i]) else
    YPik[i] := ln(YpPik[NoPoc + i]);
    ww[i] := 1; // abs(YPik[i]);
  end;

  p := VarArrayCreate([0, ParamCount - 1], varVariant);
  S := VarArrayCreate([0, ParamCount - 1], varVariant); // 0, 2,

  for i := 0 to ParamCount - 1 do
    S[i] := 0;

  // ShowMessage(IntToStr(Nogauss)+' '+IntToStr(Nogauss)+)

  p[0] := YpPik[nopoc]; // YPik[0];
  p[1] := 0.02; // StrToFloat(Edit5.Text)*0.8;
  if CB_Fit_K.Checked = false then
    p[2] := 0
  else
    p[2] := 0;

  if CB_Fit_a0.Checked = false then
    S[0] := -1;
  if CB_Fit_K.Checked = false then
    S[2] := -1;
  if SpinEdit2.Value = 0 then
    for i := 0 to brojPikova - 1 do
    begin
      p[i * 3 + 3] := (YipR[i + 1] + YipL[i + 1]) / 2 - YipL[i + 1];;
      p[i * 3 + 4] := 15;
      p[i * 3 + 5] := (XIPS[i + 1]);//ln(XIPS[i + 1]);
    end;

  sln := slNo;

   g := 1;
  for i := 0 to ParamCount - 1 do
  begin
    if (i > 3 * g - 1) then
    begin
      g := g + 1;
      sln := sln + 1;
    end;
    // Form_Simul.SG_Fit_Table.Cells[sln,i-3*(g-1)+1]:=FOrmatFloat('0.00000',p[i]);
  end;
  for i := 0 to ParamCount - 1 do
    vg[i] := p[i];
  for i := 0 to ParamCount - 1 do
    sg[i] := S[i];



  O := VarArrayCreate([0, 2], varVariant);
  
  str2 := FormatFloat('0.00', (XPik[0]));

  IzrazGauss := '';
  if brojPikova > 0 then
  begin
    AddGauss_Izraz(brojPikova, True, IzrazGauss);
    IzrazGauss := '+' + IzrazGauss;
  end;

  // OleInitialize(NIL);
  //izraz := 'p1*exp(-p2*(exp(cx)-exp(' + str2 + ')))+p3' + IzrazGauss;
  //izraz := 'ln(' + izraz + ')';
  izraz:='ln(p1)-p2*(cx-'+str2+')';
 //ShowMessage(izraz);
  Panel2.Caption := izraz+IzrazGauss;
  Panel2.update;
  try
    Fitter := CreateOleObject('Fitter.LMFitter');
  except
    on e: Exception do
    begin
      WriteLn('Unable to create <Fitter.DMFitter>!');
      halt;
    end;
  end;

  Fitter.Expression := izraz;

  Fitter.ParamCount := ParamCount; // number of terms in the polynom
  Fitter.x := XPik;
  Fitter.Y := YPik;
  Fitter.weight := ww;
  Fitter.Parameters := p;
  Fitter.Sigmas := S;
  Fitter.Iterations := 50;
  Fitter.Options := O;
  if weight then
    Fitter.WeightType := 1
  else
    Fitter.WeightType := 0; // <- this step is optional
  // ShowMessage('prosao');
  // TestFitterEventSink:=TTestFitterEventSink.Create(Fitter);
  if Fitter.LMFit then
  begin
    p := Fitter.Parameters;
    S := Fitter.Sigmas;;
  end
  else
    ShowMessage('Fitting error #' + intToStr(Fitter.ResultCode));
 //for i := 0 to ParamCount - 1 do  showMessage(FormatFloat('0.0000', p[i]));
  // slope:=p[1];
  // LambdaStart:=p[0];//Y[NoPoc];
  // BaseK:=p[2];
  Form_Simul.SG_Fit_Table.cols[slNo].Clear;
 // for i := 2 to 10 do
  //  Form_Simul.SG_Fit_Table.cols[i].Clear;
  g := 1;

  //for i := 0 to ParamCount - 1 do ShowMessage(FormatFloat('0.00000', p[i]));

  if CB_Fit_Gauss.Checked=false then
  for i := 0 to ParamCount - 1 do
  begin
  //ShowMessage(FormatFloat('0.00000', p[i]));
    if (i > 3 * g - 1) then
    begin
      g := g + 1;
      slNo := slNo + 1;
    end;
    if (i + 1 - 3) mod 3 = 0 then p[i] := p[i];//p[i] := exp(p[i]);
    Form_Simul.SG_Fit_Table.Cells[slNo, i - 3 * (g - 1) + 1] := FormatFloat('0.00000', p[i]);
  end;

  for i := 0 to ParamCount - 1 do
    vg[i] := p[i];
  for i := 0 to ParamCount - 1 do
    sg[i] := S[i];

end;

// procedure TForm1.Panel1Click(Sender: TObject);
procedure TForm1.PageControl1Change(Sender: TObject);
begin
if PageCOntrol1.TabIndex=1 then if Nofiles>2 then Button5Click(Self);

end;

procedure TForm1.Panel8Resize(Sender: TObject);
begin
  RChart2.Width := round(Panel8.Width / 2) + 3;
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
 stop := True;
 Panel9.Visible:=False;
 Screen.Cursor:=crDefault;
end;

procedure TForm1.PasteXYspectradata1Click(Sender: TObject);
var
  Fname: string;
  bl: Boolean;
begin
  Memo2.Clear;
  Memo2.PasteFromClipboard;

  Fname := ExtractFilepath(ParamStr(0)) + 'TempFile.txt';
  Memo2.Lines.SaveToFile(Fname);
  Files.Clear;
  Files.Add(Fname);
  NoFIles:=1;
  StringGrid1.RowCount := 2;
  StringGrid1.Rows[1].Clear;
  Caption := 'ASFit - ' + ExtractFilepath(Files[0]);
  resetSP := True;
  CheckListBox1.Clear;
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false
  else
    bl := True;

  if resetSP then
  begin
    OpenFile(x[0], Y[0],PathL[0], NoPointsA[0],Files[0]);
    if CheckBox8.Checked then
      Reconstructspectra(x[0], Y[0],NoPointsA[0]);
    if CheckBox15.Checked then TranslateLamp(x[0], Y[0],1, NoPointsA[0], StrToFloat(Edit12.text));
    if CB_Smooth.Checked then
      SGSmutiranje(Y[0], 1, NoPointsA[0], SpinEdit1.Value);

    if RB3.Checked then
      SubtractBlank(x[0], Y[0],YBln[0], NoPointsA[0], BlFIles[0]);
    if bl then
      SubtractBaseline(x[0], Y[0],YBln[0],NoPointsA[0]);
    if CheckBox5.Checked then
        LogTransform(x[0], Y[0], NoPointsA[0]);
    if CB_Derivative.Checked then
      begin
      DeriveSG(Y[0], 1, NoPointsA[0]);
      if SpinEdit5.value=2 then
        begin
        if CB_Smooth.Checked then SGSmutiranje(Y[0], 1, NoPointsA[0], SpinEdit1.Value);
        DeriveSG(Y[0], 1, NoPointsA[0]);
        end;
      end;
  end;
  pathL[0]:=StrToFloat(LabeledEdit12.Text);
  CheckListBox1.Items.Add(ExtractFIleName(Files[0]));
  CheckListBox1.State[CheckListBox1.Items.Count - 1] := cbChecked;
  boja[0] := ClBlack;
  CheckListBox1.ItemIndex := 0;
  Label5.Caption := 'Number of files: ' + intToStr(1);
  RChart1.Caption := Form1.CheckListBox1.Items[0];
  Plotallspectra1Click(Self);
  Panel7.Enabled:=True;
end;

procedure TForm1.Performadditionalfitting1Click(Sender: TObject);
var
  Row, i: integer;
  bl: Boolean;
begin
//if Cb_Fit_Gauss.Checked=False then exit;
 //ShowMessage('das');
  startTime := now;

  StringGrid1.Options := StringGrid1.Options + [goRowselect];
  if CheckListBox1.Items.Count < 1 then
    Exit;
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false
  else
    bl := True;
  i := CheckListBox1.ItemIndex;

  RChart1.Caption := CheckListBox1.Items[CheckListBox1.ItemIndex];

  Calculate(CheckListBox1.ItemIndex, false);
  NacrtajGraf(RChart1,x[i], Y[i], 1, NoPointsA[i], Clblack, CheckBox5.Checked, false, True, CheckBox3.Checked, True);
  Form_Simul.SG_Fit_Table.Refresh;

  Row := CheckListBox1.ItemIndex + 1; // StringGrid1.Row;
  StringGrid1.Row := Row;
  if (StringGrid1.Cells[2, Row] <> '') and
    (copy(CheckListBox1.Items[0], 1, 6) = copy(StringGrid1.Cells[1, 1], 1, 6))
  then
  begin
    Edit5.text := StringGrid1.Cells[2, Row];
    Edit1.text := StringGrid1.Cells[4, Row];
    Edit8.text := StringGrid1.Cells[6, Row];
    Edit9.text := StringGrid1.Cells[7, Row];
    Edit2.text := StringGrid1.Cells[16, Row];
    Edit10.text := StringGrid1.Cells[17, Row];
  end;

  PlotFit(1, StrToInt(Edit3.text), StrToInt(Edit4.text));
    if CB_Fit_Gauss.Checked = false then
      PlotFit(2, StrToInt(Edit6.text), StrToInt(Edit7.text));;
  StringGrid1.Options := StringGrid1.Options - [goRowselect];
  endTime := now;
  Label1.Caption := 'Calculation speed: ' + FormatFloat('0.0 s',
    (endTime - startTime) * 86400);
end;

procedure TForm1.Plotallspectra1Click(Sender: TObject);
var
  i, ch: integer;
  bl: Boolean;
begin
  RChart1.ClearGraf;
 if CB_Derivative.Checked and (CB_Smooth.Checked=False) then ShowMEssage('Smoothing of data is recommended when using derivative transformation!');

 // if RChart1.Showing then RChart1.SetFocus;
  if Sender = CB_Smooth then
    resetSP := True;
  if Sender = CB_Derivative then
    resetSP := True;
  if Sender = CheckBox6 then
    resetSP := True;
  if Sender = CheckBox5 then
    resetSP := True;
  if Sender = CheckBox11 then
    resetSP := True;
  if Sender = CheckBox10 then
    resetSP := True;
  if Sender = CheckBox15 then
    resetSP := True;
  if Sender = SpinEdit1 then
    resetSP := True;
  if Sender = SpinEdit5 then
    resetSP := True;
  if Sender = CB_Trans then
    resetSP := True;
  if (Sender = SpinEdit1) and (CB_Smooth.Checked = false) then
    CB_Smooth.State := cbChecked;

  ch := -1;
  if (FileExists(FilenameEdit1.FileName) = false) and RB3.Checked then
    bl := false
  else
    bl := True;

  for i := 0 to CheckListBox1.Items.Count - 1 do

    begin
      if resetSP then
      begin
        OpenFile(x[i], Y[i],PathL[i],NoPointsA[i], Files[i]);
  //        for a := 1 to np do
  begin
    Xorg[i]:=X[i];
    Yorg[i]:=Y[i];
  end;

        if CheckBox8.Checked then
          Reconstructspectra(x[i], Y[i],NoPointsA[i]);
        if CheckBox15.Checked then
          TranslateLamp(X[i],Y[i], 1, NoPointsA[i], StrToFloat(Edit12.text));

        if CB_Smooth.Checked then
          SGSmutiranje(Y[i], 1, NoPointsA[i], SpinEdit1.Value);

       CheckSlope(x[i], Y[i],NoPointsA[i]);

       if RB3.Checked then
          SubtractBlank(x[i], Y[i],YBln[i], NoPointsA[i],BlFIles[i])
        ELSE if bl then
          SubtractBaseline(x[i], Y[i],YBln[i],NoPointsA[i]);

      if CheckBox5.Checked then
          LogTransform(x[i], Y[i],NoPointsA[i]);

        if CB_Derivative.Checked then
        begin
          DeriveSG(Y[i], 1, NoPointsA[i]);
          if SpinEdit5.value>1 then
            begin
            if CB_Smooth.Checked then SGSmutiranje(Y[i], 1, NoPointsA[i], SpinEdit1.Value);
            DeriveSG(Y[i], 1, NoPointsA[i]);
            end;
          if SpinEdit5.value>2 then
            begin
            if CB_Smooth.Checked then SGSmutiranje(Y[i], 1, NoPointsA[i], SpinEdit1.Value);
            DeriveSG(Y[i], 1, NoPointsA[i]);
            end;
        end;

       if CheckBox10.Checked then Normalize(x[i],Y[i],NoPointsA[i], StrToFloat(Edit11.text));
      end;

      if CheckListBox1.Checked[i] then
      begin
      if sender<>RChart1 then NacrtajGraf(RChart1,x[i], Y[i], 1, NoPointsA[i], boja[i], CheckBox5.Checked, True, false, false, false);
        ch := i;
       // ShowMessage(ExtractFileName(FIles[ch]));
      end;

    end;
   //ShowMessage(ExtractFileName(FIles[ch]));
  if ch = -1 then
  BEGIN
    RChart1.SuppressPaint := false;
    RChart1.Caption := '';
    RChart1.ShowGraf;
    Exit;
  END;
  resetSP := false;
  { OpenFile(x[ch],y[ch],FIles[ch]);
    if CheckBox8.Checked then Reconstructspectra(x[ch],y[ch]);
    if CB_Smooth.Checked then SGSmutiranje(y[ch], 1, nopoints, SpinEdit1.Value);
    CheckSlope(x[ch],y[ch]);
    if bl then SubtractBaseline(x[ch],y[ch]);
    if CB_Derivative.Checked then DeriveSG(y[ch],1,nopoints);
  }
//  ch:=1;
  RChart1.Caption := CheckListBox1.Items[ch];
 if sender<>RChart1 then  NacrtajGraf(RChart1,x[ch], Y[ch], 1, NoPointsA[ch], boja[ch], CheckBox5.Checked, True, false, CheckBox3.Checked, True);
 CB_Fit_GaussClick(self);
  if PageControl1.TabIndex=1 then Button5Click(Self);
RChart1.ShowGraf;
end;

procedure TForm1.Plotdatafromcolumn1Click(Sender: TObject);
var
  i, Col : integer;
  start: boolean;
  Xval:Double;
begin
  CheckBox2.Checked := True;
  Form2.RChart1.ClearGraf;
  Form2.RChart1.DataColor:=clBlack;
  START:=true;
  for i := 1 to StringGrid1.RowCount - 1 do
    //if StringGrid1.Cells[ColSel, i] <> '' then
    if CheckListBox1.Checked[i-1] and (StringGrid1.Cells[ColSel, i] <> '') then
    begin
    Xval:=i;
    if StringGrid2.Cells[0,i]<>'' then Xval:= StrToFloat(StringGrid2.Cells[0,i]);
      if start then
        Form2.RChart1.MoveTo(Xval, StrToFloat(StringGrid1.Cells[ColSel, i]))
      else
        Form2.RChart1.DrawTo(Xval, StrToFloat(StringGrid1.Cells[ColSel, i]));
    start:=false;
      Form2.RChart1.MarkAt(Xval, StrToFloat(StringGrid1.Cells[ColSel, i]), 17);
    end;
  Form2.RChart1.autorange(1, 5);
  Form2.RChart1.ShowGraf;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var
  i: integer;
begin
  PopupMenu1.Items[0].Caption := 'Plot data from column: "' + StringGrid1.Cells
    [ColSel, 0] + '"';
  for i := 2 to PopupMenu1.Items.Count - 1 do
    PopupMenu1.Items[i].Caption := StringGrid1.Cells[i, 0];

end;
end.


