program menukarkan_dua_harga_dengan_var_bantu;
     var
        angka1, angka2, temp : integer;
begin
     writeln('============Masukan Angka=============');
     writeln(' ');
     // Input Angka 1 dan Angka 2
     write('Angka 1 : ');readln(angka1);
     write('Angka 2 : ');readln(angka2);

     writeln(' ');
     writeln('===========Hasil Penukaran============');

     // Proses penukaran Angka
     temp   :=  angka2;
     angka2 :=  angka1;
     angka1 :=  temp;

     writeln(' ');
     writeln(' ');

     // Menampilkan hasil penukaran
     writeln('Angka ke-1 : ',angka1);
     writeln('Angka ke-2 : ',angka2);

     writeln(' ');
     writeln('======================================');
     readln();
end.
