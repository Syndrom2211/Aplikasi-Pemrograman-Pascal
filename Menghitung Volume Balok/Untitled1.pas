program menghitung_volume_balok;
uses crt;
{I.S : User memasukan panjang, lebar, dan tinggi balok dalam satuan sentimeter}
{F.S : Menampilkan volume balok dalam satuan meter kubik}
var
   Panjang, Lebar, Tinggi, Volume : real;
begin
   // Input
   writeln('=========Masukan Panjang,Lebar,Tinggi==========');
   writeln('    ');
   write('Masukan Panjang Balok (cm) : ');readln(Panjang);
   write('Masukan Lebar Balok (cm) : ');readln(Lebar);
   write('Masukan Tinggi Balok (cm) : ');readln(Tinggi);

   // Proses 
   Volume := Panjang*Lebar*Tinggi/1000000;

   // Output
   writeln(' ');
   writeln('==============Hasil Volume Balok===============');
   writeln(' ');
   write('Volume Balok (m3) : ');
   writeln(Volume:0:5,' m3');
   readln();
end.
