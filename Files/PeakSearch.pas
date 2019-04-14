unit PeakSearch;

interface
uses SysUtils,Dialogs,SDL_RChart,Graphics,StdCtrls ;
Procedure SviPikoviForce(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer;var ipp:array of integer);
procedure Rotate(var YRot:array of double; NoPoc, NoKraj: Integer; FavL, FAvR: integer);
procedure Peakfind(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer;var ipl,ipr,ipp:array of integer; smart:Boolean);
procedure PeakfindMin(X,Y: array of double; INB, INE:Integer; var BrojPikova: Integer;var ipp:array of integer);
procedure Peakfind2(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer;var ipl,ipr,ipp:array of integer);
procedure Peakfind3(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer;var ipl,ipr,ipp:array of integer);
Procedure Showpeaks(graf:TRChart;Listing:TListBox;X,Y: array of double; DDX: DOuble;BrojPikova: Integer;ipl,ipr,ipp:array of integer;PokaziVrijednosti, suprotni, pik,rear, front, Nobaseline:Boolean);
procedure OdrediPeak(graf:TRChart;x,y: array of double; from, too, brojpikova,metoda: Integer; polozaj: array of integer);



implementation

uses osnovne, SDL_Math2;
const MaxPoints=4000;

Procedure SviPikoviForce(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer;var ipp:array of integer);
var
i: Integer;
isign, MINY: Double;
ipi, isi, iei, ipsi, ipei, irval, istart, ib, ie, iend, ilbb, ih, ipll, iprr: integer;
IH4, IH3, IH2, IH1: integer;
IPS1, IPS2, IPS0, IPST, ISL1, ISL2: Integer;
NB,NE, IVI, Iste, sir: Integer;
yd, ydd,yd3: array[0..MaxPoints] of Double;
begin
BrojPikova:=0;
FOR i:= 0 TO 500 do // '--- reset arrays
    begin
    ipp[i]:= 0;
    end;
IF idir = 1 THEN isign:= -1 ELSE isign:= 1; //	  '--- direction of peak search
ipi:= 0;ISI:= 0;IEI:= 0;IPSI:= 0;IPEI:= 0;
IH4:= 4;IH3:= 3;IH2:= 2;IH1:= 1;
IF idir = 1 THEN
   begin
   IH4:= -4;IH3:= -3;IH2:= -2;IH1:= -1;
   end;
NB:= INB + 4;
NE:= INE - 4;

//'--- derivative of y() according to S-G method

FOR i:= NB TO NE do
    begin
    yd[i]:= 4 * (y[i + IH4] - y[i - IH4]) + 3 * (y[i + IH3] - y[i - IH3]) + 2 * (y[i + ih2] - y[i - ih2]) - y[i - IH1] + y[i + IH1];
    end;
FOR i:= INB TO NB do yd[i]:= yd[NB];
FOR i:= NE TO INE do yd[i]:= yd[NE];
//SGSmutiranje(yd, INB,INE, 3,5, false, 4);
//'--- derivative of yd() according to S-G method

FOR i:= NB+4 TO NE-4 do
    begin
    ydd[i]:= 4 * (yd[i + IH4] - yd[i - IH4]) + 3 * (yd[i + IH3] - yd[i - IH3]) + 2 * (yd[i + ih2] - yd[i - ih2]) - yd[i - IH1] + yd[i + IH1];
    if isign= -1 then ydd[i]:=-ydd[i];
    end;
FOR i:= INB TO NB do ydd[i]:= ydd[NB];
FOR i:= NE TO INE do ydd[i]:= ydd[NE];
//SGSmutiranje(ydd, INB,INE, 3,5, false, 4);
FOR i:= NB+4 TO NE-4 do
    begin
    yd3[i]:= 4 * (ydd[i + IH4] - ydd[i - IH4]) + 3 * (ydd[i + IH3] - ydd[i - IH3]) + 2 * (ydd[i + ih2] - ydd[i - ih2]) - ydd[i - IH1] + ydd[i + IH1];
    if isign= 1 then yd3[i]:=-yd3[i];
    end;
FOR i:= INB TO NB do yd3[i]:= yd3[NB];
FOR i:= NE TO INE do yd3[i]:= yd3[NE];


FOR i:= INB TO INE do yd[i]:= yd3[i];
//FOR i:= INB TO INE do y[i]:= -ydd[i];

//'--- find crossing of yd through yd(i)=0


IPS1:= round(ipw / 2);
//ShowMEssage(FloatTOstr(IPS1));
IF IPS1 < 2 THEN IPS1:= 2;
//ips3:= IPS1 + 2*round(IPS1 / 2);
ips2:= IPS1 + round(IPS1 / 2);
ips0:= IPS1 - round(IPS1 / 2);
IF ips2 = IPS1 THEN ips2:= IPS1 + 1;
IF ips0 = IPS1 THEN ips0:= IPS1 - 1;
NB:= INB + ips2;
NE:= INE - ips2;
IF IPS1 > 2 THEN IPST:= 2 ELSE IPST:= 1;
ISL1:= 0;ISL2:= 0;
//ipp[0]:=0;
ipi:= 0;   //'--- number of peaks
IVI:= 0;  //'--- number of valleys

//'--- peak when change of sign of derivative

FOR i:= NB TO NE do
begin
  IF (((yd[i-ips2]<0) and (yd[i-IPS1]<0)) or ((yd[i-ips2]>0) and (yd[i-IPS1]>0))) AND
     (((yd[i-ips0]<0) and (yd[i-ips2]<0)) or ((yd[i-ips0]>0) and (yd[i-ips2]>0)))THEN
       begin
       if yd[i-ips0]<0 then ISL1:=-1 else ISL1:=1;     //'slope in front of i
       end;
  IF (((yd[i+ips2]<0) and (yd[i+IPS1]<0)) or ((yd[i+ips2]>0) and (yd[i+IPS1]>0))) AND
     (((yd[i+ips0]<0) and (yd[i+ips2]<0)) or ((yd[i+ips0]>0) and (yd[i+ips2]>0)))THEN
       begin
       if yd[i+ips0]<0 then ISL2:=-1 else ISL2:=1;     //'slope in front of i
       end;
 IF (ISL1=-ISL2) AND (ISL1=1) THEN
       begin
        IF (i-ipp[ipi])>ips2 THEN
          begin
          ipi:= ipi+1;
          ipp[ipi]:= i; // '--- peak!
          BrojPikova:=BrojPikova+1;//SHowMEssage(FloatTOstr(xx[ipp[ipi]]));
          end;
       end;
ISL1:= 0; ISL2:= 0;
end; /// FOR i:= NB TO NE d
IF ipi=0 THEN EXIT;   //       '--- no peaks
end;

