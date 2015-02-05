program DataBuku;
{I.S. : User memasukkan kode buku, harga beli dan stok buku}
{F.S. : Menampilkan data buku beserta harga jualnya}
uses crt;
const
     Max_Buku = 5;
     username2 = 'admin';
     password2 = '12345678';
type
     Data_Buku = record
         Kode_Buku, Nama_Buku : string;
         Harga_Beli, Stok     : integer;
         Harga_Jual           : real;
     end;
     Buku = array [1..Max_Buku] of Data_Buku;
var
     Book  : Buku;
     N,Pilihan     : integer; // Banyaknya data
     username1, password1 : string;
     JumMasukPassword : integer;

function Nama_Buku(Kode : string) : string;
{I.S : Kode buku sudah terdefinisi}
{F.S : Menghasilkan Fungsi nama buku}
begin
     if(Kode = 'FSK01') or (Kode = 'fsk01') then
         Nama_Buku := 'Fisika'
         else if(Kode = 'KIM02') or (Kode = 'kim02') then
               Nama_Buku := 'Kimia'
               else if(Kode = 'BIG03') or (Kode = 'big03') then
                    Nama_Buku := 'Biologi'
                    else if(Kode = 'MTK04') or (Kode = 'mtk04') then
                         Nama_Buku := 'Matematika'
                         else
                         Nama_Buku := 'Bahasa Indonesia'
end; // End Function

function FungsiHarga(Stok,Harga_Beli:integer):real;
{I.S : stok buku dan harga beli sudah terdefinisi}
{F.S : Menghasilkan Fungsi Harga Jual}
var
  HrgJual : real;
begin
   if(Stok>=20)
   then
   begin
     HrgJual     := Harga_Beli + Harga_Beli * 0.075;
     FungsiHarga := HrgJual - HrgJual * 0.025;
   end;
begin
   if(Stok<20)
   then
     FungsiHarga := Harga_Beli + Harga_Beli * 0.125;
   end;
end;//endfunction


//---------------FUNCTION PEMERIKSAAN PASSWORD----------------------------------
function periksa_password(password1:string):boolean;
	
	begin
		if(password1=password2)then
			periksa_password:=true
		else
			periksa_password:=false;
	end;

// ------------------PROCEDURE KONDISI BENAR MEMASUKAN PASSWORD-----------------
Procedure Benar;
{I.S : User memasukkan username dan password}
{F.S : Login Diterima jika username dan password diterima}
begin
     if(periksa_password(password2)) then
     begin
         clrscr;
                writeln('*****************');
                writeln('Login Berhasil ! ');
                writeln('*****************');
         readln;
     end;
end;

// ------------------PROCEDURE KONDISI SALAH MEMASUKAN PASSWORD-----------------
Procedure Salah;
{I.S : User memasukkan username dan password}
{F.S : Login Diterima jika username dan password diterima}
begin
     clrscr;
     if(password1 <> password2) or (username1 <> username2) then
     begin
         writeln('*****************');
         writeln('Password Salah ! ');
         writeln('*****************');
         JumMasukPassword := JumMasukPassword+1;
         readln;
     end;
end;
// ------------------PROCEDURE UNTUK MENAMPILKAN PERINGATAN---------------------
Procedure Peringatan;
{I.S : User memasukkan username dan password}
{F.S : Login Diterima jika username dan password diterima}
begin
     clrscr;
     if(JumMasukPassword = 2) then
     begin
         writeln('************************************************************');
         writeln('Anda Salah 2x, Satu kali lagi salah maka program akan keluar');
         writeln('************************************************************');
     readln;
     end;
end;


// ----------------------------PROCEDURE ISI DATA-------------------------------
Procedure IsiData(var N:integer;var Book:Buku);
{I.S : user memasukkan banyaknya data (N) dan data Buku}
{F.S : Menghasilkan data Buku}
var
   i : integer;
begin
     clrscr;
     // Memasukkan banyaknya data (N)
     write('Banyaknya Data : '); readln(N);
     // Validasi banyaknya data
     while (N>5) do
           begin
           clrscr;
           write('Batas nya hanya sampai 5 data !');
           writeln;
           write('Banyaknya Data : '); readln(N);
           end;
     // Membuat Tabel
     clrscr;
     gotoxy(36,1);write('Data Buku');
     gotoxy(13,2);
     write('-------------------------------------------------------');
     gotoxy(13,3);
     write('| Kode Buku |     Nama Buku     |  Harga Beli  | Stok |');
     gotoxy(13,4);
     write('-------------------------------------------------------');

     // Memasukkan data buku
     for i := 1 to N do
     begin
     gotoxy(13,i+4);
     write('|           |                   |  Rp.         |      |');

        // Memasukkan kode buku
        gotoxy(15,i+4); readln(Book[i].Kode_Buku);

        // Menampilkan nama buku dari fungsi
        Book[i].Nama_Buku := Nama_Buku(Book[i].Kode_Buku);
        gotoxy(27,i+4); write(Book[i].Nama_Buku);

        // Memasukkan harga beli dan stok
        gotoxy(51,i+4); readln(Book[i].Harga_Beli);
        gotoxy(63,i+4); readln(Book[i].Stok);

     end; //End For

     // Garis penutup tabel
     gotoxy(13,i+5);
     write('-------------------------------------------------------');
