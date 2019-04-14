program ASFit;


uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  ABOUT in 'ABOUT.pas' {AboutBox},
  ConPlot in 'ConPlot.pas' {Form2},
  Unit_Simul in 'Unit_Simul.pas' {Form_Simul},
  Unit_warning in 'Unit_warning.pas' {Form3};

{$R *.res}
{$R fitterDLL.RES} // <-- DON'T FORGET
{$R lmhelperDLL.RES} // <-- DON'T FORGET

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'ASFit - CDOM UV/Vis spectra analysis';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_Simul, Form_Simul);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
