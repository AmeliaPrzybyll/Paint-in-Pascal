unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    PaintBox1: TPaintBox;
    RadioGroup1: TRadioGroup;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    RadioGroup2: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    ColorBox1: TColorBox;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    procedure Rysuj(Obiekt: TCanvas);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Poczatek: TPoint;
  Koniec: TPoint;
  Rozpoczeto: Boolean = false;
  Rysownica: TBitmap;
  Kolor: TColor;
  Czcionka: TFont;

implementation

{$R *.dfm}

procedure TForm1.Rysuj(Obiekt: TCanvas);
begin
  Obiekt.Pen.Width := TrackBar1.Position;
  Obiekt.Pen.Color := Kolor;
  Obiekt.Pen.Style := psSolid;
  Obiekt.Font := Czcionka;
  Obiekt.Brush.Bitmap := nil;
  Obiekt.Brush.Color := ColorBox1.Selected;

  case RadioGroup2.ItemIndex of
    0: Obiekt.Brush.Style := bsSolid;
    1: Obiekt.Brush.Style := bsClear;
    2:
    begin
      Obiekt.Brush.Style := bsSolid;
      Obiekt.Brush.Bitmap := Image1.Picture.Bitmap;
    end;
    3: Obiekt.Brush.Style := bsCross;
  end;

  case RadioGroup1.ItemIndex of
    0: // Linia
    begin
      Obiekt.MoveTo(Poczatek.X, Poczatek.Y);
      Obiekt.LineTo(Koniec.X, Koniec.Y);
    end;
    1: // Prostok¹t
      Obiekt.Rectangle(Poczatek.X, Poczatek.Y, Koniec.X, Koniec.Y);
    2: // Elipsa
      Obiekt.Ellipse(Poczatek.X, Poczatek.Y, Koniec.X, Koniec.Y);
    3: // Zaokr¹glony prostok¹t
      Obiekt.RoundRect(Poczatek.X, Poczatek.Y, Koniec.X, Koniec.Y, 8 * Obiekt.Pen.Width, 8 * Obiekt.Pen.Width);
    4: // Tekst
      Obiekt.TextOut(Koniec.X, Koniec.Y, Edit1.Text);
    5: // Obrazek
      Obiekt.StretchDraw(Rect(Poczatek.X, Poczatek.Y, Koniec.X, Koniec.Y), Image1.Picture.Bitmap);
    6: // Wolna linia
    begin
      Rysownica.Canvas.Pen.Style:=psSolid;
      Rysownica.Canvas.MoveTo(Poczatek.X,Poczatek.Y);
      Rysownica.Canvas.LineTo(Koniec.X,Koniec.Y);

      Poczatek.X:= Koniec.X;
      Poczatek.Y:=Koniec.Y;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    Kolor := ColorDialog1.Color;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    Czcionka.Assign(FontDialog1.Font);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    try
      Image1.Picture.Bitmap.LoadFromFile(OpenDialog1.FileName);
    except
      on E: Exception do
        ShowMessage('Nie mo¿na otworzyæ pliku: ' + E.Message);
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    try
      Rysownica.SaveToFile(SaveDialog1.FileName);
      ShowMessage('Obraz zosta³ zapisany');
    except
      on E: Exception do
        ShowMessage('Nie mo¿na zapisaæ obrazu: ' + E.Message);
    end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Rozpoczeto:=false;
Paintbox1.Repaint;
  if OpenDialog1.Execute then
  begin
    try
      Rysownica.LoadFromFile(OpenDialog1.FileName);
      PaintBox1.Repaint;
    except
      on E: Exception do
        ShowMessage('Nie mo¿na otworzyæ pliku: ' + E.Message);
    end;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Rozpoczeto := false;
  Rysownica.Canvas.Brush.Style := bsSolid;
  Rysownica.Canvas.Brush.Color := clWhite;

  // Poprawione wywo³anie FillRect
  Rysownica.Canvas.FillRect(Rect(0, 0, Rysownica.Width, Rysownica.Height));

  PaintBox1.Repaint;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Rysownica.Free;
  Czcionka.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Rysownica := TBitmap.Create;
  PaintBox1.Height := 1024;
  PaintBox1.Width := 768;
  Rysownica.SetSize(PaintBox1.Width, PaintBox1.Height);
  Czcionka := TFont.Create;
  Kolor := clBlack; // Ustawienie domyœlnego koloru
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Rozpoczeto := true;
  Poczatek := Point(X, Y);
  Koniec := Poczatek;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Rozpoczeto then
  begin
    Koniec := Point(X, Y);
    PaintBox1.Repaint;
  end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Rozpoczeto=true then
  begin
    Koniec := Point(X, Y);
    Rysuj(Rysownica.Canvas);
    Rozpoczeto := false;

  end else
  begin
    PaintBox1.Repaint;
  end;
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  PaintBox1.Canvas.Draw(0, 0, Rysownica);
  if Rozpoczeto then
    Rysuj(PaintBox1.Canvas);
end;

end.