readln;
end; // End Procedure


// ----------------------------PROCEDURE TAMPIL DATA----------------------------
Procedure TampilData(N:integer;Book:Buku);
{I.S : Banyaknya data (N) dan data buku sudah terderfinisi}
{F.S : Menampilkan Data Buku}
var
   i,j,x,max : integer;
   temp      : string;
begin
// SORTING METODE MAXIMUM
// ----------------------------Urut Kode Buku-----------------------------------
     x := N;
     for i:=1 to N-1 do
     begin
          max := 1;
          for j:=2 to x do
          begin
               if (Book[j].Kode_Buku > Book[max].Kode_Buku) then
               begin
                    max := j;
               end;
          end;
     temp := Book[max].Kode_Buku;
     Book[max].Kode_Buku := Book[j].Kode_Buku;
     Book[j].Kode_Buku := temp;
     x := x - 1;
     end;

     // Membuat Tabel
     clrscr;
     gotoxy(36,1);write('Data Buku');
     gotoxy(5,2);
     write('--------------------------------------------------------------------------');
     gotoxy(5,3);
     write('| Kode Buku |     Nama Buku     |  Harga Beli  | Stok |    Harga Jual    |');
     gotoxy(5,4);
     write('--------------------------------------------------------------------------');

     // Memasukkan data buku
     for i := 1 to N do
     begin
     gotoxy(5,i+4);
     write('|           |                   |  Rp.         |      |    Rp.           |');

        // Menampilkan Kode Buku
        gotoxy(7,i+4); write(Book[i].Kode_Buku);

        // Menampilkan nama buku dari fungsi
        gotoxy(19,i+4); write(Book[i].Nama_Buku);

        // Menampilkan harga beli dan stok
        gotoxy(43,i+4); write(Book[i].Harga_Beli);
        gotoxy(55,i+4); write(Book[i].Stok);

        // Menampilkan Harga Jual dari fungsi
        Book[i].Harga_Jual := FungsiHarga(Book[i].Stok,Book[i].Harga_Beli);
        gotoxy(69,i+4); write(Book[i].Harga_Jual:0:3);

     end; //End For

     // Garis penutup tabel
     gotoxy(5,i+5);
     write('--------------------------------------------------------------------------');
readln;
end; // End Procedure

// -------------------------PROCEDURE MENU PILIHAN------------------------------
Procedure MenuPilihan;
{I.S : User memilih 3 menu pilihan}
{F.S : Menampilkan menu pilihan yang di pilih user}

begin
     clrscr;
     textbackground(lightblue);
     write('------------------------MAIN MENU---------------------------------');
     writeln('');
     writeln('1. Mengisi Data Buku');
     writeln('2. Menampilkan Hasil Data Dan Mengurutkan Nya Secara Ascending');
     writeln('0. Exit');
     writeln('');
     write('Menu yang di pilih : ');readln(Pilihan);
     writeln;
     write('------------------------------------------------------------------');

end;
// ----------------------------PROGRAM UTAMA------------------------------------
begin
    JumMasukPassword := 0;
    repeat
     clrscr;
     textcolor(lightgreen);
     write('Masukkan Username : ');readln(username1);
     write('Masukkan Password : ');readln(password1);
     if (periksa_password(password1)) then
        begin
        Benar;
        repeat
        clrscr;
        MenuPilihan;
        case Pilihan of
          1 : begin
                   IsiData(N,Book);
              end;
          2 : begin
                   TampilData(N,Book);
              end;
          0 : begin
                   clrscr;
                   write('Jangan lupa kembali lagi ya :D');
                   readln
              end;
         end;
     until (Pilihan = 0);
     end
     else
     begin
     Salah;
     Peringatan;
     end;
     until (JumMasukPassword = 3)or(periksa_password(password1) = true);
     write('Terima kasih sudah menggunakan program ini Bye Bye !');
     readkey;
end.
