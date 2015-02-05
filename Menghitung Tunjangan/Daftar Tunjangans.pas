// Minggu Depan harus ada Algoritma dan Program dan PrintScreen
// Di Gaji total sudah ada tunjangan anak
// PPN ini di ubah menjadi fungsi supoaya memenuhi 4 fungsi 1 prosedur

program Daftar_Tunjangan;
{I.S : user memasukkan array NIP, Nama, Golongan, Status, Jumlah Anak}
{F.S : Menampilkan daftar gaji total pegawai}
uses crt;
const
     Maks_Peg = 50;
Type
     Larik1 = array[1..Maks_Peg] of string;
     Larik2 = array[1..Maks_Peg] of integer;
     Larik3 = array[1..Maks_Peg] of real;
var
     NIP, Nama, Status : Larik1;
     Gol, JumAnak      : Larik2;
     PPN, Gatot        : Larik3;

Function GajiPokok(Gol:integer):integer;
{I.S : Golongan sudah terdefinisi}
{F.S : Menghasilkan fungsi gaji pokok}
begin
     case (Gol) of
          1 : GajiPokok := 125000;
          2 : GajiPokok := 135000;
          3 : GajiPokok := 150000;
          4 : GajiPokok := 175000;
     end; // End Case
end; //End Function

Function Tunjangan(Gol,Gapok:integer):real;
{I.S : Golongan dan Gaji Pokok sudah terdefinisi}
{F.S : Menghasilkan fungsi tunjangan}
begin
     case (Gol) of
          1 : Tunjangan := 0.1*Gapok;
          2 : Tunjangan := 0.125*Gapok;
          3 : Tunjangan := 0.15*Gapok;
          4 : Tunjangan := 0.20*Gapok;
     end; // End Case
end; //End Function

Procedure IsiData(var NIP,Nama,Status:Larik1;var Gol,JumAnak : Larik2);
{I.S : User Memasukkan array NIP, Nama, Golongan, Status, Jumlah Anak}
{F.S : Menampilkan Gaji Total Pegawai}
var
   i,Gapok : integer;
begin
    gotoxy(28,1);
    write('Daftar Gaji Total Pegawai');
    gotoxy(1,2);
    write('--------------------------------------------------------------------------------');
    gotoxy(1,3);
    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
    gotoxy(1,4);
    write('--------------------------------------------------------------------------------');

    // Memasukkan Data Pertama
    i := 1;
    gotoxy(1,i+4);
    write('|         |          |       |          |      | Rp.          | Rp.            |');
    gotoxy(3,i+4); readln(NIP[i]);
    while(NIP[i]<>'stop') do
    begin
        gotoxy(13,i+4); readln(Nama[i]);
        gotoxy(25,i+4); readln(Gol[i]);
        gotoxy(34,i+4); readln(Status[i]);
        if(Status[i] = 'M') then
        begin
              gotoxy(43,i+4); readln(JumAnak[i])
        end
        else
        begin
              gotoxy(43,i+4); write('-');
        end;

        // Menghitung Gaji Total dan PPN
        Gapok    := GajiPokok(Gol[i]);
        Gatot[i] := Gapok + Tunjangan(Gol[i],Gapok);
        PPN[i]   := 0.1 * Gatot[i];
        Gatot[i] := Gatot[i] - PPN[i];

        // Menampilkan PPN dan Gaji Total
        gotoxy(54,i+4); write(PPN[i]:0:1);
        gotoxy(69,i+4); write(Gatot[i]:0:1);

        // Memasukkan data Berikutnya
        i := i+1;
        gotoxy(1,i+4);
         write('|         |          |       |          |      | Rp.          | Rp.            |');
        gotoxy(3,i+4); readln(NIP[i]);
     end; //End While
     gotoxy(1,i+4);
     write('--------------------------------------------------------------------------------');

end;  //End Procedure

begin
      IsiData(NIP,Nama,Status,Gol,JumAnak);
      readln;
end.
