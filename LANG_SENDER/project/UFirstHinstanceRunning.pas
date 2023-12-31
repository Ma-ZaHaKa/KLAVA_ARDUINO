unit UFirstHinstanceRunning;

interface

uses
  Windows,
  Forms,
  StrUtils,
  SysUtils;

function FirstHinstanceRunning(RunMode: Integer = 0): boolean;

implementation

//�� ������� �� ������� ���� FileMapping. ����� ������ ��� ��� �������� �����, �� �
//������� �� ������������, � ��� ����������� ������������ ����� ��������� �����������
//������� ����������� ����������. ����� ����������� ������� ����- ������� ����������
//(Application.Handle) ��� ��� � ����������� � ������� ���- ��� ������� FileMapping.
//������������ ������ ���� ������� FirstHinstanceRunning. ��� ����� ���� �������� RunMode,
// �������� �������� ������ ���� ���������� ��������� �������:

//    * ���� RunMode = 0 �� ����������� ���������� ������� ����-�� ������ EXE ����� � ������ ����
//    * ���� RunMode = 1 �� ����������� ���������� ������� ����-�� ������ EXE ����� ��� ����� ����
//    * ����� ��������� ������ ��������

function FirstHinstanceRunning(RunMode: Integer = 0): boolean;
const
  MemFileSize = 127;

var
  MemHnd: HWND;
  MemFileName: string;
  lpBaseAddress: ^HWND;
  FirstAppHandle: HWND;

begin
  Result := False;
  MemFileName := Application.ExeName;
  case RunMode of
    0:
      MemFileName := AnsiReplaceText(MemFileName, '\', '/');
    1:
      MemFileName := ExtractFileName(MemFileName);
  else
    Exit;
  end;
  //���� FileMapping ���� - �� ���������� OpenFileMapping
  MemHnd := CreateFileMapping(HWND($FFFFFFFF), nil,
    PAGE_READWRITE, 0, MemFileSize, PChar(MemFileName));
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    if MemHnd <> 0 then
    begin
      lpBaseAddress := MapViewOfFile(MemHnd, FILE_MAP_WRITE, 0, 0, 0);
      if lpBaseAddress <> nil then
        lpBaseAddress^ := Application.Handle;
    end;
  end
  else
  begin
    //    MemFileHnd := OpenFileMapping(FILE_MAP_READ, False, PChar(MemFileName));
    Result := True;
    if MemHnd <> 0 then
    begin
      lpBaseAddress := MapViewOfFile(MemHnd, FILE_MAP_READ, 0, 0, 0);
      if lpBaseAddress <> nil then
      begin
        FirstAppHandle := lpBaseAddress^;
        ShowWindow(FirstAppHandle, SW_restore);
        SetForegroundWindow(FirstAppHandle);
      end;
    end;
  end;
  if lpBaseAddress <> nil then
    UnMapViewOfFile(lpBaseAddress);




end;




end.

