program RgnCutter;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  AboutFrm in 'AboutFrm.pas' {AboutForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '������� ��������';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
