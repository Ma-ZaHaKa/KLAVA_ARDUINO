unit UFirstHinstanceRunning;

interface

uses
  Windows,
  Forms,
  StrUtils,
  SysUtils;

function FirstHinstanceRunning(RunMode: Integer = 0): boolean;

implementation

//Он основан на объекте ядра FileMapping. Такой способ уже был приведен ранее, но в
//отличие от приведенного, в нем использован оригинальный метод получения дескриптора
//первого запущенного приложения. Хэндл дескриптора первого запу- щенного приложения
//(Application.Handle) как раз и сохраняется в области дан- ных объекта FileMapping.
//Используется только одна функция FirstHinstanceRunning. Она имеет один параметр RunMode,
// Значения которого должны быть определены следующим образом:

//    * если RunMode = 0 то недопущение повторного запуска того-же самого EXE файла с учетом пути
//    * если RunMode = 1 то недопущение повторного запуска того-же самого EXE файла без учета пути
//    * иначе повторный запуск разрешен

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
  //если FileMapping есть - то происходит OpenFileMapping
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

