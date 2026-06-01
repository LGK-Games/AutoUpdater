unit WThread;

interface

uses
  Classes, BZip2, SysUtils, Dialogs;

type
  WorkThread = class(TThread)
  private
    WNFiles : TStrings;
    WCFiles : TStrings;
    WHosts : TStrings;
    WRevision : integer;
    WModHosts : integer;
    WSrcDir : string;
    WOutDir : string;
    WClientName : string;
    UClientData : string;
    FSource: TStream;
  protected
    procedure Execute; override;
    procedure UpdateProgress;
    procedure PackFiles(Dir: string; UploadDir: string; FList: Tstrings);
    procedure EnableForm;
    procedure UpdateFileProgressMax;
    procedure UpdateFileProgress;
    procedure CompressFile(const ASource, ADest: TFileName);
    procedure DoCompressStream(ASource, ADest: TStream);
    procedure BZProgress(Sender: TObject);
    procedure CreateList;
  public
    property RevisionNum : integer write WRevision;
    property UpdaterClienName : string write WClientName;
    property SourceDir : string write WSrcDir;
    property OutputDir : string write WOutDir;
    property ModHosts : integer write WModHosts;
    property NormalFiles : TStrings write WNFiles;
    property CriticalFiles : TStrings write WCFiles;
    property HostsLines : TStrings write WHosts;
  end;

implementation
uses bUpd, md5, Misc;

// По-моему, эти функции Update* ужасны ...
// с другой стороны  они относительно корректны

procedure WorkThread.EnableForm;
begin
  Form1.Gauge2.Progress:=0;
  Form1.Button3.Enabled:=True;
  Form1.Gauge1.Progress:=0;
  Form1.Gauge1.Visible:=False;
  Form1.Gauge2.Visible:=False;
  ShowMessage(' Complete ! ');
end;


procedure WorkThread.UpdateProgress;
begin
  Form1.Gauge1.Progress := Form1.Gauge1.Progress + 1;
end;

procedure WorkThread.UpdateFileProgress;
begin
  Form1.Gauge2.Progress := FSource.Position;
end;

procedure WorkThread.UpdateFileProgressMax;
begin
  Form1.Gauge2.MaxValue := FSource.Size;
end;

procedure WorkThread.BZProgress(Sender: TObject);
begin
  Synchronize(UpdateFileProgress);
end;

// конец уж0са ^^


procedure WorkThread.PackFiles(Dir: string; UploadDir: string; FList: Tstrings);
var
  FileN,ZipName,hash: string;
  ZipSize,i :integer;
begin
  if Dir <> '' then
  begin
    if Dir[length(Dir)] <> '\' then Dir := Dir + '\';
    for i:=0 to FList.Count-1 do
    begin

      FileN:= ReplaceStr(Dir + FList[i],Dir,UploadDir+'\');
      hash:= md5.MD5Print(md5.MD5File(Dir + FList[i]));
      ZipName:= FileN+'.bz2';
      if(not DirectoryExists(ExtractFilePath(ZipName))) then
            ForceDirectories(ExtractFilePath(ZipName));
      CompressFile(Dir + FList[i],ZipName);
      ZipSize:=GetFileSize(ZipName);
      Synchronize(UpdateProgress);
      FList[i]:=ReplaceStr(FileN,UploadDir+'\','')+'|'+hash+'|'+IntToStr(ZipSize);
    end;
   end;
end;

procedure WorkThread.CreateList;
var
  LstFile : Textfile;
  i : integer;
begin
AssignFile(LstFile,WOutDir+'\files.lst');
Rewrite(LstFile);
WriteLn(LstFile,'[settings]');
WriteLn(LstFile,'Rev|'+IntToStr(WRevision));
WriteLn(LstFile,'ModHosts|'+IntToStr(WModHosts));
WriteLn(LstFile,'[/settings]');
WriteLn(LstFile,'[self]');
WriteLn(LstFile,UClientData);
WriteLn(LstFile,'[/self]');
  if WModHosts>0 then
  begin
  WriteLn(LstFile,'[hosts]');
    for i:=0 to WHosts.Count-1 do
    begin
      WriteLn(LstFile,ReplaceStr(WHosts[i],'=','|'));
    end;
  WriteLn(LstFile,'[/hosts]');
  end;
WriteLn(LstFile,'[files_critical]');
  for i:=0 to WCFiles.Count-1 do
  begin
    WriteLn(LstFile,WCFiles[i]);
  end;
WriteLn(LstFile,'[/files_critical]');
WriteLn(LstFile,'[files_normal]');
  for i:=0 to WNFiles.Count-1 do
  begin
    WriteLn(LstFile,WNFiles[i]);
  end;
WriteLn(LstFile,'[/files_normal]');
CloseFile(LstFile);
CompressFile(WOutDir+'\files.lst',WOutDir+'\files.lst.bz2');
DeleteFile(WOutDir+'\files.lst');
end;

procedure WorkThread.DoCompressStream(ASource, ADest: TStream);
var
  Comp: TBZCompressionStream;
begin
  FSource := ASource;
  Synchronize(UpdateFileProgressMax);
  Comp := TBZCompressionStream.Create(bs9, ADest);
  try
    Comp.OnProgress := BZProgress;
    Comp.CopyFrom(ASource, 0);
  finally
    Comp.Free;
    FSource := nil;
  end;
end;


procedure WorkThread.CompressFile(const ASource, ADest: TFileName);
var
  Source, Dest: TStream;
begin
  Source := TFileStream.Create(ASource, fmOpenRead + fmShareDenyWrite);
  try
    Dest := TFileStream.Create(ADest, fmCreate);
    try
      DoCompressStream(Source, Dest);
    finally
      Dest.Free;
    end;
  finally
    Source.Free;
  end;
end;

procedure WorkThread.Execute;
var
  WNptr : ^TStringList;
  WCptr : ^TStringList;
  ClientPath : string;
begin
 WNptr:= @WNFiles;
 WCptr:= @WCFiles;
 ClientPath:= WSrcDir+'\'+WClientName;
 if (FileExists(ClientPath)) then
 begin
    CompressFile(ClientPath,WOutDir+'\'+WClientName+'.bz2');
    UClientData:=WClientName+'|'+ md5.MD5Print(md5.MD5File(ClientPath))+'|'+IntToStr(GetFileSize(WOutDir+'\'+WClientName+'.bz2'));
 end;
 PackFiles(WSrcDir , WOutDir, WNptr^);
 PackFiles(WSrcDir , WOutDir, WCptr^);
 CreateList;
 WNFiles.Clear;
 WCFiles.Clear;
 Synchronize(EnableForm);
end;

end.
