program PROGRAMKOMAT_KEL14;

uses
  Forms,
  KOMATKEL14 in '..\KOmAT project final\KOMATKEL14.pas' {SPLASHFORM},
  PROJECTKOMAT_KEL14 in 'PROJECTKOMAT_KEL14.pas' {TIGANPLUSSATU};

{$R *.res}

begin
  SPLASHFORM:=TSPLASHFORM.Create(Application);
  SPLASHFORM.Show;
  SPLASHFORM.Update;
  while SPLASHFORM.Timer1.Enabled do Application.ProcessMessages;
  Application.Initialize;
  Application.CreateForm(TTIGANPLUSSATU, TIGANPLUSSATU);
  SPLASHFORM.Hide;
  SPLASHFORM.Free;
  
  Application.Run;
end.
