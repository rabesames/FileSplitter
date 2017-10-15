unit FileSplitterUnit;

interface

procedure Split(const ASourceFileName: string; const AMaxSize: Int64; const AOutputFilePattern: string);

implementation

uses
  System.Classes, System.IOUtils, System.SysUtils, System.Math;


procedure Split(const ASourceFileName: string; const AMaxSize: Int64; const AOutputFilePattern: string);
var
  x: Integer;
  SourceFileStream, OutputFileStream: TStream;
  SourceStreamSize: Int64;
  OutputFileName: string;
begin
//  SourceFileStream := TBufferedFileStream.Create(ASourceFileName, fmOpenRead or fmShareDenyWrite, AMaxSize);
  SourceFileStream := TFileStream.Create(ASourceFileName, fmOpenRead or fmShareDenyWrite);
  try
    SourceStreamSize := SourceFileStream.Size;
    x := 0;
    repeat
      Inc(x);
      OutputFileName := AOutputFilePattern;
      OutputFileName := StringReplace(OutputFileName, '{FILENAME}', ExtractFileName(ASourceFileName), [rfReplaceAll, rfIgnoreCase]);
      OutputFileName := StringReplace(OutputFileName, '{EXT}', Copy(ExtractFileExt(ASourceFileName), 2, MaxInt), [rfReplaceAll, rfIgnoreCase]);
      OutputFileName := StringReplace(OutputFileName, '{#}', FormatFloat('0000', x), [rfReplaceAll, rfIgnoreCase]);

      OutputFileName := TPath.Combine(ExtractFilePath(ASourceFileName), OutputFileName);

      //OutputFileStream := TBufferedFileStream.Create(OutputFileName, fmCreate or fmShareExclusive, AMaxSize);
      OutputFileStream := TFileStream.Create(OutputFileName, fmCreate or fmShareExclusive);
      try
        OutputFileStream.CopyFrom(SourceFileStream, Min(AMaxSize, SourceStreamSize - SourceFileStream.Position));
      finally
        FreeAndNil(OutputFileStream);
      end;
    until SourceFileStream.Position = SourceStreamSize;
  finally
    FreeAndNil(SourceFileStream);
  end;
end;

end.
