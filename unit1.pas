unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm_Main }

  TForm_Main = class(TForm)
    Button1: TButton;
    Button_przeciw: TButton;
    Button_za: TButton;
    Button_Info: TButton;
    Button_Lista: TButton;
    Button_Oblicz: TButton;
    Button_Koniec: TButton;
    CheckGroup_Opcje: TCheckGroup;
    Edit_przeciw: TEdit;
    Edit_za: TEdit;
    Edit_Wybrano: TEdit;
    Edit_Liczba: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label_za: TLabel;
    Label_przeciw: TLabel;
    Label_ListBox: TLabel;
    ListBox_Cyfry: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button_InfoClick(Sender: TObject);
    procedure Button_KoniecClick(Sender: TObject);
    procedure Button_ListaClick(Sender: TObject);
    procedure Button_ObliczClick(Sender: TObject);
    procedure Button_przeciwClick(Sender: TObject);
    procedure Button_zaClick(Sender: TObject);
    procedure CheckGroup_OpcjeItemClick(Sender: TObject; Index: integer);
  private
    decyzja : string;
    liczba : real;
    i: integer;
    waga : integer;
    //function KwadratLiczby : real;
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
  komunikat:='Programista: Marek Górski. Wersja programu v 0.1.1';
  Application.MessageBox(Pchar(komunikat),'Autorzy',MB_OK);
end;

procedure TForm_Main.Button1Click(Sender: TObject);
begin
  ListBox_Cyfry.Clear;
end;

procedure TForm_Main.Button_ListaClick(Sender: TObject);
begin
  ListBox_Cyfry.Clear;
  ListBox_Cyfry.Items.Add ('Magiczna kula mówi:');
  if (waga>=0) then
  begin
     ListBox_Cyfry.Items.Add ('TAK');
     waga:=0;
  end
  else
  begin
    waga:=0;
    ListBox_Cyfry.Items.Add ('NIE');
  end;

end;

procedure TForm_Main.Button_ObliczClick(Sender: TObject);
var
  komunikat : string;
  //liczba2   : real;
begin
  try
    decyzja:=Edit_Liczba.Text;
  except
    komunikat:='Nieobsługiwany wyjątek xD: '+Edit_Liczba.Text;
    Application.MessageBox(Pchar(komunikat),'Błąd',MB_OK);
    Exit;
  end;
  Listbox_Cyfry.Clear;
  Edit_Liczba.Clear;
  Listbox_Cyfry.Items.Add('Problem: ' + decyzja);

end;

procedure TForm_Main.Button_przeciwClick(Sender: TObject);
var
  komunikat : string;

begin
  if (ListBox_Cyfry.Items.Text='') then
  begin
    komunikat:='Najpierw dodaj problem do rozwiązania';
    Application.MessageBox(Pchar(komunikat),'Błąd',MB_OK);
  end
  else
  begin
    Listbox_Cyfry.Items.Add('Przeciw: ' + Edit_przeciw.Text + ' //waga ' + IntToStr(i));
    Edit_przeciw.Text:='';
    waga := waga - i;
  end;
end;

procedure TForm_Main.Button_zaClick(Sender: TObject);
var
  komunikat : string;
  //s : string;
begin
  //s:='';
  if (ListBox_Cyfry.Items.Text='') then
  begin
    komunikat:='Najpierw dodaj problem do rozwiązania';
    Application.MessageBox(Pchar(komunikat),'Błąd',MB_OK);
  end
  else
  begin
    Listbox_Cyfry.Items.Add('Za: ' + Edit_za.Text + ' //waga ' + IntToStr(i));
    waga := waga + i;
    Edit_za.Text:='';
  end;
end;

procedure TForm_Main.CheckGroup_OpcjeItemClick(Sender: TObject; Index: integer);
var
  s : string;
begin
  s:='';
  i:=0;
  waga:=0;
  if CheckGroup_Opcje.Checked[0] then i:=i+1;
  if CheckGroup_Opcje.Checked[1] then i:=i+2;
  if CheckGroup_Opcje.Checked[2] then i:=i+3;
  s:=IntToStr(i);
  Edit_Wybrano.Text:='Waga problemu: '+ s;
end;
{
function TForm_Main.KwadratLiczby : real;
begin
  KwadratLiczby:=liczba*liczba;
end;
}
end.

