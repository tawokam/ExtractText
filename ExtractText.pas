unit ExtractText;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Ocr;//

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

type
TOCRInitialize = procedure(var OCR: TOCR); stdcall;
TOCRSetDataPath = procedure(var OCR: TOCR; DataPath: PChar); stdcall;
TOCRSetPictureFileName = procedure(var OCR: TOCR; FileName: PChar); stdcall;
TOCRActivate = procedure(var OCR: TOCR); stdcall;
TOCRGetText = function(var OCR: TOCR): PChar; stdcall;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function ExtractAndShowTextFromImage(const ImagePath: string) : String;
VAR Ocr           : TOCR;
    ExtractedText : String;
BEGIN
  Ocr := TOCR.Create(nil);
  TRY
    Ocr.DataPath        := ExtractFilePath(ParamStr(0)) + 'tessdata';
    Ocr.PictureFileName := ImagePath;
    Ocr.Active          := True;
    ExtractedText       := Ocr.Text;
  FINALLY
    Ocr.Free;
  END;
  Result := ExtractedText;
END;

procedure TForm1.Button1Click(Sender: TObject);
VAR Text : String;
begin
    Text := ExtractAndShowTextFromImage('C:\Program Files (x86)\Luxand\FaceSDK 8.2.0\demo\IMG3.jpg');
    ShowMessage(Text);
end;

end.

















end;

procedure TForm1.Button1Click(Sender: TObject);
VAR Text : String;
begin
    Text := ExtractAndShowTextFromImage('C:\Program Files (x86)\Luxand\FaceSDK 8.2.0\demo\IMG3.jpg');
    ShowMessage(Text);
end;

end.
