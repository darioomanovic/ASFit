unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs,
  Buttons, ExtCtrls, HTTPApp, OleCtrls, SHDocVw,
   registry, Shellapi;

type
  TAboutBox = class(TForm)
    OKButton: TButton;
    Memo1: TMemo;
        procedure FormCreate(Sender: TObject);
    procedure RegisterOCX;
    function GetSystemDirectory(var S: String): Boolean;
    function GetWindowsDirectory(var S: String): Boolean;
    function IsWindows64: Boolean;
    procedure OKButtonClick(Sender: TObject);
  private
  FAllInOneFlag : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;
  registered:Boolean;

implementation
uses mainunit;
{$R *.dfm}


function GetFileSize(const fn: string): integer;
var
  f: file;
  Buffer: PAnsiChar;
begin
  Result := -1;
  ShowMessage(IntToStr(Result));
  AssignFile(F, fn);
  Reset(F);
    try
      result:= FileSize(F);

    finally
      CloseFile(F);
    end;
end;

function IsUserAnAdmin(): BOOL; external shell32;

function IsWindowsAdministrator: Boolean;
// Returns TRUE if the user has administrator priveleges
// Returns a boolean indicating whether or not user has admin
// privileges. Call only when running under NT. Win9.x will return false!
var
  hAccessToken       : tHandle;
  ptgGroups          : pTokenGroups;
  dwInfoBufferSize   : DWORD;
  psidAdministrators : PSID;
  int                : integer;            // counter
  blnResult          : boolean;            // return flag

const
  SECURITY_NT_AUTHORITY: SID_IDENTIFIER_AUTHORITY =
    (Value: (0,0,0,0,0,5)); // ntifs
  SECURITY_BUILTIN_DOMAIN_RID: DWORD = $00000020;
  DOMAIN_ALIAS_RID_ADMINS: DWORD = $00000220;
  DOMAIN_ALIAS_RID_USERS : DWORD = $00000221;
  DOMAIN_ALIAS_RID_GUESTS: DWORD = $00000222;
  DOMAIN_ALIAS_RID_POWER_: DWORD = $00000223;

begin
  Result := False;
  blnResult := OpenThreadToken( GetCurrentThread, TOKEN_QUERY,
                                True, hAccessToken );
  if ( not blnResult ) then
  begin
    if GetLastError = ERROR_NO_TOKEN then
    blnResult := OpenProcessToken( GetCurrentProcess,
                       TOKEN_QUERY, hAccessToken );
  end;

  ptgGroups := nil;

  if ( blnResult ) then
  try

    GetMem(ptgGroups, 1024);
    blnResult := GetTokenInformation( hAccessToken, TokenGroups,
                                      ptgGroups, 1024,
                                      dwInfoBufferSize );
    CloseHandle( hAccessToken );

    if ( blnResult ) then
    begin

      AllocateAndInitializeSid( SECURITY_NT_AUTHORITY, 2,
                                SECURITY_BUILTIN_DOMAIN_RID,
                                DOMAIN_ALIAS_RID_ADMINS,
                    0, 0, 0, 0, 0, 0,
                    psidAdministrators );
      {$IFOPT R+}
        {$DEFINE RMINUS}
        {$R-}
      {$ENDIF}
      for int := 0 to ptgGroups.GroupCount - 1 do

        if EqualSid( psidAdministrators,
                     ptgGroups.Groups[ int ].Sid ) then
        begin
          Result := True;
          Break;
        end;
      {$IFDEF IMINUS}
        {$R-}
        {$UNDEF IMINUS}
      {$ENDIF}

      FreeSid( psidAdministrators );
    end;

  finally
    If ptgGroups <> nil then
      FreeMem( ptgGroups );
  end;
end;


function GetComputerNetName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''
end;

Function GetUserFromWindows: string;
Var
   UserName : string;
   UserNameLen : Dword;
Begin
   UserNameLen := 255;
   SetLength(userName, UserNameLen) ;
   If GetUserName(PChar(UserName), UserNameLen) Then
     Result := Copy(UserName,1,UserNameLen - 1)
   Else
     Result := 'Unknown';
End;


function TAboutBox.GetSystemDirectory(var S: String): Boolean;
var
  Len: Integer;
begin
  Len := Windows.GetSystemDirectory(nil, 0);
  if Len > 0 then
  begin
    SetLength(S, Len);
    Len := Windows.GetSystemDirectory(PChar(S), Len);
    SetLength(S, Len);
    Result := Len > 0;
  end else
    Result := False;
end;

function TAboutBox.GetWindowsDirectory(var S: String): Boolean;
var
  Len: Integer;
begin
  Len := Windows.GetWindowsDirectory(nil, 0);
  if Len > 0 then
  begin
    SetLength(S, Len);
    Len := Windows.GetWindowsDirectory(PChar(S), Len);
    SetLength(S, Len);
    Result := Len > 0;
  end else
    Result := False;
