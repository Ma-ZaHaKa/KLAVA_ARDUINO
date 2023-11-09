unit Umain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort, Vcl.ExtCtrls, USendtoCOM, Vcl.Menus,
  Vcl.ImgList, Vcl.AppEvnts, System.IniFiles, Registry;

type
  TForm2 = class(TForm)
    tmr: TTimer;
    mmoLOG: TMemo;
    cbbPort: TComboBox;
    lbl1: TLabel;
    btnStart: TButton;
    btnStop: TButton;
    PopupMenu1: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    TrayIcon: TTrayIcon;
    ApplicationEvents: TApplicationEvents;
    ilMinimize: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure SendToPort(s: string);
    procedure tmrTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationEventsMinimize(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StartJob;
    procedure EndJob;
    procedure cbbPortChange(Sender: TObject);
    procedure changereg(strname: shortstring; delete: boolean);

  private
    { Private declarations }
    procedure OnMinimizeProc(Sender: TObject);
    procedure RestoreFromTray;
    procedure Delay(dwMilliseconds: Longint);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  lastlayer: longword;
  ExePath: string;
  Port: string;
  // kHook: cardinal;

implementation

{$R *.dfm}


{ активная раскладка в активном окне }
function GetActiveKbdLayoutWnd: longword;
var
  hWindow, idProcess: THandle;
begin
  // получить handle активного окна чужой программы
  hWindow := GetForegroundWindow;
  // Получить идентификатор чужого процесса
  idProcess := GetWindowThreadProcessId(hWindow, nil);
  // AttachConsole(idProcess);
  // Form2.lbl2.Caption := IntToStr(idProcess);
  // Получить текущую раскладку в чужой программе
  Result := (GetKeyboardLayout(idProcess) shr $10);
  // FreeConsole;

end;

procedure TForm2.ApplicationEventsMinimize(Sender: TObject);
begin
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  // WindowState := wsMinimized;  //в примере так было, но с ним странно ключит

  { Show the animated tray icon and also a hint balloon. }

  TrayIcon.Visible := true;

end;

procedure TForm2.btnStartClick(Sender: TObject);
begin
  StartJob;

end;

procedure TForm2.btnStopClick(Sender: TObject);
begin
  EndJob;
end;

procedure TForm2.cbbPortChange(Sender: TObject);
var Ifile: TIniFile;
begin
  Ifile := TIniFile.Create(ExePath + 'param.ini');
  Port := cbbPort.Text;
  Ifile.WriteString('param', 'port', Port);

  Ifile.Free;

end;

procedure TForm2.changereg(strname: shortstring; delete: boolean);
var
  reg: tregistry;
begin
  reg := nil;
  try
    reg := tregistry.Create;
    // reg.rootkey := hkey_local_machine;
    // reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.RootKey := HKEY_CURRENT_USER;
    // reg.RootKey := HKEY_CURRENT_USER;
    reg.lazywrite := false;
    // reg.openkey('softwaremicrosoftwindowscurrentversionrun',false);
    reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
    if not delete then
      reg.WriteString(strname, Application.ExeName)
    else
      reg.deletevalue(strname);
    reg.closekey;
    reg.Free;
  except
    if Assigned(reg) then
      reg.Free;
  end;
end;

procedure TForm2.Delay(dwMilliseconds: Integer);
 var
   iStart, iStop: DWORD;
 begin
   iStart := GetTickCount;
   repeat
     iStop := GetTickCount;
     Application.ProcessMessages;
   until (iStop - iStart) >= dwMilliseconds;
 end;


procedure TForm2.EndJob;
begin
  tmr.Enabled := false;
  btnStart.Enabled := true;
  btnStop.Enabled := false;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Закрыть приложение? После закрытия формы задания будут работать дальше.'#13#10 +
    'Нажмите ОК для выхода или Отмена для сворачивания в системный трей', 'Подтверждение', MB_OKCANCEL + MB_ICONWARNING) <> IDOK then
  begin
    Action := caNone;
    OnMinimizeProc(Sender);
    Exit;
  end;
  EndJob;
  TrayIcon.Visible := false;

end;

procedure TForm2.FormCreate(Sender: TObject);
var Ifile: TIniFile;
begin
  OnMinimizeProc(Sender);
  lastlayer := 0;

  ExePath := ExtractFilePath(Application.ExeName);
  Ifile := TIniFile.Create(ExePath + 'param.ini');
  Port := Ifile.ReadString('param', 'port', 'COM1');
  Ifile.Free;
  cbbPort.ItemIndex := cbbPort.Items.IndexOf(Port);

  changereg(Caption, false);
  StartJob;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
  RestoreFromTray;
end;

procedure TForm2.OnMinimizeProc(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TForm2.RestoreFromTray;
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  // TrayIcon.Visible := false;
  Show();

  WindowState := wsNormal;
  Application.Restore;

  Application.BringToFront();
end;

procedure TForm2.SendToPort(s: string);
var SendToCOM: THSendToCOM;
begin

  SendToCOM := THSendToCOM.Create(true);
  SendToCOM.Priority := tpNormal;
  SendToCOM.pornumber := Port;
  SendToCOM.writetext := s;
  SendToCOM.FreeOnTerminate := true;
  SendToCOM.Resume;

end;

procedure TForm2.StartJob;
begin
  tmr.Enabled := true;
  btnStart.Enabled := false;
  btnStop.Enabled := true;

end;

procedure TForm2.tmrTimer(Sender: TObject);
var
  r: longword;
begin

    r := GetActiveKbdLayoutWnd;
    if lastlayer <> r then
    begin
      try

        if r = $409 then
        begin
          SendToPort('1');
        end
        else if r = $419 then
        begin
          SendToPort('2');
        end
        else
        begin
          if r = $422 then
            SendToPort('3');
        end;

        lastlayer := r;

      except

      end
    end;

end;

end.
