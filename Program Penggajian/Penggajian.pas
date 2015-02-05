program Penggajian;
{I.S : User memilih menu pilihan}
{F.S : Menampilkan hasil dari menu pilihan}
uses crt;
const
     Max_Pegawai = 50;
type
data = record
             NIP,Nama,Status : string;
             Gol,JumAnak : integer;
             PPN,Gatot : real;
       end;

       data_gaji = array[1..Max_Pegawai] of data;
var
       data_array : data_gaji;
       Pilihan,i,n : integer;
       kondisi : string;

// ---------------------------FUNGSI GAJI POKOK---------------------------------
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

// ---------------------------FUNGSI TUNJANGAN----------------------------------
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

// -------------------------PROCEDURE MENU PILIHAN------------------------------
procedure MenuPilihan;
{I.S : User Memilih salah satu menu}
{F.S : Menampilkan tampilan pilihan yang di pilih oleh user}

begin
   clrscr;
   writeln('-----MENU PILIHAN-----');
   writeln;
   writeln('1. ISI DATA');
   writeln('2. CARI DATA BERDASARKAN NIP'); // Nomor Induk Pegawai (NIP)
   writeln('3. CARI DATA BERDASARKAN NAMA');
   writeln('4. CARI DATA BERDASARKAN JUMLAH GAJI'); // Berdasarkan Jumlah Gaji
   writeln('5. TAMPIL KESELURUHAN DATA YANG SUDAH TERURUT');
   writeln('0. KELUAR');
   writeln;
   write('Masukkan Pilihan : ');readln(Pilihan);
end; // End Procedure

// ---------------------------PROCEDURE ISI DATA--------------------------------
procedure IsiData(var data_array : data_gaji; var n : integer);
{I.S : User memasukkan array NIP, Nama, Golongan, Status, Jumlah Anak}
{F.S : Menampilkan Gaji Total Pegawai}
var
   i, Gapok : integer;
begin
    gotoxy(28,1);   write('Daftar Gaji Total Pegawai');
    gotoxy(1,2);    write('--------------------------------------------------------------------------------');
    gotoxy(1,3);    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
    gotoxy(1,4);    write('--------------------------------------------------------------------------------');

    // Memasukkan Data Pertama
    i := 1;
    repeat
    gotoxy(1,i+4);
    write('|         |          |       |          |      | Rp.          | Rp.            |');
        gotoxy(3,i+4); readln(data_array[i].NIP);
        kondisi := data_array[i].NIP;
        if(data_array[i].NIP <> 'stop')then
        begin
          gotoxy(13,i+4); readln(data_array[i].Nama);
          gotoxy(25,i+4); readln(data_array[i].Gol);
          gotoxy(34,i+4); readln(data_array[i].Status);
          if(data_array[i].Status = 'M') then
          begin
              gotoxy(43,i+4); readln(data_array[i].JumAnak)
          end
          else
          begin
              gotoxy(43,i+4); write('-');
          end;

          // Menghitung Gaji Total dan PPN
          Gapok    := GajiPokok(data_array[i].Gol);
          data_array[i].Gatot := Gapok + Tunjangan(data_array[i].Gol,Gapok);
          data_array[i].PPN   := 0.1 * data_array[i].Gatot;
          data_array[i].Gatot := data_array[i].Gatot - data_array[i].PPN;

          // Menampilkan PPN dan Gaji Total
          gotoxy(54,i+4); write(data_array[i].PPN:0:0);
          gotoxy(69,i+4); write(data_array[i].Gatot:0:0);

          // Memasukkan data Berikutnya
          i := i+1;
          n := i;
        end;
     until (kondisi = 'stop');

     write('--------------------------------------------------------------------------------');
     readln;

end;  //End Procedure

// ---------------------------PROCEDURE CARI NIP--------------------------------
procedure CariNIP(data_array : data_gaji; n : integer);
{I.S : User memasukkan NIP yang akan di cari}
{F.S : Menampilkan beberapa NIP yang dicari oleh user}
// Menggunakan metode Binary Search dengan Boolean
var
     i,k           : integer;
     CariNIP       : string;
     NIPKetemu     : boolean;

