program FileSplitterC;
{$IFOPT D-}{$WEAKLINKRTTI ON}{$ENDIF}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Windows,
  System.SysUtils,
  FileSplitterUnit in 'FileSplitterUnit.pas';
{$SetPEFlags IMAGE_FILE_RELOCS_STRIPPED}


begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
