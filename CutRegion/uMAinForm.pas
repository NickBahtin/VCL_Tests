unit uMAinForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;
const
  obrazHeight=320;
type
TObrazArr = array[1..obrazHeight, 1..4] of integer;
const
obraz:TObrazArr=(
(74,3,88,4),
(264,3,279,4),
(65,4,96,5),
(256,4,286,5),
(61,5,101,6),
(251,5,291,6),
(57,6,105,7),
(247,6,295,7),
(54,7,109,8),
(243,7,298,8),
(51,8,112,9),
(240,8,301,9),
(48,9,115,10),
(237,9,304,10),
(46,10,118,11),
(234,10,306,11),
(44,11,120,12),
(232,11,308,12),
(42,12,122,13),
(230,12,310,13),
(40,13,124,14),
(228,13,312,14),
(38,14,126,15),
(226,14,314,15),
(37,15,128,16),
(224,15,316,16),
(35,16,130,17),
(222,16,317,17),
(33,17,131,18),
(221,17,319,18),
(32,18,133,19),
(219,18,320,19),
(31,19,135,20),
(217,19,321,20),
(29,20,136,21),
(216,20,323,21),
(28,21,138,22),
(214,21,324,22),
(27,22,139,23),
(213,22,325,23),
(26,23,140,24),
(212,23,326,24),
(25,24,142,25),
(210,24,327,25),
(24,25,143,26),
(209,25,328,26),
(23,26,144,27),
(208,26,330,27),
(22,27,145,28),
(207,27,330,28),
(21,28,147,29),
(206,28,331,29),
(20,29,148,30),
(204,29,332,30),
(19,30,149,31),
(203,30,333,31),
(18,31,150,32),
(202,31,334,32),
(17,32,151,33),
(201,32,335,33),
(16,33,152,34),
(200,33,336,34),
(16,34,153,35),
(199,34,336,35),
(15,35,154,36),
(198,35,337,36),
(14,36,155,37),
(197,36,338,37),
(14,37,156,38),
(196,37,338,38),
(13,38,157,39),
(195,38,339,39),
(12,39,158,40),
(194,39,340,40),
(12,40,159,41),
(193,40,340,41),
(11,41,159,42),
(193,41,341,42),
(11,42,160,43),
(192,42,341,43),
(10,43,161,44),
(191,43,342,44),
(10,44,162,45),
(190,44,342,45),
(9,45,163,46),
(189,45,343,46),
(9,46,163,47),
(189,46,344,47),
(8,47,164,48),
(188,47,344,48),
(8,48,165,49),
(187,48,344,49),
(7,49,166,50),
(186,49,345,50),
(7,50,166,51),
(186,50,345,51),
(7,51,167,52),
(185,51,346,52),
(6,52,168,53),
(184,52,346,53),
(6,53,168,54),
(184,53,346,54),
(5,54,169,55),
(183,54,347,55),
(5,55,170,56),
(182,55,347,56),
(5,56,170,57),
(182,56,347,57),
(5,57,171,58),
(181,57,348,58),
(4,58,172,59),
(180,58,348,59),
(4,59,172,60),
(180,59,348,60),
(4,60,173,61),
(179,60,348,61),
(4,61,173,62),
(179,61,349,62),
(3,62,174,63),
(178,62,349,63),
(3,63,175,64),
(177,63,349,64),
(3,64,175,65),
(177,64,349,65),
(3,65,349,66),
(3,66,349,67),
(2,67,350,68),
(2,68,350,69),
(2,69,350,70),
(2,70,350,71),
(2,71,350,72),
(2,72,350,73),
(2,73,350,74),
(2,74,350,75),
(2,75,350,76),
(2,76,350,77),
(2,77,350,78),
(2,78,350,79),
(2,79,350,80),
(2,80,350,81),
(2,81,350,82),
(2,82,350,83),
(2,83,350,84),
(2,84,350,85),
(2,85,350,86),
(2,86,350,87),
(2,87,350,88),
(2,88,350,89),
(2,89,350,90),
(2,90,350,91),
(2,91,350,92),
(3,92,350,93),
(3,93,349,94),
(3,94,349,95),
(3,95,349,96),
(3,96,349,97),
(3,97,349,98),
(4,98,348,99),
(4,99,348,100),
(4,100,348,101),
(4,101,348,102),
(4,102,348,103),
(5,103,347,104),
(5,104,347,105),
(5,105,347,106),
(6,106,347,107),
(6,107,346,108),
(6,108,346,109),
(6,109,346,110),
(7,110,345,111),
(7,111,345,112),
(7,112,345,113),
(8,113,344,114),
(8,114,344,115),
(8,115,344,116),
(9,116,343,117),
(9,117,343,118),
(10,118,343,119),
(10,119,342,120),
(10,120,342,121),
(11,121,341,122),
(11,122,341,123),
(12,123,341,124),
(12,124,340,125),
(12,125,340,126),
(13,126,339,127),
(13,127,339,128),
(14,128,338,129),
(14,129,338,130),
(15,130,337,131),
(15,131,337,132),
(16,132,336,133),
(16,133,336,134),
(17,134,335,135),
(17,135,335,136),
(18,136,334,137),
(18,137,334,138),
(19,138,333,139),
(19,139,333,140),
(20,140,332,141),
(20,141,332,142),
(21,142,331,143),
(22,143,330,144),
(22,144,330,145),
(23,145,329,146),
(23,146,329,147),
(24,147,328,148),
(25,148,327,149),
(25,149,327,150),
(26,150,326,151),
(27,151,325,152),
(27,152,325,153),
(28,153,324,154),
(29,154,323,155),
(29,155,323,156),
(30,156,322,157),
(31,157,321,158),
(32,158,320,159),
(32,159,320,160),
(33,160,319,161),
(34,161,318,162),
(35,162,318,163),
(35,163,317,164),
(36,164,316,165),
(37,165,315,166),
(37,166,315,167),
(38,167,314,168),
(39,168,313,169),
(40,169,312,170),
(41,170,311,171),
(42,171,310,172),
(43,172,309,173),
(43,173,309,174),
(44,174,308,175),
(45,175,307,176),
(46,176,306,177),
(47,177,305,178),
(48,178,304,179),
(49,179,303,180),
(50,180,302,181),
(51,181,301,182),
(52,182,300,183),
(53,183,299,184),
(54,184,298,185),
(55,185,297,186),
(56,186,296,187),
(57,187,295,188),
(58,188,294,189),
(59,189,293,190),
(60,190,292,191),
(61,191,291,192),
(62,192,290,193),
(63,193,289,194),
(64,194,288,195),
(65,195,287,196),
(66,196,286,197),
(68,197,285,198),
(69,198,283,199),
(70,199,282,200),
(71,200,281,201),
(72,201,280,202),
(73,202,279,203),
(75,203,278,204),
(76,204,276,205),
(77,205,275,206),
(78,206,274,207),
(80,207,272,208),
(81,208,271,209),
(82,209,270,210),
(84,210,269,211),
(85,211,267,212),
(86,212,266,213),
(88,213,265,214),
(89,214,263,215),
(90,215,262,216),
(92,216,260,217),
(93,217,259,218),
(95,218,257,219),
(96,219,256,220),
(98,220,255,221),
(99,221,253,222),
(100,222,252,223),
(102,223,250,224),
(104,224,249,225),
(105,225,247,226),
(107,226,245,227),
(108,227,244,228),
(110,228,242,229),
(111,229,241,230),
(113,230,239,231),
(115,231,237,232),
(116,232,236,233),
(118,233,234,234),
(120,234,232,235),
(122,235,230,236),
(123,236,229,237),
(125,237,227,238),
(127,238,225,239),
(129,239,223,240),
(131,240,221,241),
(133,241,219,242),
(134,242,218,243),
(136,243,216,244),
(138,244,214,245),
(140,245,212,246),
(142,246,210,247),
(144,247,208,248),
(146,248,206,249),
(149,249,203,250),
(151,250,201,251),
(153,251,199,252),
(155,252,197,253),
(157,253,195,254),
(160,254,192,255),
(162,255,190,256),
(164,256,188,257),
(167,257,185,258),
(169,258,183,259),
(172,259,180,260),
(175,260,177,261));

