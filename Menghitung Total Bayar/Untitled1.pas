program menghitung_total_bayar;
uses crt;
     {I.S : User memasukkan kode barang(KdBrg) dan jumlah yang dibeli (jml)}
     {F.S : Menampilkan kode barang (KdBrg), nama barang (NmBrg),
           harga satuan (Hrg), jumlah yang dibeli (Jml),
           Harga total (HargaTotal), Diskon, Total Bayar (Total) dan uang kembalian(Kembalian) }
var
   KdBrg, NmBrg : string;
   Hrg, Jml, HargaTotal, UangBayar : integer;
   Diskon, Total, Kembalian        : real;
begin
     writeln(' ');textcolor(7);

     // Input Data Menurut I.S
     window(3,2,38,24);textbackground(LightBlue);clrscr;
     gotoxy(7,2);textcolor(7);writeln('Pengisian Data Penjualan');
     gotoxy(7,3);writeln('========================');
     writeln(' ');
     gotoxy(7,5);write('Kode Barang   : ');readln(KdBrg);
     gotoxy(7,6);write('Jumlah Barang : ');readln(Jml);

     // Menentukan Nama dan Harga
     if(KdBrg = 'PK01') or (KdBrg = 'pk01')
     then
     begin
         NmBrg := 'Pakaian';
         Hrg   := 55000;
     end
     else
         NmBrg := 'Tas';
         Hrg := 70000;

     // Proses
     HargaTotal := Hrg*Jml;
     if(Jml >= 5)
     then
     begin
         Diskon := 0.125*HargaTotal
     end
     else
         Diskon := 0;

     Total := HargaTotal - Diskon;

     //Output Hasil menurut F.S
     window(42,2,78,24);textbackground(LightBlue);clrscr;
     gotoxy(7,2);textcolor(7);writeln('Hasil Total');
     gotoxy(7,3);writeln('========================');
     writeln(' ');
     gotoxy(7,5);writeln('Kode Barang   : ',KdBrg);
     gotoxy(7,6);writeln('Nama Barang   : ',NmBrg);
     gotoxy(7,7);writeln('Harga Satuan  : Rp. ',Hrg);
     gotoxy(7,8);writeln('Jumlah Beli   : ',Jml);
     gotoxy(7,9);writeln('Diskon        : ',Diskon:0:2);
     gotoxy(7,10);writeln('________________________');
     gotoxy(7,12);writeln('Total Bayar  : ',Total:0:2);
     gotoxy(7,13);write('Bayar        : Rp. ');readln(UangBayar);
     gotoxy(7,14);writeln('________________________');

     // Menampilkan uang kembalian
     Kembalian := UangBayar - Total;
     gotoxy(7,16);write('Kembalian  : Rp. ',Kembalian:0:2);
     readln();
end.
