unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm_Main }

  TForm_Main = class(TForm)
    Button_Oblicz: TButton;
    Button_Koniec: TButton;
    CheckGroup_Opcje: TCheckGroup;
    Edit_Wybrano: TEdit;
    Edit_Liczba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox_Cyfry: TListBox;
    procedure Button_KoniecClick(Sender: TObject);
    procedure Button_ObliczClick(Sender: TObject);
    procedure CheckGroup_OpcjeItemClick(Sender: TObject; Index: integer);
  private
    liczba : real;
    function KwadratLiczby : real;

  public

  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.lfm}

{ TForm_Main }

procedure TForm_Main.Button_KoniecClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Main.Button_ObliczClick(Sender: TObject);
var
  komunikat : string;
  liczba2   : real;
begin
  try
    liczba:=StrToFloat(Edit_Liczba.Text);
  except
    komunikat:='Blad konwersji liczby z lancucha: '+Edit_Liczba.Text;
    Application.MessageBox(Pchar(Komunikat),'Blad',MB_OK);
    Exit;
  end;

  liczba2:=KwadratLiczby;

  Listbox_Cyfry.Clear;
  Listbox_Cyfry.Items.Add(FloatToStr (liczba)+' do kwadratu rowna sie: '+FloatToStr(liczba2));

end;

procedure TForm_Main.CheckGroup_OpcjeItemClick(Sender: TObject; Index: integer);
begin

end;

function TForm_Main.KwadratLiczby : real;
begin
  KwadratLiczby:=liczba*liczba;
end;

end.