begin
     // Memasukkan nama yang akan dicari
     write('Masukkan NIP yang akan dicari : ');readln(CariNIP);

     // Inisialisasi awal nilai i
     i := 1;

     // Inisialisasi NIP awal ketemu
     NIPKetemu := false;

     // Proses Searching
     while((not NIPKetemu) and (i <= n)) do
     begin
        if(data_array[i].NIP = CariNIP)then
        begin
           NIPKetemu := true;
           k := i;
        end;
        i:=i+1;
     end; // End While

     if(NIPKetemu)then
     begin
               gotoxy(1,2+i);    write('--------------------------------------------------------------------------------');
               gotoxy(1,3+i);    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
               gotoxy(1,4+i);    write('--------------------------------------------------------------------------------');
               gotoxy(6,5+i);    writeln(data_array[k].NIP);
               gotoxy(16,5+i);   writeln(data_array[k].Nama);
               gotoxy(26,5+i);   writeln(data_array[k].Gol);
               gotoxy(35,5+i);   writeln(data_array[k].Status);
               gotoxy(44,5+i);   writeln(data_array[k].JumAnak);
               gotoxy(52,5+i);   writeln(data_array[k].PPN:0:0);
               gotoxy(68,5+i);   writeln(data_array[k].Gatot:0:0);
               gotoxy(1,6+i);    write('================================================================================');
     end
     else
         writeln('NIP ',CariNIP,' Tidak Ditemukan!!!');
     readln;

end; // End Procedure

// ------------------------PROCEDURE CARI DATA NAMA-----------------------------
procedure CariDataNama(data_array : data_gaji; n : integer);
{I.S : User memasukkan nama yang akan di cari}
{F.S : Menampilkan beberapa nama yang dicari oleh user}
// Menggunakan metode Binary Search dengan Boolean
var
     ia,ib,k,o,p,i : integer;
     CariNama      : string;
     NamaKetemu    : boolean;

begin
     // Memasukkan nama yang akan dicari
     write('Masukkan nama yang akan dicari : ');readln(CariNama);

     // Inisialisasi awal nilai indeks awal dan indeks akhir
     ia := 1;
     ib := n;
     o := 1;
     i := 1;

     // Inisialisasi nama awal ketemu
     NamaKetemu := false;

     // Proses Searching
     gotoxy(1,2);    write('--------------------------------------------------------------------------------');
     gotoxy(1,3);    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
     gotoxy(1,4+i);    write('--------------------------------------------------------------------------------');

     while(ia <= ib) do
     begin
        if(data_array[ia].Nama = CariNama)
        then
        begin
               gotoxy(1,5+i);    write('|         |          |       |          |      |              |                |');
               gotoxy(5,5+i);    writeln(data_array[ia].NIP);
               gotoxy(16,5+i);   writeln(data_array[ia].Nama);
               gotoxy(26,5+i);   writeln(data_array[ia].Gol);
               gotoxy(35,5+i);   writeln(data_array[ia].Status);
               gotoxy(44,5+i);   writeln(data_array[ia].JumAnak);
               gotoxy(54,5+i);   writeln(data_array[ia].PPN:0:0);
               gotoxy(68,5+i);   writeln(data_array[ia].Gatot:0:0);
               gotoxy(1,6+i);   write('================================================================================');
               NamaKetemu := true;
               i := i + 1;
        end;
        ia := ia + 1;
     end; // End While

     if(not NamaKetemu)then
     begin
        writeln('Nama ',CariNama,' Tidak Ditemukan!!!');
     end;
     readln;

end; // End Procedure

// ------------------------PROCEDURE CARI Gaji Total----------------------------
procedure CariGatot(data_array : data_gaji; n : integer);
var
     ia,ib,k,o,p,i : integer;
     Carigatot      : real;
     GatotKetemu    : boolean;

