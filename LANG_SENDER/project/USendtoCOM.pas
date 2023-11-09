unit USendtoCOM;

interface

uses
  System.Classes, CPort;

type
  THSendToCOM = class(TThread)
  private
    { Private declarations }
//    Buf: String;
  protected
    procedure Execute; override;
//    procedure cpRxChar(Sender: TObject; Count: Integer);
  public
    pornumber: string;
    writetext: string;
  end;

implementation

uses Umain;

var
  cp: TComPort;

  {
    Important: Methods and properties of objects in visual components can only be
    used in a method called using Synchronize, for example,

    Synchronize(UpdateCaption);

    and UpdateCaption could look like,

    procedure SendToCOM.UpdateCaption;
    begin
    Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
    procedure
    begin
    Form1.Caption := 'Updated in thread via an anonymous method'
    end
    )
    );

    where an anonymous method is passed.

    Similarly, the developer can call the Queue method with similar parameters as
    above, instead passing another TThread class as the first parameter, putting
    the calling thread in a queue with the other thread.

  }

  { SendToCOM }

//procedure THSendToCOM.cpRxChar(Sender: TObject; Count: Integer);
//var
//  S: String;
//begin
//
//  cp.ReadStr(S, Count);
//  Buf := Buf + S;
//  // if Buf = 'Hello' then
//  // begin
//  Synchronize(
//    procedure
//    begin
//      Form2.mmo1.Lines.Add('С порта: ' + Buf);
//    end);
//  Buf := '';
//  // end;
//end;

procedure THSendToCOM.Execute;
var
  L: TStringList;
  S: string;
begin
  L := TStringList.Create;
  L.Text := writetext;
  // L.SaveToFile('test.txt');
  cp := TComPort.Create(nil);
  cp.Port := pornumber;
//  cp.OnRxChar := cpRxChar;
  try
    try
      if cp.Connected then
        cp.Close
      else
        cp.Open;

      if cp.Connected then
      begin
        cp.WriteStr(writetext);
        cp.Close;
      end;

    except

    end;
  finally
    cp.Free;
  end
end;

end.
