program upBuilder;

uses
  Forms,
  bUpd in 'bUpd.pas' {Form1},
  WThread in 'WThread.pas',
  Misc in 'Misc.pas',
  md5 in 'md5.pas',
  BZip2 in 'BZip2.pas',
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
