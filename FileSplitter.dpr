program FileSplitter;
{$IFOPT D-}{$WEAKLINKRTTI ON}{$ENDIF}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
uses
  Windows,
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  FileSplitterUnit in 'FileSplitterUnit.pas';

{$R *.res}
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
