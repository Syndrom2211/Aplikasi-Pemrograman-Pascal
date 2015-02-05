program Daftar_Nilai_Akhir_Mahasiswa;
{ I.S : user memasukan nim, nama mahasiswa, kehadiran, nilai tugas, nilai uts, dan nilai uas}
{ F.S : menampilkan daftar nilai akhir mahasiswa}
uses crt;
const
     Username = '10114175';
     Password = 'Firdam';

var
     Namauser, Pass, Matkul, Kelas, NIM, Nama : string;
     i, UAS : integer;
     Hdr, Hadir, Tugas : real;
begin
     {Membuat tampilan akses login}
     gotoxy(32,10);
     write('<<<<< LOGIN >>>>>');
     gotoxy(30,12);
     write('Username : '); readln(Namauser);
     gotoxy(30,13);
     write('Password : '); readln(Pass);


     {Mengecek Validasi Username dan Password}
     while (Namauser <> Username) or (Pass <> Password) do
     begin
          gotoxy(30,14);
          textcolor(red);write('Login Gagal!');
          readln();
          gotoxy(30,14);clreol;
          gotoxy(41,12);clreol;
          gotoxy(41,13);clreol;
          textcolor(15);
          gotoxy(41,12);readln(Namauser);
          gotoxy(41,13);readln(Pass);
     end;


     {Membuat header table}
     clrscr;
     gotoxy(26,1);write('Daftar Nilai Akhir Mahasiswa');
     gotoxy(1,2);write('Mata Kuliah : ');readln(Matkul);
     gotoxy(1,3);write('Kelas : ');readln(Kelas);
     gotoxy(1,4);write('--------------------------------------------------------------------------------');
     gotoxy(1,5);write('| No |    NIM    |      Nama     | Hadir | Tugas | UTS | UAS |  N.A.  | Indeks |');
     gotoxy(1,6);write('--------------------------------------------------------------------------------');

     {Memasukan data Pertama}
     i := 1;
     gotoxy(1,7);write('|    |           |               |       |       |     |     |        |        |');
     gotoxy(3,7);write(i);
     gotoxy(8,7);readln(NIM);

     {Mengcek NIM yang dimasukan '99999999' atau bukan}
     while(NIM <> '99999999') do
     begin
         {Memasukan nama dan kehadiran}
         gotoxy(20,7);readln(Nama);
         gotoxy(36,7);readln(Hadir);

         {Validasi Kehadiran}
         while(Hadir<0) or (Hadir > 16) do
         begin
             gotoxy(36,i+7);textcolor(red);
             write('Kehadiran harus antara 0-16!');
             readln();
             gotoxy(36,i+7);clreol;
             gotoxy(34,i+6);textcolor(15);
             write('|       |       |     |     |        |');
             gotoxy(36,i+6);readln(Hadir);
         end;

         {Mengubah harga kualitatif pada kehadiran menjadi harga kuantitatif}
         Hdr := Hadir/16 * 100;

         {Menampilkan nilai kehadiran}
         gotoxy(36,i+6);write(Hdr:0:1);

         {Memasukan Nilai Tugas}
         gotoxy(44,i+6);readln(Tugas);

         {Validasi Nilai Tugas}
         while(Hadir<0) or (Tugas > 100) do
         begin
             gotoxy(44,i+7);textcolor(red);
             write('Nilai Tugas harus antara 0-100!');
             readln();
             gotoxy(44,i+7);clreol;
             gotoxy(42,i+6);textcolor(15);
             write('|       |     |     |        |        |');
             gotoxy(44,i+6);readln(Tugas);
         end;

         {Memasukan Nilai UAS}
         gotoxy(58,i+6);readln(UAS);

         {Validasi Nilai UAS}
         while(Hadir<0) or (Tugas > 100) do
         begin
             gotoxy(44,i+7);textcolor(red);
             write('Nilai Tugas harus antara 0-100!');
             readln();
             gotoxy(44,i+7);clreol;
             gotoxy(42,i+6);textcolor(15);
             write('|       |     |     |        |        |');
             gotoxy(44,i+6);readln(Tugas);
         end;

         {Memasukan data berikutnya}
         i := i + 1;
         gotoxy(1,i+6);write('|    |           |               |       |       |     |     |        |        |');
         gotoxy(3,i+6);write(i);
         gotoxy(8,i+6);readln(NIM);
     end;
     {Penutup Table}
     gotoxy(1,i+6);write('--------------------------------------------------------------------------------');

     readln();
end.