begin
     // Memasukkan nama yang akan dicari
     write('Masukkan nama yang akan dicari : ');readln(Carigatot);

     // Inisialisasi awal nilai indeks awal dan indeks akhir
     ia := 1;
     ib := n;
     o := 1;
     i := 1;

     // Inisialisasi nama awal ketemu
     GatotKetemu := false;

     // Proses Searching
     gotoxy(1,2);    write('--------------------------------------------------------------------------------');
     gotoxy(1,3);    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
     gotoxy(1,4+i);    write('--------------------------------------------------------------------------------');

     while(ia <= ib) do
     begin
        if(data_array[ia].Gatot = CariGatot)
        then
        begin
               gotoxy(1,5+i);    write('|         |          |       |          |      |              |                |');
               gotoxy(5,5+i);    writeln(data_array[ia].NIP);
               gotoxy(16,5+i);   writeln(data_array[ia].Nama);
               gotoxy(26,5+i);   writeln(data_array[ia].Gol);
               gotoxy(35,5+i);   writeln(data_array[ia].Status);
               gotoxy(44,5+i);   writeln(data_array[ia].JumAnak);
               gotoxy(54,5+i);   writeln(data_array[ia].PPN:0:0);
               gotoxy(68,5+i);   writeln(data_array[ia].Gatot:0:0);
               gotoxy(1,6+i);   write('================================================================================');
               GatotKetemu := true;
               i := i + 1;
        end;
        ia := ia + 1;
     end; // End While

     if(not GatotKetemu)then
     begin
        writeln('Nama ',CariGatot,' Tidak Ditemukan!!!');
     end;
     readln;

end; // End Procedure

// --------------------------PROCEDURE TAMPIL DATA------------------------------
procedure Tampil_Data(data_array : data_gaji; n : integer);
var
   i : integer;

begin
        gotoxy(1,2);    write('--------------------------------------------------------------------------------');
        gotoxy(1,3);    write('|   NIP   |   Nama   |  Gol  |  Status  | Anak |     PPN      |   Gaji Total   |');
        gotoxy(1,4);    write('--------------------------------------------------------------------------------');
        for i := 1 to n-1 do
        begin
        gotoxy(1,4+i);    write('|         |          |       |          |      |              |                |');
        gotoxy(6,4+i);  writeln(data_array[i].NIP);
        gotoxy(16,4+i); writeln(data_array[i].Nama);
        gotoxy(26,4+i); writeln(data_array[i].Gol);
        gotoxy(35,4+i); writeln(data_array[i].Status);
        gotoxy(44,4+i); writeln(data_array[i].JumAnak);
        gotoxy(52,4+i); writeln(data_array[i].PPN:0:0);
        gotoxy(68,4+i); writeln(data_array[i].Gatot:0:0);
        end;
        gotoxy(1,5+i);   write('================================================================================');
        readln;
end;

// ------------------------------PROSEDUR SORTING NIP---------------------------
procedure sortingnip(n : integer; var data_array : data_gaji);
var
   temp2,i,k : integer;
   temp      : data;

begin
    for i := 1 to n-1 do
    begin
       for k := n downto (i+1) do
       begin
          if(data_array[k].NIP) < (data_array[k-1].NIP) then
          begin

             temp := data_array[k];
             data_array[k] := data_array[k-1];
             data_array[k-1] := temp;

          end;
       end;
    end;
end;

// ------------------------------PROGRAM UTAMA----------------------------------
begin
    repeat
    MenuPilihan;
    clrscr;
    case Pilihan of
         1 : begin
                  IsiData(data_array,n);
             end;
         2 : begin
                  clrscr;
                  CariNIP(data_array,n);
                  readln;
             end;
         3 : begin
                  clrscr;
                  CariDataNama(data_array,n);
                  readln;
             end;
         4 : begin
                  clrscr;
                  Carigatot(data_array,n);
                  readln;
             end;
         5 : begin
                  clrscr;
                  Tampil_Data(data_array,n);
                  readln;
             end;
         0 : begin
                  clrscr;
                  writeln('Pesan : ');
                  write('Terima kasih sudah menggunakan aplikasi ini...');
                  readln;
             end;
     end; //End Case
     until(Pilihan = 0)
end.
