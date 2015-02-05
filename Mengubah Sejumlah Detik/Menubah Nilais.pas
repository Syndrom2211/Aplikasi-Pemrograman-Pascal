program mengubah_sejumlah_detik_menjadi_jam_menit_detik;
var
   JmlDetik, Jam, Sisa, Menit, Detik : integer;
begin
   writeln('==========Masukan Sejumlah Detik===========');
   writeln(' ');
   // Inputkan Sejumlah Detik
   write('Masukan Sejumlah Detik : ');readln(JmlDetik);

   writeln(' ');
   writeln('===========Hasil Sejumlah Detik============');
   writeln(' ');

   // Proses mengubah sejumlah detik menjadi jam, menit dan detik
   Jam   := JmlDetik div 3600;
   Sisa  := JmlDetik mod 3600;
   Menit := Sisa div 60;
   Detik := Sisa mod 60;

   // Menampilkan hasil Output
   writeln(JmlDetik,' Detik = ',Jam,' Jam : ',Menit,' Menit : ',Detik,' Detik');
   readln();
end.
