program cubekeyboard;

uses
  Vcl.Forms,
  Umain in 'Umain.pas' {Form2},
  USendtoCOM in 'USendtoCOM.pas',
  UFirstHinstanceRunning in 'UFirstHinstanceRunning.pas';

{$R *.res}

begin
  Application.Initialize;

    Application.Initialize;
   if FirstHinstanceRunning(1) then
    begin

    Exit;
    end;


  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
