unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.NetEncoding,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    StaticText1: TStaticText;
    Button1: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    StaticText2: TStaticText;
    Edit2: TEdit;
    OpenDialog1: TOpenDialog;
    ProgressBar: TProgressBar;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
  function SplitFile(FileName: TFileName; SizeofFiles: Integer): Boolean;
  procedure GerarHash(AInFileName, AOutFileName: string);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GerarHash(AInFileName, AOutFileName: string);
var
  inStream: TStream;
  outStream: TStream;
begin
  AInFileName := Edit1.Text;
  AOutFileName := Edit2.Text;
  inStream := TFileStream.Create(AInFileName, fmOpenRead);
  try
    outStream := TFileStream.Create(AOutFileName, fmCreate);
    try
      TNetEncoding.Base64.Encode(inStream, outStream);
    finally
      outStream.Free;
    end;
  finally
    inStream.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  GerarHash(edit1.Text, edit2.Text)
end;

function TForm1.SplitFile(FileName: TFileName; SizeofFiles: Integer): Boolean;
var
  i: Word;
  fs, sStream: TFileStream;
  SplitFileName: String;
begin
  ProgressBar.Position := 0;
  fs := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    for i := 1 to Trunc(fs.Size / SizeofFiles) + 1 do
    begin
      SplitFileName := ChangeFileExt(FileName, '.' + FormatFloat('000', i)+'.hash');
      sStream := TFileStream.Create(SplitFileName,
        fmCreate or fmShareExclusive);
      try
        if fs.Size - fs.Position < SizeofFiles then
          SizeofFiles := fs.Size - fs.Position;
        sStream.CopyFrom(fs, SizeofFiles);
        ProgressBar.Position := Round((fs.Position / fs.Size) * 100);
      finally
        sStream.Free;
      end;
    end;
  finally
    fs.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  inStream: TStream;
  outStream: TStream;
  AInFileName, AOutFileName: string;
begin
  AInFileName := Edit2.Text;
  AOutFileName := Edit1.Text;
  inStream := TFileStream.Create(AInFileName, fmOpenRead);
  try
    outStream := TFileStream.Create(AOutFileName, fmCreate);
    try
      TNetEncoding.Base64.decode(inStream, outStream);
    finally
      outStream.Free;
    end;
  finally
    inStream.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    SplitFile(edit1.Text,10000000);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  Edit2.Text := Edit1.Text + '.hash'
end;

procedure TForm1.Edit1DblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.FileName <> '' then
    begin
      Edit1.Text := OpenDialog1.FileName;
    end;
  end;
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  Edit1.Text := StringReplace(Edit2.Text, '.hash', '',
    [rfReplaceAll, rfIgnoreCase]);
end;

procedure TForm1.Edit2DblClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.FileName <> '' then
    begin
      Edit2.Text := OpenDialog1.FileName;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := ExtractFilePath(Application.ExeName);
  Edit2.Text := ExtractFilePath(Application.ExeName);
end;

end.
