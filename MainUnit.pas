unit MainUnit;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList, Vcl.ComCtrls;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    OriginalFileEdit: TEdit;
    FileOpenDialog1: TFileOpenDialog;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    MaxSizeUpDown: TUpDown;
    MaxSizeEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    OutputFilePattern: TEdit;
    Button1: TButton;
    ActionList1: TActionList;
    BrowseAction: TAction;
    SplitAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure BrowseActionExecute(Sender: TObject);
    procedure SplitActionUpdate(Sender: TObject);
    procedure SplitActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.StrUtils, System.IOUtils, System.Math, System.Diagnostics, FileSplitterUnit;

{$R *.dfm}

procedure TMainForm.BrowseActionExecute(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
  begin
    OriginalFileEdit.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  OriginalFileEdit.Clear;
  MaxSizeUpDown.Position:= 100;
end;


procedure TMainForm.SplitActionExecute(Sender: TObject);
var
  Stopwatch: TStopwatch;
begin
  Screen.Cursor := crHourGlass;
  try
    Stopwatch := TStopwatch.StartNew;
    Split(OriginalFileEdit.Text, MaxSizeUpDown.Position * 1024 * 1024, OutputFilePattern.Text);
    Caption := Stopwatch.Elapsed.ToString;
  finally
    Screen.Cursor := crDefault;
  end;
end;



procedure TMainForm.SplitActionUpdate(Sender: TObject);
begin
  SplitAction.Enabled := (OriginalFileEdit.Text <> '') and FileExists(OriginalFileEdit.Text) and (OutputFilePattern.Text <> '');
end;

end.