{procedure Peakfind(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer; var ipl,ipr,ipp:array of integer; smart: Boolean;tip: Integer);
var
I,a,c,w, noviipl, moguciPikovi, KonacnoPikova,tempp, tempL, tempr, pozicija, raspon: Integer;
Q, yf: Double;
ipl_1, ipr_1: Integer;
xpf,Ypf, yr: array[0..MaxPoints] of Double;
poz: array[0..500] of Integer;
SviPikoviP,SviPikoviL,SviPikoviR:array[0..500] of Integer;
corr, PikIma: boolean;
nagib1, odsjecak1, nagib2, odsjecak2: Double;
//Pravac:TCurveFit;
begin


for i:= INB to INE do
begin
ypf[i]:=y[i];
yr[i]:=y[i];
xpf[i]:=i;
end;


if (tip=0) or (tip=1) then
begin
DeriveSG(xpf,ypf,INB, INE,ypf);
DeriveSG(xpf,ypf,INB, INE,ypf);
DeriveSG(xpf,ypf,INB, INE,ypf);
DeriveSG(xpf,ypf,INB, INE,ypf);
end;

if (tip=2)then
begin
DeriveSG(xpf,ypf,INB, INE,ypf);
DeriveSG(xpf,ypf,INB, INE,ypf);
end;

Peakfind3(ypf, INB, INE, idir,ipw, pymin,BrojPikova,ipl,ipr,ipp);
if (tip=0) or (tip=1) then ipw:=ipw*4;

if (tip=0) or (tip=1) then

for i:= 1 to BrojPikova do
    begin
    if ipr[i]-ipl[i]<ipw then continue;
    ipl_1:=ipl[i];
    ipr_1:=ipr[i];
  //  ipl[i]:=ipp[i]-(ipr[i]-ipp[i]);
 //   ipr[i]:=ipp[i]+(ipp[i]-ipl[i]);
    raspon:=round((ipr[i]-ipl[i])/5);

    ipl[i]:=ipp[i]-raspon;
    ipr[i]:=ipp[i]+raspon;
    //if yr[ipl_1]>yr[ipr_1] then ipl[i]:=ipl[i]+1;
    //if yr[ipl_1]<yr[ipr_1] then ipr[i]:=ipr[i]-1;
for a:= INB to INE do yr[a]:=y[a];

Rotate(yr, INB, INE, ipl[i], ipr[i]);
     yf:=yr[ipl[i]];
     a:=ipl[i]-1;
   WHILE yr[a]<yf DO
     begin
     yf:=yr[ipl[i]];
     ipl[i]:=a;
     a:=a-1;
     end;
   if ipl[i]<ipl_1-(Ipp[i]-ipl_1) then ipl[i]:=ipl_1-(Ipp[i]-ipl_1);
     yf:=yr[ipr[i]];
     a:=ipr[i]+1;
   WHILE yr[a]<yf DO
     begin
     yf:=yr[ipr[i]];
     ipr[i]:=a;
     a:=a+1;
     end;
if ipr[i]>ipr_1+(ipr_1-Ipp[i])*2 then ipr[i]:=ipr_1+(ipr_1-Ipp[i]);

////drugi put
ipl_1:=ipl[i];
ipr_1:=ipr[i];
raspon:=round((ipr[i]-ipl[i])/4);
for a:= INB to INE do yr[a]:=y[a];
Rotate(yr, INB, INE, ipl[i], ipr[i]);


     yf:=yr[ipl[i]+raspon];
     a:=ipl[i]+raspon-1;
   WHILE yr[a]<yf DO
     begin
     yf:=yr[a];
     ipl[i]:=a;
     a:=a-1;
     end;
  if ipl[i]<ipl_1-(Ipp[i]-ipl_1) then ipl[i]:=ipr[i-1]-raspon;//ipl_1;
     yf:=yr[ipr[i]-raspon];
     a:=ipr[i]-raspon+1;
   WHILE yr[a]<yf DO
     begin
     yf:=yr[a];
     ipr[i]:=a;
     a:=a+1;
     end;
if ipr[i]>ipr_1+(ipr_1-Ipp[i]) then ipr[i]:=ipr_1+raspon;//ipp[i]+(ipp[i]-ipl[i]);//ipr_1;

////drugi put

Rotate(yr, INB, INE, ipl[i], ipr[i]);
for a:= ipl[i]+3 to ipp[i]+round(raspon) do
  if yr[a]>yr[a-1] then
  begin
  ipp[i]:=a;
  end;
 end;//for i:= 1 to BrojPikova do


if (tip=2) then
 for i:= 1 to BrojPikova do
    begin
    ipl[i]:=ipl[i]-5;
    ipr[i]:=ipr[i]+5;
    Rotate(yr, INB, INE, ipl[i], ipr[i]);
    for a:=ipp[i]-5 downto ipl[i]-10 do
     if yr[a]>yr[a+1] then ipl[i]:=a;
    for a:=ipp[i]+5 to ipr[i]+10 do
      if yr[a]>yr[a-1] then ipr[i]:=a;
    Rotate(yr, INB, INE, ipl[i], ipr[i]);
    for a:= ipl[i]+3 to ipr[i]-3 do
    if yr[a]<yr[a-1] then ipp[i]:=a;

    end;


end; }

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



procedure Peakfind(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer; var ipl,ipr,ipp:array of integer; smart: Boolean);
var
I,a,c,w, noviipl, moguciPikovi, KonacnoPikova,tempp, tempL, tempr, pozicija: Integer;
Q: Double;
ypf: array[0..MaxPoints] of Double;
poz: array[0..500] of Integer;
SviPikoviP,SviPikoviL,SviPikoviR:array[0..500] of Integer;
corr, PikIma: boolean;
nagib1, odsjecak1, nagib2, odsjecak2: Double;
//Pravac:TCurveFit;
begin
if idir=1 then for i:= INB to INE do y[i]:=-y[i];
idir:=0;

if smart then
begin
KonacnoPikova:=0;
SviPikoviForce(Y, INB, INE, idir,ipw, pymin,MOgucipikovi,poz);

//for i:= 1 to MOgucipikovi do ShowMessage(intToStr(poz[i]));

for i:= INB to INE do ypf[i]:=y[i];
for i:= 1 to MOgucipikovi do
begin

Rotate(Ypf, INB, INE,poz[i]-5,poz[i]+5);
Peakfind3(Ypf, INB, INE, idir,ipw, pymin,BrojPikova,ipl,ipr,ipp);

for a:= 1 to BrojPikova do
  begin

  PikIma:=False;
    for c:=1 to KonacnoPikova do
    if abs(ipp[a]-SviPikoviP[c])<ipw*5 then
     begin
     pikIma:=True;
     break;
     end else
     begin
     pikIma:=False;
     end;

    if (PikIma=false) and (ipp[a]>5) then
    begin
    KonacnoPikova:=KonacnoPIkova+1;
    SviPikoviP[KonacnoPIkova]:=ipp[a];
    SviPikoviL[KonacnoPIkova]:=ipl[a];
    SviPikoviR[KonacnoPIkova]:=ipr[a];

     end;
    end; //for a:= 1 to BrojPikova do
end;//for i:= 1 to MOgucipikovi do

ipP[0]:=0;
BrojPikova:=KonacnoPikova;
for c:= 1 to KonacnoPikova do
  begin

  pozicija:=SviPikoviP[c];
  for a:=1 to c do
   begin
   if (pozicija<ipp[a]) and (pozicija>ipp[a-1]) then
    begin
    for w:=c downto a do
      begin
      ipp[w]:=ipp[w-1];
      ipL[w]:=ipL[w-1];
      ipR[w]:=ipR[w-1];
      end;
    ipp[a]:=SviPikoviP[c];
    ipL[a]:=SviPikoviL[c];
    ipR[a]:=SviPikoviR[c];
    break;
    end
    else
    begin
    ipp[c]:=SviPikoviP[c];
    ipL[c]:=SviPikoviL[c];
    ipR[c]:=SviPikoviR[c];
    end;//if (pozicija<ipp[a]) and (pozicija>ipp[a-1]) then
  end;//for a:=1 to c do

  end;//for c:= 1 to KonacnoPikova do
end//if smart then
else
begin
Peakfind3(y, INB, INE, idir,ipw, pymin,BrojPikova,ipl,ipr,ipp);
//ShowMEssage('no smart');
end;
end;

procedure Rotate(var YRot:array of double; NoPoc, NoKraj: Integer; FavL, FAvR: integer);
var
piki,i: Integer;
q, nagF, OdsjF: Double;
pravac: TCUrvefit;
begin
pravac:=TCUrveFIt.Create(nil);
if FavL<NoPoc then FavL:=NoPoc;
if FavR>NoKraj then FavR:=NoKraj;

pravac.Init;
Pravac.EnterStatValue(FAvL, YRot[FAvL]);
Pravac.EnterStatValue(FavR, YRot[FavR]);
Pravac.CalcLinFit(nagF, odsjF, q);
for i:= NoPoc to NoKraj do
  begin
  YRot[i]:=YRot[i]-(i*nagF+odsjF);
  end;
end;

procedure Peakfind2(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer; var ipl,ipr,ipp:array of integer);
var
j,i, ii: integer;
isign, MINY: Double;
ipi, isi, iei, ipsi, ipei, irval, istart, ib, ie, iend, ilbb, ih, ipll, iprr: integer;
IH4, IH3, IH2, IH1: integer;
IPS1, IPS2, IPS0, IPST, ISL1, ISL2: Integer;
NB,NE, IVI, Iste, sir: Integer;
yd, ydd: array[0..MaxPoints] of Double;
ivpos: array[0..500] of integer;
idyl, idyr: array[0..500] of integer;
yoffset, pky, YOFF: Double;
MAXY,diplus,dimin,ippH, Yl, Yr, ddymin, bslope, ddy: Double;
y1, y2,y3, suma: double;

