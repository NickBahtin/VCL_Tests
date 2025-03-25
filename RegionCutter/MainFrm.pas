unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    AboutMnu: TMenuItem;
    LoadBitmapMnu: TMenuItem;
    SaveCodeMnu: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    N7: TMenuItem;
    CreateCodeMnu: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure LoadBitmapMnuClick(Sender: TObject);
    procedure CreateCodeMnuClick(Sender: TObject);
    procedure AboutMnuClick(Sender: TObject);
    procedure SaveCodeMnuClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    function RegionFromPicture(pict: TPicture; backcolor: TColor): HRGN;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses AboutFrm;

{$R *.dfm}


function TMainForm.RegionFromPicture(pict: TPicture; backcolor: TColor):HRGN;
    var
    rgn, resRgn: HRGN;
    x, y, xFirst,z: Integer;
    s:string;
 begin
    resRgn := CreateRectRgn(0, 0, 0, 0); //Результирующий регион
    //Анализируем каждую скан-линию рисунка (по горизонтали)
    memo1.Lines.Clear;
    memo1.lines.add('obraz:TObrazArr=(');
    z:=0;

    for y := 0 to pict.Height-1 do
    begin
      x := 0;
      while x < pict.Width do
      begin
        if (pict.Bitmap.Canvas.Pixels[x, y] <> backcolor) then
        begin
          xFirst := x;
          Inc(x);
          //Определим часть линии, окрашенной не цветом фона
          while (x < pict.Width) and
          (pict.Bitmap.Canvas.Pixels[x, y] <> backcolor) do Inc(x);
          //Создаем регион для части скан-линии и добавляем его
          //к результурующему региону
          memo1.lines.add(Format('(%d,%d,%d,%d),',[xFirst, y, x-1, y+1]));
          inc(z);
          rgn := CreateRectRgn(xFirst, y, x-1, y+1);
          CombineRgn(resRgn, resRgn, rgn, RGN_OR);
          DeleteObject(rgn);
        end;
        Inc(x);
      end;
    end;
    RegionFromPicture := resRgn;
    s:=memo1.Lines[memo1.Lines.Count-1];
    //удаляем последнюю запятую
    delete(s,length(s),1);
    s:=s+');';
    memo1.Lines[memo1.Lines.Count-1]:=s;
    memo1.Lines.Insert(0,'const');
    memo1.Lines.Insert(1,Format('obrazHeight=%d;',[z]));
    memo1.Lines.Insert(2,'type');
    memo1.Lines.Insert(3,'TObrazArr = array[1..obrazHeight, 1..4] of integer;');
    memo1.Lines.Insert(4,'');
end;


procedure TMainForm.LoadBitmapMnuClick(Sender: TObject);
begin
   if OpenDialog1.Execute then
   if FileExists(OpenDialog1.FileName) then
   begin
     Image1.Picture.LoadFromFile(OpenDialog1.FileName);
     SaveCodeMnu.Enabled:=True;
     CreateCodeMnu.Enabled:=True;
     CreateCodeMnuClick(nil);//создаем код
   end;
end;

procedure TMainForm.CreateCodeMnuClick(Sender: TObject);
begin
  RegionFromPicture(Image1.Picture,$ffffff);
end;

procedure TMainForm.AboutMnuClick(Sender: TObject);
begin
   AboutForm.ShowModal
end;

procedure TMainForm.SaveCodeMnuClick(Sender: TObject);
begin
  CreateCodeMnuClick(nil);//создаем код
  SaveDialog1.FileName:=ChangeFileExt(OpenDialog1.FileName,'.txt');
  if SaveDialog1.Execute then
     Memo1.Lines.SaveToFile(SaveDialog1.FileName);

end;

procedure TMainForm.N6Click(Sender: TObject);
begin
  Close;
end;

end.