type
  TMainForm = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    OldX,OldY,F1X,F1Y:integer;
    CanMove, CanMoveX, CanMoveY: Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function RegionFromObraz:HRGN;
    var
    rgn, resRgn: HRGN;
    y: Integer;
 begin
    resRgn := CreateRectRgn(0, 0, 0, 0); //�������������� ������
    //����������� ������ ����-����� ������� (�� �����������)
    for y := 1 to obrazHeight do
    begin
          rgn := CreateRectRgn(obraz[y,1],obraz[y,2],obraz[y,3],obraz[y,4]);
          CombineRgn(resRgn, resRgn, rgn, RGN_OR);
          DeleteObject(rgn);
    end;
    RegionFromObraz := resRgn;
end;




procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetWindowRgn(Handle, RegionFromObraz, True);
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor:=crHandPoint;
  if Button = mbLeft then Screen.Cursor:=crHandPoint;
  CanMoveX := true; CanMoveY := true;  CanMove := true;
  OldX := X; OldY := Y;
end;

procedure TMainForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (CanMove) then
  begin
    if CanMoveX then self.Left := self.Left + (X - OldX);
    if CanMoveY then self.Top := self.Top + (Y - OldY);
  end;  

end;

procedure TMainForm.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Screen.Cursor:=crDefault;
  CanMove:=False;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if MessageDlg('�� ������������� ������ ��������� ������?',
       mtConfirmation,[mbOK, mbCancel],0)<>mrOk
    then
       CanClose:=False;

end;

end.
