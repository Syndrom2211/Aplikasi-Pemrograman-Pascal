program Data_Penjualan;
{I.S : user memasukan kode barang (KdBrg) dan jumlah yang di beli (Jml)}
{F.S : menampilkan data penjualan}
uses crt;
var
     NoTrans, Tgl, KdBrg, NmBrg : string;
     i, HrgBrg           : integer;
begin
     // Membuat header Tabel
     gotoxy(32,2);write('Data Penjualan');
     gotoxy(1,3);
     write('No. Transaksi     : ');readln(NoTrans);
     gotoxy(1,4);
     write('Tanggal           : ');readln(Tgl);

     gotoxy(1,5);
     write('--------------------------------------------------------------------------------');
     gotoxy(1,6);
     write('! No !  Kode  !   Nama   !  Harga       !  Jumlah  !  Harga       !  Diskon   !');
     gotoxy(1,7);
     write('!    ! Barang !  Barang  !  Satuan      !          !  Total       !           !');
     gotoxy(1,8);
     write('--------------------------------------------------------------------------------');

     // Memasukkan kode barang pertama
     gotoxy(1,9);
     write('!    !        !          !  Rp.         !          !  Rp.         !           !');
     i := 1;
     gotoxy(3,9);write(i);
     gotoxy(8,9);readln(KdBrg);

     while(KdBrg <> 'stop') do
     begin
          // Menentukan Nama Barang dan Harga Satuan
          if(KdBrg = 'PK01') then
          begin
              NmBrg  := 'Pakaian';
              HrgBrg := 55000;
          end
          else
          if(KdBrg = 'TS02') or (KdBrg = 'ts02')then
          begin
              NmBrg  := 'Tas';
              HrgBrg := 70000;
          end
          else
          begin
              NmBrg := 'Sepatu';
              HrgBrg := 90000;
          end;

          // Menampilkan nama barang dan harga satuan
          gotoxy(17,i+8);write(NmBrg);
          gotoxy(32,i+8);write(HrgBrg);

          // Memasukan data berikutnya
          i := i + 1;
          gotoxy(1,i+8);
          write('!    !        !          !  Rp.         !          !  Rp.         !           !');
          gotoxy(3,i+8);write(i);
          gotoxy(8,i+8);readln(KdBrg);

     end;
     gotoxy(1,i+8);
     write('--------------------------------------------------------------------------------');
     readln;
end.