end;


function TAboutBox.IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64         : BOOL;
begin
  Result := False;
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit; // Loading kernel32.dll was failed, just return
  try
        @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
        if not Assigned(vIsWow64Process) then Exit; // Loading IsWow64Process was failed, just return
        vIsWow64 := False;
        if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
          Result := vIsWow64;   // use the returned value
  finally
        FreeLibrary(vKernel32Handle);  // unload the library
  end;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin

close;
end;

function ExecAndWait(const ExecuteFile, ParamString : string): boolean;
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile);
    lpParameters := PChar(ParamString);
    nShow := SW_HIDE;
  end;
  if ShellExecuteEx(@SEInfo) then
  begin

    repeat
      //Showmessage('ew');
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result:=True;
  end
  else Result:=False;
end;


function getFileSizeInBytes(const fn: string): integer;
var
  f: File of byte;
begin
  Result := -1;
  if (FileExists(fn)) then
  begin
    try
      {$I-}
      AssignFile(f, fn);
      Reset(f);
      {$I+}
      if (IOResult = 0) then
      begin
        Result := FileSize(f);
      end
      else
      begin
        Result := 0;
      end;
    finally
      {$I-}CloseFile(f);{$I+}
    end;
  end;
end;




procedure TAboutBox.FormCreate(Sender: TObject);
var
reg: TRegistry;
regkey:String;
admin, update:Boolean;
  aHandle  : THandle;
  ocxPath, WinDir, SystemDir, SystemDir64  : string;
   rStream: TResourceStream;
  fStream: TFileStream;
  Fname: string;
begin
registered:=true;
update:=False;
if IsUserAnAdmin() then Admin:=True else Admin:=False;
Reg:=TRegistry.Create;//()
Reg.RootKey := HKEY_CLASSES_ROOT;
if IsWindows64 then regkey:='\Wow6432Node\CLSID\{673AB001-9A0B-11D4-B2A4-FD6847C75367}'
else regkey:='\CLSID\{673AB001-9A0B-11D4-B2A4-FD6847C75367}';

 try
 GetSystemDirectory(SystemDir);
 GetWindowsDirectory(WinDir);
 systemDir:=SystemDir+'\';
 if IsWindows64 then
  begin
  SystemDir:=WinDIr+'\SysWOW64\';
  ocxPath := SystemDir + lowercase('fitter.dll');
  end else ocxPath := SystemDir + lowercase('fitter.dll');;

 if Admin then
  begin
  if getFileSizeInBytes(SystemDir + 'fitter.dll')<210000 then
  begin
  DeleteFIle(SystemDir + 'fitter.dll');
  update:=True;
  end;
  if not FileExists(SystemDir + 'fitter.dll') then
   begin
    Fname := SystemDir + 'fitter.dll';
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
   end;

   if not FileExists(SystemDir + 'lmhelper.dll') then
   begin
    Fname := SystemDir + 'lmhelper.dll';
    rStream := TResourceStream.Create(hInstance, 'lmhelper', RT_RCDATA);
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
   end;


  end;

  except
   ShowMessage(Format('Unable to register %s', [ocxPath]));
  end;



if Admin then
if (Reg.OpenKey(regkey,false)=false) or update then
begin
RegisterOCX;
registered:=False;
ShowMEssage('Fitter.dll is needed for fitting and it is automatically registered!');
ShellExecute(Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);

end;
Reg.Free;
if registered=False then Application.Terminate;

end;


procedure TAboutBox.RegisterOCX;
type
  TRegFunc = function : HResult; stdcall;
var
  ARegFunc : TRegFunc;
  aHandle  : THandle;
  ocxPath, WinDir, SystemDir, SystemDir64  : string;
   rStream: TResourceStream;
  fStream: TFileStream;
  Fname: string;
begin
 try
 GetSystemDirectory(SystemDir);
 GetWindowsDirectory(WinDir);
 systemDir:=SystemDir+'\';
 if IsWindows64 then
  begin
  SystemDir:=WinDIr+'\SysWOW64\';
  ocxPath := SystemDir + 'Fitter.dll';
  end else ocxPath := SystemDir + 'Fitter.dll';;

if fileexists(ocxPath) then deletefile(ocxPath);


  if not FileExists(SystemDir + 'fitter.dll') then
  begin
    Fname := SystemDir + 'fitter.dll';
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
  end;





 aHandle := LoadLibrary(PChar(ocxPath));
if aHandle <> 0 then
 begin
 ARegFunc := GetProcAddress(aHandle,'DllRegisterServer');
 if Assigned(ARegFunc) then
		begin
    ExecAndWait(SystemDir+'regsvr32','/s ' + ocxPath);
    //ShowMessage(SystemDir+'regsvr32');
   end;
	FreeLibrary(aHandle);
  end;
  except
  ShowMessage(Format('Unable to register %s', [ocxPath]));
  end;
end;
end.

