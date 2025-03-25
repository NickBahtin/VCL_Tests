unit uTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    DocktoForm: Boolean;
    OldX,OldY,F1X,F1Y:integer;
    CanMove, CanMoveX, CanMoveY: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
const
     obrazHeight=190;
type
   TObrazArr = array[1..obrazHeight, 1..4] of integer;
var
     obraz:TObrazArr=(
     (23,0,177,1),
     (22,1,178,2),
     (21,2,179,3),
     (20,3,180,4),
     (18,4,181,5),
     (17,5,182,6),
     (16,6,183,7),
     (15,7,184,8),
     (14,8,184,9),
     (13,9,185,10),
     (12,10,186,11),
     (11,11,187,12),
     (10,12,188,13),
     (9,13,189,14),
     (8,14,190,15),
     (7,15,191,16),
     (6,16,191,17),
     (5,17,192,18),
     (5,18,192,19),
     (5,19,192,20),
     (5,20,192,21),
     (5,21,192,22),
     (5,22,192,23),
     (5,23,192,24),
     (5,24,193,25),
     (5,25,193,26),
     (5,26,193,27),
     (5,27,193,28),
     (5,28,193,29),
     (5,29,193,30),
     (5,30,193,31),
     (5,31,193,32),
     (5,32,193,33),
     (5,33,193,34),
     (5,34,193,35),
     (5,35,193,36),
     (5,36,193,37),
     (5,37,193,38),
     (5,38,193,39),
     (5,39,193,40),
     (4,40,194,41),
     (4,41,194,42),
     (4,42,194,43),
     (4,43,194,44),
     (4,44,194,45),
     (4,45,194,46),
     (4,46,194,47),
     (4,47,194,48),
     (4,48,194,49),
     (4,49,194,50),
     (4,50,194,51),
     (4,51,194,52),
     (4,52,194,53),
     (4,53,194,54),
     (4,54,194,55),
     (4,55,194,56),
     (4,56,195,57),
     (4,57,195,58),
     (4,58,195,59),
     (4,59,195,60),
     (4,60,195,61),
     (4,61,195,62),
     (4,62,195,63),
     (4,63,195,64),
     (4,64,195,65),
     (3,65,195,66),
     (3,66,195,67),
     (3,67,195,68),
     (3,68,195,69),
     (3,69,195,70),
     (3,70,195,71),
     (3,71,196,72),
     (3,72,196,73),
     (3,73,196,74),
     (3,74,196,75),
     (3,75,196,76),
     (3,76,196,77),
     (3,77,196,78),
     (3,78,196,79),
     (3,79,196,80),
     (3,80,196,81),
     (3,81,196,82),
     (3,82,196,83),
     (3,83,196,84),
     (3,84,196,85),
     (3,85,196,86),
     (3,86,196,87),
     (3,87,197,88),
     (3,88,197,89),
     (3,89,197,90),
     (3,90,197,91),
     (2,91,197,92),
     (2,92,197,93),
     (2,93,197,94),
     (2,94,197,95),
     (2,95,197,96),
     (2,96,197,97),
     (2,97,197,98),
     (2,98,197,99),
     (2,99,197,100),
     (2,100,197,101),
     (2,101,197,102),
     (2,102,197,103),
     (2,103,198,104),
     (2,104,198,105),
     (2,105,198,106),
     (2,106,198,107),
     (2,107,198,108),
     (2,108,198,109),
     (2,109,198,110),
     (2,110,198,111),
     (2,111,198,112),
     (2,112,198,113),
     (2,113,198,114),
     (2,114,198,115),
     (2,115,198,116),
     (1,116,198,117),
     (1,117,198,118),
     (1,118,198,119),
     (1,119,199,120),
     (1,120,199,121),
     (1,121,199,122),
     (1,122,199,123),
     (1,123,199,124),
     (1,124,199,125),
     (1,125,199,126),
     (1,126,199,127),
     (1,127,199,128),
     (1,128,199,129),
     (1,129,199,130),
     (1,130,199,131),
     (1,131,199,132),
     (1,132,199,133),
     (1,133,199,134),
     (1,134,199,135),
     (1,135,200,136),
     (1,136,200,137),
     (1,137,200,138),
     (1,138,200,139),
     (1,139,200,140),
     (1,140,200,141),
     (0,141,200,142),
     (0,142,200,143),
     (0,143,200,144),
     (0,144,200,145),
     (0,145,200,146),
     (0,146,200,147),
     (0,147,200,148),
     (0,148,200,149),
     (0,149,200,150),
     (0,150,200,151),
     (0,151,201,152),
     (0,152,201,153),
     (0,153,201,154),
     (0,154,201,155),
     (0,155,201,156),
     (0,156,201,157),
     (0,157,201,158),
     (0,158,201,159),
     (0,159,201,160),
     (0,160,201,161),
     (0,161,201,162),
     (0,162,201,163),
     (0,163,201,164),
     (0,164,201,165),
     (0,165,201,166),
     (0,166,201,167),
     (0,167,201,168),
     (0,168,201,169),
     (1,169,200,170),
     (1,170,200,171),
     (2,171,199,172),
     (2,172,199,173),
     (3,173,198,174),
     (3,174,198,175),
     (3,175,197,176),
     (4,176,196,177),
     (4,177,196,178),
     (5,178,195,179),
     (5,179,195,180),
     (6,180,194,181),
     (6,181,194,182),
     (7,182,193,183),
     (7,183,193,184),
     (8,184,192,185),
     (8,185,192,186),
     (9,186,191,187),
     (9,187,191,188),
     (10,188,190,189),
     (10,189,188,190)
);
function RegionFromObraz:HRGN;
    var
    rgn, resRgn: HRGN;
    y: Integer;
 begin
    resRgn := CreateRectRgn(0, 0, 0, 0); //Результирующий регион
    //Анализируем каждую скан-линию рисунка (по горизонтали)
    for y := 1 to obrazHeight do
    begin
          rgn := CreateRectRgn(obraz[y,1],obraz[y,2],obraz[y,3],obraz[y,4]);
          CombineRgn(resRgn, resRgn, rgn, RGN_OR);
          DeleteObject(rgn);
    end;
    RegionFromObraz := resRgn;