begin
{
'       Arguments      : y()      - in  - y-array of data points
'                        inb      - in  - start index
'                        ine      - in  - end index
'                        idir     - in  - 0: searching for positive peaks
'                                         1: searching for negative peaks
'                        ipw      - in  - minimum peak width in number of points
'                        pymin    - in  - minimum peak height
'                        ipr()    - out - index of right peak position
'                        ipl()    - out - index of left peak-position
'                        ipp()    - out - index of position of peaks
'                        idyl()   - out - index of max positive derivative value (peak down)
'                        idyr()   - out - index of negative derivative value (peak down)
'                        inpk     - out - number of peaks found
'                        ist      - out - 0: no error
'                                         1: fatal error
'                        ier      - out - BASIC-error return code
'                        er$      - out - string with error code
'

}
sir:=round(ipw/2);
//ipw:=10;
FOR i:= 0 TO 500 do // '--- reset arrays
    begin
    ipp[i]:= 0;
    ipl[i]:= 0;
    ipr[i]:= 0;
    end;

IF idir = 1 THEN isign:= -1 ELSE isign:= 1; //	  '--- direction of peak search

ipi:= 0;
ISI:= 0;
IEI:= 0;
IPSI:= 0;
IPEI:= 0;
IH4:= 4;
IH3:= 3;
IH2:= 2;
IH1:= 1;
IF idir = 1 THEN
   begin
   IH4:= -4;
   IH3:= -3;
   IH2:= -2;
   IH1:= -1;
   end;
NB:= INB + 4;
NE:= INE - 4;

//'--- derivative of y() according to S-G method

FOR i:= NB TO NE do
    begin
    yd[i]:= 4 * (y[i + IH4] - y[i - IH4]) + 3 * (y[i + IH3] - y[i - IH3]) + 2 * (y[i + ih2] - y[i - ih2]) - y[i - IH1] + y[i + IH1];
    end;
FOR i:= INB TO NB do yd[i]:= yd[NB];
FOR i:= NE TO INE do yd[i]:= yd[NE];

//'--- derivative of yd() according to S-G method

FOR i:= NB+4 TO NE-4 do
    begin
    ydd[i]:= 4 * (yd[i + IH4] - yd[i - IH4]) + 3 * (yd[i + IH3] - yd[i - IH3]) + 2 * (yd[i + ih2] - yd[i - ih2]) - yd[i - IH1] + yd[i + IH1];
    if isign= -1 then ydd[i]:=-ydd[i];
    end;
FOR i:= INB TO NB do ydd[i]:= ydd[NB];
FOR i:= NE TO INE do ydd[i]:= ydd[NE];




//'--- find crossing of yd through yd(i)=0

ipi:= 0;
IVI:= 0;
IPS1:= StrToInt(FloatToStr(int(ipw / 2)));
 IF IPS1 < 2 THEN IPS1:= 2;
ips2:= IPS1 + StrToInt(FloatToStr(INT(IPS1 / 2)));
ips0:= IPS1 - StrToInt(FloatToStr(INT(IPS1 / 2)));
IF ips2 = IPS1 THEN ips2:= IPS1 + 1;
IF ips0 = IPS1 THEN ips0:= IPS1 - 1;
NB:= INB + ips2;
NE:= INE - ips2;
IF IPS1 > 2 THEN IPST:= 2 ELSE IPST:= 1;
ISL1:= 0;
ISL2:= 0;
ipi:= 0;   //'--- number of peaks
IVI:= 0;  //'--- number of valleys

//'--- peak when change of sign of derivative

FOR i:= NB TO NE do
begin
  IF (((yd[i-ips2]<0) and (yd[i-IPS1]<0)) or ((yd[i-ips2]>0) and (yd[i-IPS1]>0))) AND
     (((yd[i-ips0]<0) and (yd[i-ips2]<0)) or ((yd[i-ips0]>0) and (yd[i-ips2]>0)))THEN
       begin
       if yd[i-ips0]<0 then ISL1:=-1 else ISL1:=1;     //'slope in front of i
       end;

  IF (((yd[i+ips2]<0) and (yd[i+IPS1]<0)) or ((yd[i+ips2]>0) and (yd[i+IPS1]>0))) AND
     (((yd[i+ips0]<0) and (yd[i+ips2]<0)) or ((yd[i+ips0]>0) and (yd[i+ips2]>0)))THEN
       begin
       if yd[i+ips0]<0 then ISL2:=-1 else ISL2:=1;     //'slope in front of i
       end;

 IF (ISL1=-ISL2) AND (ISL1=1) THEN
       begin
        IF (i-ipp[ipi])>ips2 THEN
          begin
          ipi:= ipi+1;
          ipp[ipi]:= i; // '--- peak!
          end;
       end;

ISL1:= 0; ISL2:= 0;
end; /// FOR i:= NB TO NE d


IF ipi=0 THEN EXIT;   //       '--- no peaks

		      //		  '--- search for valleys
ipp[0]:=INB;
ipp[ipi + 1]:=INE;
IVI:=ipi + 1;          //           '--- number of valleys to be searched for
FOR i:= 1 TO IVI do
    begin
    MINY:= 1E+38;
    FOR ii:= ipp[i - 1] TO ipp[i] {STEP IPST} do
         begin
         if ii mod IPST = 0 then
	 IF y[ii]*isign < MINY THEN
            begin
                 MINY:= isign*y[ii];
                 ivpos[i]:= ii;
            end;
         end; {ii}
    end; {i}


    FOR i:= 1 TO ipi do
    begin
    if ivpos[i]<>ivpos[i+1] then
    begin
    ipl[i]:= ivpos[i];
    ipr[i]:= ivpos[i + 1];
    end else
    begin
    ipl[i]:= ivpos[i];
    ipr[i]:= ivpos[i + 2];
    end;
  //ShowMessage('IPL='+IntTOStr(ivpos[i])+' IPR='+IntTOStr(ivpos[i+1]));
    end;

    //				  '--- delete too little peaks
i:= 1;
WHILE i<=ipi do
      begin
      //ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
      if ipl[i]<>ipr[i] then
      begin
      yoffset:= y[ipr[i]] + (ipp[i] - ipr[i]) * (y[ipl[i]] - y[ipr[i]])/(ipl[i] - ipr[i]);
      pky:= isign * (y[ipp[i]] - yoffset);
      IF pky <= pymin THEN //'delete too little peaks
         begin
	 FOR j:= i TO ipi - 1 do
             begin
             ipr[j]:= ipr[j + 1];
             ipl[j]:= ipl[j + 1];
             ipp[j]:= ipp[j + 1];
             end;
	 i:= i-1;
         ipi:= ipi-1;
         END; //IF pky
      end;//if <>
    i:= i+1;
END; //while


