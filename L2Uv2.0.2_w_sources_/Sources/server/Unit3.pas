unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, ValEdit, CheckLst;

type
  TForm3 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    ValueListEditor1: TValueListEditor;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button4: TButton;
    Label5: TLabel;
    Edit2: TEdit;
    procedure ValueListEditor1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses WThread,bUpd, inifiles, Misc;
{$R *.dfm}

procedure TForm3.ValueListEditor1DblClick(Sender: TObject);
begin
  ValueListEditor1.InsertRow('','',True);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 ListBox1.MoveSelection(ListBox2);
 ListBox1.DeleteSelected;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 ListBox2.MoveSelection(ListBox1);
 ListBox2.DeleteSelected;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
 Form3.Close;
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked = True then
begin
  Settings[2]:='1';
  ValueListEditor1.Enabled:=true
end
else
begin
  Settings[2]:='0';
  ValueListEditor1.Enabled:=False;
end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Form1.Enabled:=False;
  Form1.Button3.Enabled:=False;
  Form3.Edit1.Text:=Form1.Edit3.Text;
  Form3.Edit2.Text:=Settings[3];
  if Settings[2]='1' then CheckBox1.Checked := True
  else CheckBox1.Checked := False;
  ValueListEditor1.Strings:=SHosts;
end;

procedure TForm3.Button3Click(Sender: TObject);
var
  PThread : WorkThread;
  Rev, i : integer;
  Hosts, Slines : TStrings;
begin
  Form1.Gauge1.Visible:=True;
  Form1.Gauge2.Visible:=True;
  Hosts:=TStrings.Create;
    Rev := StrToInt(Edit1.Text);
    PThread := WorkThread.Create(True);
    PThread.FreeOnTerminate:=True;
    PThread.SourceDir:=Form1.Edit1.Text;
    PThread.OutputDir:=Form1.Edit2.Text;
    PThread.RevisionNum:=Rev;
    PThread.UpdaterClienName:=Settings[3];
    PThread.ModHosts:=StrToInt(Settings[2]);
    PThread.HostsLines:=ValueListEditor1.Strings;
    PThread.NormalFiles:=ListBox1.Items;
    PThread.CriticalFiles:=ListBox2.Items;
    PThread.Resume;
    if Settings[1] = '1' then
    begin
      Settings[0] := IntToStr(Rev+1);
      Form1.Edit3.Text:=Settings[0];
    end;
    SettingsFile:= TIniFile.Create(GetCurrentDir+'\settings.ini');
    SettingsFile.EraseSection('hosts');
    if (Settings[2]<>'0') then
    begin
      Slines:=TStrings.Create;
      for i:=0 to ValueListEditor1.Strings.Count-1 do
      begin
        Slines:=Tokenize(ValueListEditor1.Strings[i],'=');
        SettingsFile.WriteString('hosts',Slines[1],Slines[0]);
      end;
      Slines.Free;
    end;
    SettingsFile.Free;
    Form1.Gauge1.MaxValue:=ListBox1.Count + ListBox2.Count;
    Form3.Close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled:=True;
  Form1.Button3.Enabled:=True;
  Settings[3]:=Form3.Edit2.Text;
end;

procedure TForm3.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (GetKeyState(VK_DELETE)<>0) then
    ListBox1.DeleteSelected;
end;

procedure TForm3.ListBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (GetKeyState(VK_DELETE)<>0) then
    ListBox2.DeleteSelected;
end;

end.