end;



procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetWindowRgn(Handle, RegionFromObraz, True);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then Screen.Cursor:=crHandPoint;
  CanMoveX := true; CanMoveY := true;  CanMove := true;
  OldX := X; OldY := Y;
  if DocktoForm then
   begin
     F1X := Left;
     F1Y := Top;
   end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (CanMove) then
  begin
    if CanMoveX then self.Left := self.Left + (X - OldX);
    if CanMoveY then self.Top := self.Top + (Y - OldY);
//    if (self.Top < WorkArea.Top + cDockRadius) and (self.Top > WorkArea.Top-cDockRadius) then
//    begin
//      self.Top := WorkArea.Top;
//      CanMoveY:=((Y-OldY > cDockRadius) or (Y-OldY < -cDockRadius));
//    end;
//    //This section latches to the left side
//    if (self.Left < WorkArea.Left+cDockRadius) and (self.Left > WorkArea.Left-cDockRadius) then
//    begin
//      self.Left := WorkArea.Left;
//      CanMoveX :=((X-OldX > cDockRadius) or (X-OldX < -cDockRadius));
//    end;
//    //This section latches to the right side
//    if (self.Left > WorkArea.Right-self.Width-cDockRadius) and (self.Left < WorkArea.Right-self.Width+cDockRadius) then
//    begin
//      self.Left := WorkArea.Right-self.Width;
//      CanMoveX :=((X-OldX > cDockRadius) or (X-OldX < -cDockRadius));
//    end;
//    // Тащим за собой и остальные формы
//    ConnectForm.Left:=Self.Left+Width;
//    ConnectForm.Top:=Self.Top;
//    KM51.MyForm.Left:=Self.Left+Width;
//    KM51.MyForm.Top:=Self.Top;
  end;

end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor:=crDefault;
  CanMove:=False;
end;

end.
