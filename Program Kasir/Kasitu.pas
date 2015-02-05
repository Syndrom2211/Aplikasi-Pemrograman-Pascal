program KASIR;
// I.S User memasukkan kode barang(kode), nama Barang(nama), harga satuan(harga), dan jumlah yang dibeli(jumlah).
// F.S Menampilkan total bayar (Total).

uses crt;
var
   KdBrg,NmBrg :string;
   HargaTotal,Hrg,Jml,UangBayar :integer;
   Diskon,Total,Kembalian :real;
   i:byte;
begin
   //User Memasukkan kode
  i := 1;
  gotoxy(10,6);writeln('+----+--------+--------+---------+--------+-----------+---------+');
  gotoxy(10,7);writeln('| No |  Kode  |  Nama  |   Harga | Jumlah |   Harga   |  Diskon |');
  gotoxy(10,8);writeln('|    | Barang | Barang |  Satuan | Barang |   Total   |         |');
  gotoxy(10,9);writeln('+----+--------+--------+---------+--------+-----------+---------+');
  gotoxy(10,10);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,11);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,12);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,13);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,14);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,15);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,16);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,17);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,18);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,19);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,20);writeln('|    |        |        |         |        |           |         |');
  gotoxy(10,21);writeln('+----+--------+--------+---------+--------+-----------+---------+');

  gotoxy(17,10);write('');readln(KdBrg);
            if(KdBrg='PK01') then
               begin
                    NmBrg := 'Pakaian';
                    Hrg   := 55000;
               end
            else
             if (KdBrg='TS02') then
               begin
                    NmBrg := 'Tas';
                    Hrg   := 70000;
             end
            else
                if (KdBrg='SP03') then
                begin
                    NmBrg := 'Sepatu';
                    Hrg   := 90000;
                end
            else
                begin
                NmBrg := 'Kang Masukkin Kodenya!!! ';
                end;
gotoxy(26,10);writeln('',NmBrg);
gotoxy(34,10);writeln('Rp. ',Hrg);
gotoxy(46,10);write('');readln(Jml);
             HargaTotal:=Hrg*Jml;
             //menghitung Harga total             HargaTotal := Jml*Hrg;

             //Diskon
                              if(Jml >= 5 ) then
                               Diskon := 0.125*HargaTotal
                              else
                               Diskon := 0;
             //Menghitung total Bayar
                          Total := HargaTotal-Diskon;
gotoxy(53,10);write('Rp. ',Total:2:0);
gotoxy(65,10);write('Rp. ',Diskon:2:0);
gotoxy(10,22);
writeln('Harga Total   : Rp. ',Total:0:2);
writeln('Diskon        : Rp. ',Diskon:0:2);
writeln('____________________________ +');
writeln('Total Bayar   : Rp. ',Total:0:2);
write('Bayar         : Rp. ');readln(UangBayar);
writeln('____________________________ -');
//Kembalian
Kembalian := UangBayar-Total;
writeln('Kembalian     : Rp. ',Kembalian:0:2);
readln;

end.