/////////////////////////////////////////////////////
FOR i:= 1 TO ipi  do   //             '--- tangent fit if baseline not horizontal
    begin
     IF ABS(y[ipl[i]]-y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/150 THEN
      // tangent
      begin
            IF isign * y[ipl[i]] > isign * y[ipr[i]] THEN
              begin
                 irval:= ipl[i];
                 istart:= ipr[i];
                 iste:= 1;
               end
             ELSE
                 begin
                   irval:= ipr[i];
                   istart:= ipl[i];
                   iste:= -1;
                  end;


//'--- from peak to other side at same height
ib:= ipp[i];
ie:= istart;
//ShowMessage('Ib='+IntTOStr(ib)+' Ie='+IntTOStr(ie);
if iste=1 then
begin
FOR ii:= ib TO ie do
begin
    IF isign*y[irval]>isign*y[ii] THEN
    begin
    iend:= ii;
    break;
    end;
end;
end; //iste=1

if iste=-1 then
begin
FOR ii:= ib downTO ie do
begin
    IF isign*y[irval]>isign*y[ii] THEN
    begin
    iend:= ii;
    break;
    end;
end;
end; //iste =-1

{
IF ABS(iend - ipp[i]) > 6 THEN   // '-- little bit back, changed 30-12-92, HCJ
   begin
   ilbb:= ips0;                  //  '-- initial step back = 1/4 min. peakwidth
   IF ilbb > 4 THEN ilbb:= 4;    //  '-- maximum step back = 4
   iend:= iend+ilbb * (-iste);
   end;
 }
//'--- from that point to lowest value by means of tangent fit
{ddymin:= 1E+38;}  //'minimum in difference of slope and derivative
ddymin:= 0;



if iste=1 then
begin

FOR ii:= iend TO istart do
     begin

     bslope:= (y[irval] - y[ii]) / (irval - ii) * isign;
     //ddy:= ABS(bslope - yd[ii] / 60);
     {bslope:= y[ipp[i]]-(y[irval] - y[ii]);}
     ddy:= ABS(bslope);
     IF  ddymin < ddy THEN
                     begin
		     ddymin:= ddy;
                     ih:= ii;
                     ih2:= 0;
                     end
		   ELSE
                     begin
		     ih2:= ih2 + 1;
                     //IF ih2 > ipw THEN break;
		     IF ih2 > 2 THEN break;
                     end;
 END;
//ShowMessage('Iend='+IntTOStr(ih));
end;{if iste 1}


if iste=-1 then
begin
FOR ii:= iend downTO istart do
     begin
     bslope:= (y[irval] - y[ii]) / (irval - ii) * isign;
{     ddy:= ABS(bslope - yd[ii] / 60);}
     ddy:= ABS(bslope);
     IF ddymin<ddy THEN
                     begin
		     ddymin:= ddy;
                     ih:= ii;
                     ih2:= 0;

                     end
		   ELSE
                     begin
		     ih2:= ih2 + 1;
                     IF ih2 > 2 THEN break;
                     end;
 END;
//ShowMessage('IH='+IntTOStr(ih));
end;{if iste-1}

IF iste = -1 THEN
   begin
   ipr[i]:= irval;
   ipl[i]:= ih;
   //if (ipp[i]-ipL[i])>(ipr[i]-ipp[i])+round(IPW) then
   //if ipp[i]-(ipr[i]-ipp[i])-round(IPW) > INB then ipl[i]:=ipp[i]-(ipr[i]-ipp[i])-round(IPW);
   //end;
     end
ELSE
    begin
   ipl[i]:= irval;
   ipr[i]:= ih;
  // if (ipR[i]-ipP[i])>(ipP[i]-ipl[i])+round(IPW) then
  // if ipp[i]+(ipp[i]-ipl[i])+round(IPW) < INE then ipr[i]:=ipp[i]+(ipp[i]-ipl[i])+round(IPW);
   end;

   ///////////////////////////////////////////
//{
if iste=1 then
begin
ddymin:=abs((y[ipr[i]] - y[ipl[i]]) / (ipr[i] - ipl[i]) * isign);
if ipl[i]-14<INB then ipll:=INB else ipll:=ipl[i]-14;
FOR ii:= ipl[i]+1 downTO ipll do//promijenjeno 04.04.2003 onemugucava silazak natrag do kraja
//FOR ii:= ipl[i]+1 downTO ipl[i]-4 do
     begin
     bslope:= (y[ipr[i]] - y[ii]) / (ipr[i] - ii) * isign;
     ddy:= abs(bslope);
     IF  ddymin > ddy THEN
                     begin
		     ddymin:= ddy;
                     ipl[i]:=ii;
                     //ShowMessage('IPL +1 '+FloatToStr(xx[ipl[i]]));
                     end
		   ELSE
                     begin
		     //ih2:= ih2 + 1;
                    // IF ih2 > ipw THEN break;
                    //ShowMessage('IPL else +1 '+FloatToStr(xx[ipl[i]]));
		    // IF ih2 > 2 THEN break;
                     end;
 END;
end;//if iste 1
//ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
if iste=-1 then
begin
//ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
if ipl[i] = ipr[i] then ipr[i]:=ipr[i]+1; 
ddymin:=abs((y[ipl[i]] - y[ipr[i]]) / (ipl[i] - ipr[i]) * isign);
if ipr[i]+14>INE then iprr:=INE else iprr:=ipr[i]+14;
FOR ii:= ipr[i]-1 TO iprr do //promijenjeno 04.04.2003 onemugucava silazak natrag do kraja
//FOR ii:= ipr[i]-1 TO ipr[i]+4 do
     begin
     if (ipl[i] - ii)=0 then ipl[i]:=ipl[i]-1;
     bslope:= (y[ipl[i]] - y[ii]) / (ipl[i] - ii) * isign;
     ddy:= abs(bslope);

     IF  ddymin > ddy THEN
                     begin
		     ddymin:= ddy;
                     ipr[i]:=ii;
                     // ShowMessage('IPL else -1 '+FloatToStr(xx[ipr[i]]));
                     //ih:= ii;
                     //ih2:= 0;
                     end
		   ELSE
                     begin
		     //ih2:= ih2 + 1;
                     //IF ih2 > ipw THEN break;
		     //IF ih2 > 2 THEN break;
                     end;
 END;
end;//if iste -1
///////////////////////////////////////////}



end;//    IF ABS(y[ipl[i]]-y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/100 THEN

//ShowMessage('IPL '+IntToStr(ipl[i])+' '+'IPR '+IntToStr(ipr[i]) +'I'+IntToStr(i));
end;
{
// ubaceno 10.12.2006.
FOR i:= 1 TO ipi do
    begin
    suma:=0;
    for II:= ipl[i] to ipr[i] do
    if ydd[ii]> 0 then suma:=suma+ydd[ii];
    suma:=suma/(ipr[i]-ipl[i]);

    for ii:= ipl[i] to ipp[i] do//ipl[i]-round((ipp[i]-ipl[i])/3) do
      begin
      y1:=(ydd[ii-1]+ydd[ii-2]+ydd[ii-3]+ydd[ii-4])/4;
      y2:=(ydd[ii-5]+ydd[ii-6]+ydd[ii-7]+ydd[ii-8])/4;
      y3:=(ydd[ii-9]+ydd[ii-10]+ydd[ii-11]+ydd[ii-12])/4;
      if (ydd[ii]>y1) and (ydd[ii]>y2*2) and (ydd[ii]>y3*6)and (ydd[ii]>ydd[ipl[i]+2]*3) then
        begin
        if (ipp[i]-ipl[i])>(ipp[i]-ii) then ipl[i]:=ii-12;
        if ipl[i]<nb then ipl[i]:=nb;
        break;
        end;//if
      end;// for ii
                      //ipr[i]-round((ipr[i]-ipp[i])/3)
      for ii:= ipp[i]  to ipr[i] do
      begin
      y1:=(ydd[ii+1]+ydd[ii+2]+ydd[ii+3]+ydd[ii+4])/4;
      y2:=(ydd[ii+5]+ydd[ii+6]+ydd[ii+7]+ydd[ii+8])/4;
      y3:=(ydd[ii+9]+ydd[ii+10]+ydd[ii+11]+ydd[ii+12])/4;
      if (ydd[ii]>y1) and (ydd[ii]>y2*3) and (ydd[ii]>y3*6) and (ydd[ii]>ydd[ipr[i]+2]*3) then
        begin
        if (ipr[i]-ipp[i])>(ii-ipp[i]) then ipr[i]:=ii+12;
        if ipr[i]>NE then ipR[i]:=ne;
        //Showmessage('afafsa');
        break;
        end;//if
      end;// for ii


    end;


// ubaceno 10.12.2006.

  }








//ShowMessage(IntTOStr(ipi));
  //			  '--- search for real peak positions and maxima in derivative
FOR i:= 1 TO ipi do
    begin
    MAXY:= -1E+10;
    diplus:= -1E+10;
    dimin:= 1E+10;
    {ippH:= 0;}
////////////////////////////////////////////////////////////////////////////
   IF ABS(y[ipl[i]] - y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/150 then
     begin
      //ShowMessage('asda');
      yl:= y[ipl[i]];
      yr:= y[ipr[i]];
      FOR ii:= ipl[i] TO ipr[i] do
          begin
	  IF yd[ii] > diplus THEN
             begin
             diplus:= yd[ii];
             idyl[i]:= ii;
             end;
	  IF yd[ii] < dimin THEN
             begin
             dimin:= yd[ii];
             idyr[i]:= ii;
             end;
	  yoffset:= yl + (ii - ipl[i]) * (yr - yl) / (ipr[i] - ipl[i]);
	  YOFF:= y[ii] - yoffset;
	  IF YOFF * isign >= MAXY THEN
             begin
             MAXY:= isign * YOFF;
             ipp[i]:= ii;
             end;
      end; {for ii}
    end {if}
   ELSE
       begin
       if (idyl[i]-idyr[i])<0 then iste:=-1 else iste:=1;
       FOR ii:= ipl[i] TO ipr[i] do//  '--- idyl(i) to idyr(i) step iste
           begin
	   IF y[ii]*isign >= MAXY THEN
              begin
              MAXY:=isign*y[ii];
              ipp[i]:= ii;
              end;
	   IF yd[ii]>diplus THEN
              begin
              diplus:=yd[ii];
              idyl[i]:=ii;
              end;
	   IF yd[ii]<dimin THEN
              begin
              dimin:= yd[ii];
              idyr[i]:= ii;
              end;
           end; { ii}

       end; {if}

  end; {for i}

		//'--- delete too narrow peaks
i:= 1;
WHILE i <= ipi do
      begin
      {IF ((ipr[i]-ipp[i])<=ips2) OR ((ipp[i]-ipl[i])<=ips2) THEN}
      IF ((idyr[i]-idyl[i])<=ips2+2) {OR ((idyl[i]-idyr[i])<=3) } THEN
      begin
      FOR j:= i TO ipi-1 do
          begin
          idyr[J]:=idyr[j+1];
          idyl[J]:=idyl[j+1];
          ipr[j]:= ipr[j + 1];
          ipl[j]:= ipl[j + 1];
          ipp[j]:= ipp[j + 1];
          end;
         i:=i-1;
         ipi:=ipi-1;
      end; {if}
    i:= i + 1;
end;
 //dodano
 {for j:= 1 to ipi do
        begin
        if (ipr[j]-ipp[j])>(ipp[j]-ipl[j])+10 then
                begin
                ipr[j]:=ipp[j]+(ipp[j]-ipl[j])+sir;
                end;
        if (ipr[j]-ipp[j])<(ipp[j]-ipl[j])-10 then
                begin
                ipl[j]:=ipp[j]-(ipr[j]-ipp[j])-sir;
                end;
        end; }

  //dodano

BrojPikova:= ipi;
//ShowMessage(IntToStr(BrojPikova));
end; {procedure}


procedure Peakfind3(Y: array of double; INB, INE, idir: integer;
          ipw, pymin: Double; var BrojPikova: Integer; var ipl,ipr,ipp:array of integer);
var
j,i, ii: integer;
isign, MINY: Double;
ipi, isi, iei, ipsi, ipei, irval, istart, ib, ie, iend, ilbb, ih, ipll, iprr: integer;
IH4, IH3, IH2, IH1: integer;
IPS1, IPS2, IPS0, IPST, ISL1, ISL2, IPS3: Integer;
NB,NE, IVI, Iste, sir: Integer;
yd, ydd, yd3: array[0..MaxPoints] of Double;
ivpos: array[0..500] of integer;
idyl, idyr: array[0..500] of integer;
yoffset, pky, YOFF: Double;
MAXY,diplus,dimin,ippH, Yl, Yr, ddymin, bslope, ddy: Double;
y1, y2,y3, suma2, avgDer: double;

begin
{
'       Arguments      : y()      - in  - y-array of data points
'                        inb      - in  - start index
'                        ine      - in  - end index
'                        idir     - in  - 0: searching for positive peaks
'                                         1: searching for negative peaks
'                        ipw      - in  - minimum peak width in number of points
'                        pymin    - in  - minimum peak height
'                        ipr()    - out - index of right peak position
'                        ipl()    - out - index of left peak-position
'                        ipp()    - out - index of position of peaks
'                        idyl()   - out - index of max positive derivative value (peak down)
'                        idyr()   - out - index of negative derivative value (peak down)
'                        inpk     - out - number of peaks found
'                        ist      - out - 0: no error
'                                         1: fatal error
'                        ier      - out - BASIC-error return code
'                        er$      - out - string with error code
'

}
//SGSmutiranje(y, INB,INE, 3,15, false, 4);
//SGSmutiranje(y, INB,INE, 3,5, false, 4);
sir:=round(ipw/2);
//ipw:=10;
FOR i:= 0 TO 500 do // '--- reset arrays
    begin
    ipp[i]:= 0;
    ipl[i]:= 0;
    ipr[i]:= 0;
    end;

IF idir = 1 THEN isign:= -1 ELSE isign:= 1; //	  '--- direction of peak search

ipi:= 0;
ISI:= 0;
IEI:= 0;
IPSI:= 0;
IPEI:= 0;
IH4:= 4;
IH3:= 3;
IH2:= 2;
IH1:= 1;
IF idir = 1 THEN
   begin
   IH4:= -4;
   IH3:= -3;
   IH2:= -2;
   IH1:= -1;
   end;
NB:= INB + 4;
NE:= INE - 4;

//'--- derivative of y() according to S-G method

FOR i:= NB TO NE do
    begin
    yd[i]:= 4 * (y[i + IH4] - y[i - IH4]) + 3 * (y[i + IH3] - y[i - IH3]) + 2 * (y[i + ih2] - y[i - ih2]) - y[i - IH1] + y[i + IH1];
    end;
FOR i:= INB TO NB do yd[i]:= yd[NB];
FOR i:= NE TO INE do yd[i]:= yd[NE];
suma2:=0;
FOR i:= NB TO NE do suma2:=suma2+yd[i];
AVGDer:=suma2/(ne-nb);
//FOR i:= NB TO NE do yd[i]:=yd[i]/AVGDer;
//SGSmutiranje(yd, INB,INE, 3,5, false, 4);
//'--- derivative of yd() according to S-G method

FOR i:= NB+4 TO NE-4 do
    begin
    ydd[i]:= 4 * (yd[i + IH4] - yd[i - IH4]) + 3 * (yd[i + IH3] - yd[i - IH3]) + 2 * (yd[i + ih2] - yd[i - ih2]) - yd[i - IH1] + yd[i + IH1];
    if isign= -1 then ydd[i]:=-ydd[i];
    end;
FOR i:= INB TO NB do ydd[i]:= ydd[NB];
FOR i:= NE TO INE do ydd[i]:= ydd[NE];
//SGSmutiranje(ydd, INB,INE, 3,5, false, 4);

FOR i:= NB+4 TO NE-4 do
    begin
    yd3[i]:= 4 * (ydd[i + IH4] - ydd[i - IH4]) + 3 * (ydd[i + IH3] - ydd[i - IH3]) + 2 * (ydd[i + ih2] - ydd[i - ih2]) - ydd[i - IH1] + ydd[i + IH1];
    if isign= 1 then yd3[i]:=-yd3[i];
    end;
FOR i:= INB TO NB do yd3[i]:= yd3[NB];
FOR i:= NE TO INE do yd3[i]:= yd3[NE];


//FOR i:= INB TO INE do yd[i]:= yd3[i];
//FOR i:= INB TO INE do y[i]:= -ydd[i];

//'--- find crossing of yd through yd(i)=0


IPS1:= round(ipw / 2);
//ips1:= 2;
//ShowMEssage(FloatTOstr(IPS1));
IF IPS1 < 2 THEN IPS1:= 2;
//ips3:= IPS1 + 2*round(IPS1 / 2);
ips2:= IPS1 + round(IPS1 / 2);
ips0:= IPS1 - round(IPS1 / 2);
IF ips2 = IPS1 THEN ips2:= IPS1 + 1;
IF ips0 = IPS1 THEN ips0:= IPS1 - 1;
NB:= INB + ips2;
NE:= INE - ips2;
IF IPS1 > 2 THEN IPST:= 2 ELSE IPST:= 1;
ISL1:= 0;
ISL2:= 0;
//ipp[0]:=0;
ipi:= 0;   //'--- number of peaks
IVI:= 0;  //'--- number of valleys
if IPS0=1 then IPS2:=1;
if IPS0=1 then IPS1:=1;
//ShowMEssage(InTTOstr(Ips0)+' '+InTTOstr(Ips1)+' '+InTTOstr(Ips2));
//'--- peak when change of sign of derivative
//NacrtajKrivulju(MainFOrm1.RChart1,XX,Yd3,nb,ne,Znak,oblik,WorkColor, True,True, True);
 FOR i:= NB TO NE do
begin
  IF (((yd[i-ips2]<0) and (yd[i-IPS1]<0)) or ((yd[i-ips2]>0) and (yd[i-IPS1]>0))) AND
     (((yd[i-ips0]<0) and (yd[i-ips2]<0)) or ((yd[i-ips0]>0) and (yd[i-ips2]>0)))THEN
       begin
       if yd[i-ips0]<0 then ISL1:=-1 else ISL1:=1;     //'slope in front of i
       end;

  IF (((yd[i+ips2]<0) and (yd[i+IPS1]<0)) or ((yd[i+ips2]>0) and (yd[i+IPS1]>0))) AND
     (((yd[i+ips0]<0) and (yd[i+ips2]<0)) or ((yd[i+ips0]>0) and (yd[i+ips2]>0)))THEN
       begin
       if yd[i+ips0]<0 then ISL2:=-1 else ISL2:=1;     //'slope in front of i
       end;

 IF (ISL1=-ISL2) AND (ISL1=1) THEN
       begin
        IF (i-ipp[ipi])>ips2 THEN
          begin
          ipi:= ipi+1;
          ipp[ipi]:= i; // '--- peak!
          //SHowMEssage(FloatTOstr(xx[ipp[ipi]]));
          end;
       end;

ISL1:= 0; ISL2:= 0;
end; /// FOR i:= NB TO NE d
//for i:= 1 to ipi do ShowMessage(FloatTOstr(xx[ipp[i]]));

IF ipi=0 THEN EXIT;   //       '--- no peaks

		      //		  '--- search for valleys
ipp[0]:=INB;
ipp[ipi + 1]:=INE;
IVI:=ipi + 1;          //           '--- number of valleys to be searched for
FOR i:= 1 TO IVI do
    begin
    MINY:= 1E+38;
    FOR ii:= ipp[i - 1] TO ipp[i]  do
         begin
         if ii mod IPST = 0 then
      	 IF y[ii]*isign < MINY THEN
            begin
            MINY:= isign*y[ii];
            ivpos[i]:= ii;
          end;
    end;
end;


FOR i:= 1 TO ipi do
    begin
    if ivpos[i]<>ivpos[i+1] then
    begin
    ipl[i]:= ivpos[i];
    ipr[i]:= ivpos[i + 1];
    end else
    begin
    ipl[i]:= ivpos[i];
    ipr[i]:= ivpos[i + 2];
    end;
  //ShowMessage('IPL='+IntTOStr(ivpos[i])+' IPR='+IntTOStr(ivpos[i+1]));
end;

    //				  '--- delete too little peaks
i:= 1;
WHILE i<=ipi do
      begin
      //ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
      if ipl[i]<>ipr[i] then
      begin
      yoffset:= y[ipr[i]] + (ipp[i] - ipr[i]) * (y[ipl[i]] - y[ipr[i]])/(ipl[i] - ipr[i]);
      pky:= isign * (y[ipp[i]] - yoffset);
      IF pky <= pymin THEN //'delete too little peaks
         begin
         //ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i])+' '+FloatTostr(ipp[i])+' '+FloatTostr(yoffset));
	 FOR j:= i TO ipi - 1 do
             begin
             ipr[j]:= ipr[j + 1];
             ipl[j]:= ipl[j + 1];
             ipp[j]:= ipp[j + 1];
             end;
	 i:= i-1;
         ipi:= ipi-1;
         END; //IF pky
      end;//if <>
    i:= i+1;
END; //while


/////////////////////////////////////////////////////
FOR i:= 1 TO ipi  do   //             '--- tangent fit if baseline not horizontal
    begin
    //ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
     IF ABS(y[ipl[i]]-y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/150 THEN
      // tangent
      begin
            IF isign * y[ipl[i]] > isign * y[ipr[i]] THEN
              begin
                 irval:= ipl[i];
                 istart:= ipr[i];
                 iste:= 1;
               end
             ELSE
                 begin
                   irval:= ipr[i];
                   istart:= ipl[i];
                   iste:= -1;
                  end;


//'--- from peak to other side at same height
ib:= ipp[i];
ie:= istart;
//ShowMessage('Ib='+IntTOStr(ib)+' Ie='+IntTOStr(ie);
if iste=1 then
begin
FOR ii:= ib TO ie do
begin
    IF isign*y[irval]>isign*y[ii] THEN
    begin
    iend:= ii;
    break;
    end;
end;
end; //iste=1

if iste=-1 then
begin
FOR ii:= ib downTO ie do
begin
    IF isign*y[irval]>isign*y[ii] THEN
    begin
    iend:= ii;
    break;
    end;
end;
end; //iste =-1

{
IF ABS(iend - ipp[i]) > 6 THEN   // '-- little bit back, changed 30-12-92, HCJ
   begin
   ilbb:= ips0;                  //  '-- initial step back = 1/4 min. peakwidth
   IF ilbb > 4 THEN ilbb:= 4;    //  '-- maximum step back = 4
   iend:= iend+ilbb * (-iste);
   end;
 }
//'--- from that point to lowest value by means of tangent fit
{ddymin:= 1E+38;}  //'minimum in difference of slope and derivative
ddymin:= 0;

//

if iste=1 then
begin
FOR ii:= iend TO istart do
     begin
     bslope:= (y[irval] - y[ii]) / (irval - ii) * isign;
     ddy:= ABS(bslope);
     IF  ddymin < ddy THEN
                     begin
                     ddymin:= ddy;
                     ih:= ii;
                     ih2:= 0;
                     end
		   ELSE
                     begin
		     ih2:= ih2 + 1;
                     //IF ih2 > ipw THEN break;
		     IF ih2 > 2 THEN break;
                     end;
 END;
end;{if iste 1}



if iste=-1 then
begin
FOR ii:= iend downTO istart do
     begin
     bslope:= (y[irval] - y[ii]) / (irval - ii) * isign;
{     ddy:= ABS(bslope - yd[ii] / 60);}
     ddy:= ABS(bslope);
     IF ddymin<ddy THEN
                     begin
		     ddymin:= ddy;
                     ih:= ii;
                     ih2:= 0;

                     end
		   ELSE
                     begin
		     ih2:= ih2 + 1;
                     IF ih2 > 2 THEN break;
                     end;
 END;
//
end;{if iste-1}

IF iste = -1 THEN
   begin
   ipr[i]:= irval;
   ipl[i]:= ih;
   //if (ipp[i]-ipL[i])>(ipr[i]-ipp[i])+round(IPW) then
   //if ipp[i]-(ipr[i]-ipp[i])-round(IPW) > INB then ipl[i]:=ipp[i]-(ipr[i]-ipp[i])-round(IPW);
   //end;
   //ShowMessage(FloatTOStr(xx[ih])+' '+FloatTOStr(xx[irval]));
     end
ELSE
    begin
   ipl[i]:= irval;
   ipr[i]:= ih;
   //ShowMessage(FloatTOStr(xx[ih])+' '+FloatTOStr(xx[irval]));
  // if (ipR[i]-ipP[i])>(ipP[i]-ipl[i])+round(IPW) then
  // if ipp[i]+(ipp[i]-ipl[i])+round(IPW) < INE then ipr[i]:=ipp[i]+(ipp[i]-ipl[i])+round(IPW);
   end;

   ///////////////////////////////////////////
//do ovdje se popravlja lijeva koja je niza

if iste=1 then
begin
ddymin:=abs((y[ipr[i]] - y[ipl[i]]) / (ipr[i] - ipl[i]) * isign);
if ipl[i]-10<INB then ipll:=INB else ipll:=ipl[i]-10;
FOR ii:= ipl[i]+1 downTO ipll do//promijenjeno 04.04.2003 onemugucava silazak natrag do kraja
//FOR ii:= ipl[i]+1 downTO ipl[i]-4 do
     begin
     bslope:= (y[ipr[i]] - y[ii]) / (ipr[i] - ii) * isign;
     ddy:= abs(bslope);
     IF  ddymin > ddy THEN
                     begin
		     ddymin:= ddy;
                     ipl[i]:=ii;
                     //ShowMessage('IPL +1 '+FloatToStr(xx[ipl[i]]));
                     end
		   ELSE
                     begin
		     //ih2:= ih2 + 1;
                    // IF ih2 > ipw THEN break;
                    //ShowMessage('IPL else +1 '+FloatToStr(xx[ipl[i]]));
		    // IF ih2 > 2 THEN break;
                     end;
 END;
 //ShowMessage('IPL '+FloatTOStr(xx[IPL[2]])+' '+'IPR '+FloatTOStr(xx[IPR[2]]) +' I'+IntToStr(2));
end;//if iste 1
//ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));


if iste=-1 then
begin
//ShowMessage('IPL='+IntTOStr(ipl[i])+' IPR='+IntTOStr(ipr[i]));
if ipl[i] = ipr[i] then ipr[i]:=ipr[i]+1;
ddymin:=abs((y[ipl[i]] - y[ipr[i]]) / (ipl[i] - ipr[i]) * isign);
if ipr[i]+10>INE then iprr:=INE else iprr:=ipr[i]+10;
FOR ii:= ipr[i]-1 TO iprr do //promijenjeno 04.04.2003 onemugucava silazak natrag do kraja
//FOR ii:= ipr[i]-1 TO ipr[i]+4 do
     begin
     if (ipl[i] - ii)=0 then ipl[i]:=ipl[i]-1;
     bslope:= (y[ipl[i]] - y[ii]) / (ipl[i] - ii) * isign;
     ddy:= abs(bslope);

     IF  ddymin > ddy THEN
                     begin
		     ddymin:= ddy;
                     ipr[i]:=ii;
                     // ShowMessage('IPL else -1 '+FloatToStr(xx[ipr[i]]));
                     //ih:= ii;
                     //ih2:= 0;
                     end
		   ELSE
                     begin
		     //ih2:= ih2 + 1;
                     //IF ih2 > ipw THEN break;
		     //IF ih2 > 2 THEN break;
                     end;
 END;
 //
end;//if iste -1
///////////////////////////////////////////}
//ShowMessage('IPL '+FloatTOStr(xx[IPL[1]])+' '+'IPR '+FloatTOStr(xx[IPR[1]]) +' I'+IntToStr(1));
 ////////////ubaceno 22.08.2011.
if iste=-1 then
begin
ddymin:=abs((y[ipr[i]] - y[ipl[i]+2]) / (ipr[i] - ipl[i]-2) * isign);
if ipl[i]-10<INB then ipll:=INB else ipll:=ipl[i]-10;
//ShowMessage('DDY '+FloatTOStr(DDY)+' '+'DDYMIN '+FloatTOStr(ddymin) +' X'+fLOATToStr(ipl[i]));
FOR ii:= ipl[i]+2 downTO ipll do//promijenjeno 04.04.2003 onemugucava silazak natrag do kraja
//FOR ii:= ipl[i]+1 downTO ipl[i]-4 do
     begin
     bslope:= (y[ipr[i]] - y[ii]) / (ipr[i] - ii) * isign;
     ddy:= abs(bslope);
     //if  ddymin = ddy then ShowMessage('isti');
     IF  ddymin < ddy THEN
                     begin
                    // ShowMessage('DDY '+FloatTOStr(DDY)+' '+'DDYMIN '+FloatTOStr(ddymin) +' X'+fLOATToStr(ipl[i]));
		     ddymin:= ddy;
                     ipl[i]:=ii;

                     //ShowMessage('IPL +1 '+FloatToStr(xx[ipl[i]]));
                     end
		   ELSE
                     begin
                     break;
		     //ih2:= ih2 + 1;
                    // IF ih2 > ipw THEN break;
                    //howMessage('NAGIB VECI'+' X'+fLOATToStr(ipl[i]));
		    // IF ih2 > 2 THEN break;
                     end;
 END;
 //ShowMessage('IPL '+FloatTOStr(xx[IPL[2]])+' '+'IPR '+FloatTOStr(xx[IPR[2]]) +' I'+IntToStr(2));
end;//if iste 1

 ////ubaceno 22.08.2011.

end;//    IF ABS(y[ipl[i]]-y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/100 THEN
//ShowMessage(+' '+FloatTOStr(xx[irval]));
//ShowMessage('IPL '+FloatTOStr(xx[ipl[i]])+' '+'IPR '+FloatTOStr(xx[ipr[i]]) +'I'+IntToStr(i));

end;

  //			  '--- search for real peak positions and maxima in derivative
FOR i:= 1 TO ipi do
    begin
    MAXY:= -1E+10;
    diplus:= -1E+10;
    dimin:= 1E+10;
    {ippH:= 0;}
////////////////////////////////////////////////////////////////////////////
   IF ABS(y[ipl[i]] - y[ipr[i]]) > ABS(y[ipp[i]] - y[ipl[i]])/150 then
     begin
      //ShowMessage('asda');
      yl:= y[ipl[i]];
      yr:= y[ipr[i]];
      FOR ii:= ipl[i] TO ipr[i] do
          begin
	  IF yd[ii] > diplus THEN
             begin
             diplus:= yd[ii];
             idyl[i]:= ii;
             end;
	  IF yd[ii] < dimin THEN
             begin
             dimin:= yd[ii];
             idyr[i]:= ii;
             end;
	  yoffset:= yl + (ii - ipl[i]) * (yr - yl) / (ipr[i] - ipl[i]);
	  YOFF:= y[ii] - yoffset;
	  IF YOFF * isign >= MAXY THEN
             begin
             MAXY:= isign * YOFF;
             ipp[i]:= ii;
             end;
      end; {for ii}
    end {if}
   ELSE
       begin
       if (idyl[i]-idyr[i])<0 then iste:=-1 else iste:=1;
       FOR ii:= ipl[i] TO ipr[i] do//  '--- idyl(i) to idyr(i) step iste
           begin
	   IF y[ii]*isign >= MAXY THEN
              begin
              MAXY:=isign*y[ii];
              ipp[i]:= ii;
              end;
	   IF yd[ii]>diplus THEN
              begin
              diplus:=yd[ii];
              idyl[i]:=ii;
              end;
	   IF yd[ii]<dimin THEN
              begin
              dimin:= yd[ii];
              idyr[i]:= ii;
              end;
           end; { ii}

       end; {if}

  end; {for i}

		//'--- delete too narrow peaks
i:= 1;
WHILE i <= ipi do
      begin
      //IF ((ipr[i]-ipp[i])<=ips2) OR ((ipp[i]-ipl[i])<=ips2) THEN
      IF ((idyr[i]-idyl[i])<=ips2+2) then //OR ((idyl[i]-idyr[i])<=3)  THEN
      begin
      FOR j:= i TO ipi-1 do
          begin
          idyr[J]:=idyr[j+1];
          idyl[J]:=idyl[j+1];
          ipr[j]:= ipr[j + 1];
          ipl[j]:= ipl[j + 1];
          ipp[j]:= ipp[j + 1];
          end;
         i:=i-1;
         ipi:=ipi-1;
      end;
    i:= i + 1;
//ShowMessage('IPL '+FloatTOStr(xx[ipl[i]])+' '+'IPR '+FloatTOStr(xx[ipr[i]]) +'I'+IntToStr(i));
end;// if
 //dodano
 {for j:= 1 to ipi do
        begin
        if (ipr[j]-ipp[j])>(ipp[j]-ipl[j])+10 then
                begin
                ipr[j]:=ipp[j]+(ipp[j]-ipl[j])+sir;
                end;
        if (ipr[j]-ipp[j])<(ipp[j]-ipl[j])-10 then
                begin
                ipl[j]:=ipp[j]-(ipr[j]-ipp[j])-sir;
                end;
        end; }

  //dodano

BrojPikova:= ipi;

//ShowMessage(IntToStr(BrojPikova));
end; {procedure}


Procedure Showpeaks(graf:TRChart;Listing:TListBox;X,Y: array of double; DDX: DOuble;BrojPikova: Integer;ipl,ipr,ipp:array of integer;PokaziVrijednosti, suprotni, pik,rear, front,Nobaseline:Boolean);
var
I,ii,go,c,aa,pomak1st: Integer;
XL,XR,XS,YL,YR,YS,YSP,YSPF,YSPR: double;
nagibw12, Odsjecakw12, ordinataw12,yyy,presjek, a2, b2, w12,y12L,y12R: DOuble;
povrs, y1, y2,bazninagib, FirstDer: DOuble;
ippr : array[0..200] of DOuble;
ab, vari, covari: array[0..11] of double;
Skala,Max2Der: double;
CurDer, curder2:array[0..4000] of double;
BojaGrafa: TColor;
begin

BojaGrafa:=Graf.DataColor;
Graf.dataColor:=clRed;
Skala:=Graf.Scale1Y.RangeHigh-Graf.Scale1Y.RangeLow;
//ShowMessage(InTToStr(Ipl[1])+' '+InTToStr(BrojPikova));
//Listing.Clear;
for I:= 1 to BrojPikova do
    begin
    XL:=X[Ipl[i]];
    YL:=Y[Ipl[i]];
    XR:=X[Ipr[i]];
    YR:=Y[Ipr[i]];
    XS:=X[IPP[i]];
    YSP:=Y[IPP[i]];
    if (XR-XL)=0 then exit;//ShowMEssage(FLoatToStr((XR-XL)));
    YS:=((YR-YL)/(XR-XL))*(XS-XL)+YL;
    //ShowMEssage('peak '+FLoatToStr((YSP-YS)));
    For c:= 1 to 10 do ab[c]:=1;
    For c:= 1 to 10 do vari[c]:=0;
    For c:= 1 to 10 do covari[c]:=0;
 //   if front then DoPolyFit(x, y,ipl[i],ipr[i], ab,vari, covari,2, False);
  //  if Rear then DoPolyFit(x, y,ipl[i],ipr[i], ab,vari, covari,2, False);
    //if front then ShowMEssage(IntToStr(ipl[i])+' '+IntToStr(ipr[i]));
    if front then YS:=ab[1]+xs*ab[2];
    if rear then YS:=ab[1]+xs*ab[2];

    if Rear then Graf.Line(XS,YS,XR,ab[1]+xR*ab[2]);
    if front then Graf.Line(XS,YS,XL,ab[1]+xL*ab[2]);

    if Nobaseline=False then if pik then    Graf.Line(XL,YL,XR,YR);
    if Nobaseline=False then Graf.Line(XS,YSP,XS,YS)
    else Graf.Line(XS,YSP,XS,0);

    //Graf.Text(XS,YSP+Skala*0.02,10,IntToStr(i));

    //Graf.Autorange(5);


////////////////W12
   if pik then begin

       go:=0;
       nagibw12:=(y[ipr[i]]-y[ipl[i]])/(x[ipr[i]]-x[ipl[i]]);
       Ordinataw12:=(YSP-YS)/2+((y[ipl[i]]-y[ipr[i]])/(x[ipl[i]]-x[ipr[i]]))*(x[ipp[i]]-x[ipr[i]])+y[ipr[i]];
       odsjecakw12:=ordinataw12-nagibw12*x[ipp[i]];

       For ii:= ipl[i]+1 to ipr[i]-5 do
           begin
           //yyy:=nagibw12*x[ii]+odsjecakw12;
           if Y[ii+1]<>y[ii] then
           begin
           presjek:=(odsjecakw12+((y[ii+1]-y[ii])*x[ii]/(x[ii+1]-x[ii]))-y[ii])/((y[ii+1]-y[ii])/(x[ii+1]-x[ii])-nagibw12);
         if ((presjek>x[ii]) and (presjek<x[ii+1])) or ((presjek<x[ii]) and (presjek>x[ii+1]))then
             begin
              go:=go+1;
              a2:=(y[ii+1]-y[ii])/(x[ii+1]-x[ii]);
              b2:=y[ii]-a2*x[ii];
              Presjek:=(odsjecakw12-b2)/(a2-nagibw12);
              ippr[go]:=presjek;
              if go mod 2 = 0 then w12:=abs(ippr[go]-ippr[go-1]);
              end;
              end;
           end;  //for ii

//second derivation
 For ii:= ipl[i]+4 to ipr[i]-4 do
  begin
  CurDer[ii]:= 4 * (y[ii+4]-y[ii-4])+3*(y[ii+3]-y[ii-3])+2*(y[ii+2]-y[ii-2])-y[ii-1]+y[ii+1];
  end;
 For ii:= ipl[i]+8 to ipr[i]-8 do
  begin
  CurDer2[ii]:= 4 * (CurDer[ii+4]-CurDer[ii-4])+3*(CurDer[ii+3]-CurDer[ii-3])+2*(CurDer[ii+2]-CurDer[ii-2])-CurDer[ii-1]+CurDer[ii+1];
  end;
  Max2Der:=0;
  For ii:= ipl[i]+8 to ipr[i]-8 do if abs(CurDer2[ii])>Max2Der then Max2Der:=abs(CurDer2[ii]);

pomak1st:=round(w12/abs(x[10]-x[9])/1.5);
//pomak1st:=10;
//if ipp[i]-pomak1st <1 then ipp[i]:=pomak1st+2;
//ShowMessage(FloatTOstr(ipp[i])+' '+FloatTOstr(pomak1st));
//Peak1Derivative(X,Y,ipp[i]-pomak1st, ipp[i]+pomak1st, FirstDer);
//////////povrsina

          povrs:=0;
          bazninagib:=((YR-YL)/(XR-XL));
          For ii:= ipl[i] to ipr[i] do
           begin
          y1:=(bazninagib*(x[ii]-XL)+YL)-y[ii];
          y2:=(bazninagib*(x[ii+1]-XL)+YL)-y[ii+1];
          povrs:=povrs+ddx*(y1+y2)/2;
          end;
//////////povrsina

       y12L:=nagibw12*ippr[go-1]+odsjecakw12;
       y12R:=nagibw12*ippr[go]+odsjecakw12;
       graf.Line(ippr[go-1],y12L,ippr[go],y12R);
         end;  // if pik
       //graf.ShowgrafNewOnly;
       //GrafPrikaz1.RChart1.DataColor:=GrafProperties1.RChart1.DataCOlor;
//////////////////w12
if NoBaseline=false then Listing.Items.add(IntToStr(i)+ '   '+FormatFloat('0.0000',XS) + '   '+FormatFloat('0.000e+0',YSP-YS)+'     '+FormatFloat('0.00e+0',abs(FirstDer)*1)+'       ' +FormatFLoat('0.00e+0',abs(Povrs)))
else Listing.Items.add(IntToStr(i)+ '   '+FormatFloat('0.0000',XS) + '   '+FormatFloat('0.000e+0',YSP)+'     '+FormatFloat('0.00e+0',abs(FirstDer)*1)+'       ' +FormatFLoat('0.00e+0',abs(Povrs)));



if PokaziVrijednosti=False then
    begin
    //if graf.Scale1y.RangeHigh<graf.Scale1y.Rangelow then Skala:=-skala;
    //if YSP>YS then Graf.Text(XS,YSP+Skala*0.022,10,FormatFLoat('[0]',i))
    //else Graf.Text(XS,YSP-Skala*0.022,10,FormatFLoat('[0]',i))
    end;

if PokaziVrijednosti then
    begin
     if graf.Scale1y.RangeHigh<graf.Scale1y.Rangelow then Skala:=-skala;
     if YSP>YS then
     begin
        if NoBaseline=false then Graf.Text(XS,YSP+Skala*0.045,8,FormatFLoat('0.000E+00 A',YSP-ys))
        else Graf.Text(XS,YSP+Skala*0.045,8,FormatFLoat('0.000E+00 A',YSP));
        Graf.Text(XS,YSP+Skala*0.025,8,FormatFLoat('0.0000 V',XS));
        Graf.Text(XS,YSP+Skala*0.005,8,FormatFLoat('0.00 mV',w12*1000));

     end else
     begin
     if NoBaseline=false then Graf.Text(XS,YSP-Skala*0.045,8,FormatFLoat('0.000E+00 A',YSP-YS))
     else Graf.Text(XS,YSP-Skala*0.045,8,FormatFLoat('0.000E+00 A',YSP));
     Graf.Text(XS,YSP-Skala*0.025,8,FormatFLoat('0.0000 V',XS));
     Graf.Text(XS,YSP-Skala*0.005,8,FormatFLoat('0.00 mV',w12*1000));
     end;
       // Graf.Text(XS,YSP+Skala*0.062,10,FormatFLoat('0.000E+00',abs(povrs)));
       //  if pik then Graf.Text(XS,(y12l+y12r)/2+Skala*0.015,10,FormatFloat('00.0 mV',w12*1000));
     end;

    end; //for
Graf.dataColor:=BojaGrafa;
end;//procedure

procedure OdrediPeak(graf:TRChart;x,y: array of double; from, too, brojpikova,metoda: Integer; polozaj: array of integer);
var
i: integer;
ordinata, Razlikastruja, Skala: single;
BojaGrafa: TColor;
begin
//nagib:=(y[2]-y[1])/(x[2]-x[1]);
//RazlikaStruja[od-1]:=RazlikaStruja[od];
//RazlikaStruja[ka+1]:=RazlikaStruja[ka];
BojaGrafa:=Graf.DataColor;
Graf.dataColor:=clRed;
if metoda=1 then
begin
   Skala:=Graf.Scale1Y.RangeHigh-Graf.scale1y.RangeLow;
   for I:= 1 to brojpikova do
   begin
   Ordinata:=((y[from]-y[too])/(x[from]-x[too]))*(x[polozaj[i]]-x[too])+y[too];
   RazlikaStruja:=y[polozaj[i]]-ordinata;
  graf.DataColor:=clRed;

   graf.Line(x[from],y[from],x[too],y[too]);
   graf.Line(x[polozaj[i]],Ordinata,x[polozaj[i]],y[polozaj[i]]);
   Graf.Text(x[polozaj[i]],y[polozaj[i]]+Skala*0.022,8,FormatFLoat('0.000E+00 A',Razlikastruja));
   Graf.Text(x[polozaj[i]],y[polozaj[i]]+Skala*0.045,8,FormatFLoat('0.0000 V',x[polozaj[i]]));
  // graf.MarkAt(y[polozaj[i]], y[polozaj[i]]+strelica/2, 23);
  // graf.Line(y[polozaj[i]], y[polozaj[i]]+strelica/2,x[polozaj[i]], y[polozaj[i]]+strelica*2);
  // graf.Text(y[polozaj[i]], y[polozaj[i]]+strelica*2.5,8,IntTOStr(I));
   end;
 Graf.dataColor:=BojaGrafa;
  end;//if

 

 end;









end.
