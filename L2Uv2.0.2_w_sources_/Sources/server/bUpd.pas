unit bUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellCtrls, FileCtrl, IniFiles, Menus, ExtCtrls,
  Gauges, ShellAPI;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Bevel1: TBevel;
    Label3: TLabel;
    About1: TMenuItem;
    N1: TMenuItem;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure WriteSettings;
    procedure ReadSettings;    
    { Public declarations }
  end;

var
  Form1: TForm1;
  SettingsFile: TIniFile;
  CustomName: string;
  Settings : TStrings;
  Files : TStrings;
  SHosts : TStrings;

implementation
uses  Unit3, Misc;
{$R *.dfm}

procedure GetDirFiles(Dir, BaseDir: string);
var
  SearchRec: TSearchRec;
  RelName: String; 
begin
  if Dir <> '' then
    if Dir[length(Dir)] <> '\' then
      Dir := Dir + '\';
   if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
    repeat
      Application.ProcessMessages;
      if (SearchRec.name = '.') or (SearchRec.name = '..') then
        continue;
      if (SearchRec.Attr and faDirectory) <> 0 then
        begin
          GetDirFiles(Dir+SearchRec.name, BaseDir);
        end
      else
        begin
        RelName:=ReplaceStr(Dir+SearchRec.name,BaseDir+'\','');
        if (RelName<>Settings[3]) then
        begin
          Files.Add(RelName);
        end;
        end
    until
      FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  Rev : integer;
begin
  if Form1.Edit1.Text = Form1.Edit2.Text then
  begin
    ShowMessage('ERROR: Source Dir = Output Dir !');
  end
  else if (Form1.Edit1.Text='') or (Form1.Edit2.Text='') then
  begin
    ShowMessage(' ... this is not funny ... ');
  end
  else
  begin
    Form1.Gauge1.Progress:=0;
    Files:=TStringList.Create;
    GetDirFiles(Form1.Edit1.Text,Form1.Edit1.Text);
    Form3.ListBox1.Items:= Files;
    Files.Free;
    Form3.Visible:=True;
  end;
end;

procedure TForm1.ReadSettings;
var
 CurDir:string;
begin
  CurDir:=GetCurrentDir;
  SettingsFile:= TIniFile.Create(CurDir+'\settings.ini');
  Settings.Add(SettingsFile.ReadString('main','revision','1'));
  Settings.Add(SettingsFile.ReadString('main','revision_autoinc','1'));
  Settings.Add(SettingsFile.ReadString('main','modify_hosts','0'));
  Settings.Add(SettingsFile.ReadString('main','CustomName','L2Updater.exe'));
  SHosts:=TStringList.Create;
  SettingsFile.ReadSectionValues('hosts',SHosts);
  SettingsFile.Free;
end;

procedure TForm1.WriteSettings;
var
 CurDir:string;
begin
  CurDir:=GetCurrentDir;
  SettingsFile:= TIniFile.Create(CurDir+'\settings.ini');
  SettingsFile.WriteString('main','revision',Settings[0]);
  SettingsFile.WriteString('main','revision_autoinc',Settings[1]);
  SettingsFile.WriteString('main','modify_hosts',Settings[2]);
  SettingsFile.WriteString('main','CustomName',Settings[3]);
  SettingsFile.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Settings := TStringList.Create;
  ReadSettings;
  if Settings[1]='1' then Form1.CheckBox1.Checked:=True
  else Form1.CheckBox1.Checked:=False;
  Form1.Edit3.Text:=Settings[0];
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage('(C)_Untitled 2008');
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  Close();
end;


procedure TForm1.Exit1Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  temp: string;
begin
  SelectDirectory('Select Source Dir','',temp);
  Edit1.Text:=temp;
  Edit1.Hint:=temp;
end;

procedure TForm1.Button2Click(Sender: TObject);
var  temp: string;
begin
  SelectDirectory('Select Output Dir','',temp);
  Edit2.Text:=temp;
  Edit2.Hint:=temp;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Settings[0]:=Edit3.Text;
  WriteSettings;
  Settings.Free;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  ShellExecute(TForm(Owner).Handle,nil,PChar('http://l2storm.com/forums/'), nil, nil,SW_SHOWNORMAL);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked = True then
  Settings[1]:='1'
else Settings[1]:='0';
end;

end.
