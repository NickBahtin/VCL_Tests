program TestRegion;

uses
  Forms,
  uMAinForm in 'uMAinForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
