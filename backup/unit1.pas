unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm_Main }

  TForm_Main = class(TForm)
    Button_Info: TButton;
    Button_Lista: TButton;
    Button_Oblicz: TButton;
    Button_Koniec: TButton;
    CheckGroup_Opcje: TCheckGroup;
    Edit_Wybrano: TEdit;
    Edit_Liczba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label_ListBox: TLabel;
    ListBox_Cyfry: TListBox;
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
    procedure Button_ListaClick(Sender: TObject);
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

procedure TForm_Main.Button_InfoClick(Sender: TObject);
var
  komunikat : string;
begin
  komunikat:='Autor: Marek, wersja programu: v.01
  Application.MessageBox(Pchar(komunikat),'Komunikat, hehe',MB_OK);
end;

procedure TForm_Main.Button_ListaClick(Sender: TObject);
const cCyfry : array [1..5] of string = ('jeden', 'dwa', 'trzy', 'cztery', 'pięć');
var
  i : integer;
begin
  ListBox_Cyfry.Clear;

  for i:=1 to 5 do
      ListBox_Cyfry.Items.Add(IntToStr(i)+' - '+cCyfry[i]);
  ListBox_Cyfry.Items.Add('Koniec listy');

end;

procedure TForm_Main.Button_ObliczClick(Sender: TObject);
var
  komunikat : string;
  liczba2   : real;
begin
  try
    liczba:=StrToFloat(Edit_Liczba.Text);
  except
    komunikat:='Błąd konwersji liczby z łańcucha: '+Edit_Liczba.Text;
    Application.MessageBox(Pchar(komunikat),'Błąd',MB_OK);
    Exit;
  end;

  liczba2:=KwadratLiczby;

  Listbox_Cyfry.Clear;
  Listbox_Cyfry.Items.Add(FloatToStr (liczba)+' do kwadratu rowna sie: '+FloatToStr(liczba2));

end;

procedure TForm_Main.CheckGroup_OpcjeItemClick(Sender: TObject; Index: integer);
var
  i : integer;
  s : string;
begin
  s:=' ';
  for i:=0 to 2 do
  if CheckGroup_Opcje.Checked[i] then s:=s+' '+IntToStr(i);
  Edit_Wybrano.Text:='Opcje: '+s;
end;

function TForm_Main.KwadratLiczby : real;
begin
  KwadratLiczby:=liczba*liczba;
end;

end.

