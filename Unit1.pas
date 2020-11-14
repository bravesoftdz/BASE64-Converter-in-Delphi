unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.NetEncoding;

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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  inStream: TStream;
  outStream: TStream;
  AInFileName, AOutFileName:string;
begin
  AInFileName := edit1.Text;
  AOutFileName := edit2.Text;
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

procedure TForm1.Button2Click(Sender: TObject);
var
  inStream: TStream;
  outStream: TStream;
  AInFileName, AOutFileName:string;
begin
  AInFileName := edit2.Text;
  AOutFileName := edit1.Text;
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  edit2.Text := edit1.Text + '.hash'
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
  edit1.Text := StringReplace(edit2.Text, '.hash', '',
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
  edit1.Text := ExtractFilePath(Application.ExeName);
  edit2.Text := ExtractFilePath(Application.ExeName);
end;

end.
