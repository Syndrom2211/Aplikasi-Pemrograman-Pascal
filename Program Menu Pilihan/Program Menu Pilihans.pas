program Menu_Pilihan;
{I.S : user memilih salah satu menu}
{F.S : menampilkan hasil sesuai dengan menu yang di pilih}
uses crt;
var
   Menu, N : integer;
   Nama1, Nama2, Nama3 : string;

procedure MenuPilihan(var Menu : Integer);
{I.S : User memilih salah satu Menu}
{F.S : Menghasilkan nomor menu yang di pilih}
begin
         writeln('Menu Pilihan');
         writeln('-----------------------');
         writeln('1. Menyusun Tiga Nama');
         writeln('2. Barisan Fibonacci');
         writeln('3. Suku ke-N dari Fibonacci');
         writeln('0. Keluar');
         writeln(' ');
         write('Pilihan Anda ? ');readln(Menu);
end; {Ini adalah End Procedure}

procedure IsiTigaNama(var Nama1, Nama2, Nama3 : string);
{I.S : User memasukan 3 Nama}
{F.S : Menghasilkan 3 buah Nama}
begin
     write('Masukan Nama Ke-1 : ');readln(Nama1);
     write('Masukan Nama Ke-2 : ');readln(Nama2);
     write('Masukan Nama Ke-3 : ');readln(Nama3);
end; {Ini adalah End Procedure}

procedure SusunTigaNama(var Nama1, Nama2, Nama3 : string);
{I.S : Tiga Buah Nama sudah terdefinisi}
{F.S : Menampilkan 3 buah nama yang sudah tersusun secara asscending}
begin
     if(Nama1 <= Nama2) and (Nama2 <= Nama3) then
        writeln(Nama1,', ',Nama2,', ',Nama3)
          else if(Nama1 <= Nama3) and (Nama3 <= Nama2) then
            writeln(Nama1,',',Nama3,',',Nama2)
              else if(Nama2 <= Nama1) and (Nama1 <= Nama3) then
                writeln(Nama2,',',Nama1,',',Nama3)
                  else if(Nama2 <= Nama3) and (Nama3 <= Nama1) then
                    writeln(Nama2,', ',Nama3,', ',Nama1)
                       else if(Nama3 <= Nama1) and (Nama1 <= Nama2) then
                         writeln(Nama3,', ',Nama1,', ',Nama2)
                            else
                              writeln(Nama3,',',Nama2,',',Nama1);
                                readln;
end; {Ini adalah End Procedure}

procedure BanyakSuku(var N : integer);
{I.S : User memasukan banyaknya suku (N)}
{F.S : Menghasilkan banyaknya suku (N)}
begin
    write('Banyaknya Suku : ');readln(N);
    {validasi banyaknya suku tidak boleh < 1}

end; {Ini adalah End Procedure}

function Fibonacci(Awal,Akhir : integer):integer;
{I.S : Harga var Awal dan Var Akhir sudah terpenuhi}
{F.S : Menghasilkan Fibonacci}
begin
    Fibonacci := Awal + Akhir;
end; {Ini adalah End Procedure}

procedure BarisanFibonacci(var N : integer);
{I.S : Banyaknya suku(N) sudah terdefinisi}
{F.S : Menampilkan barisan Fibonacci sebanyak N suku}
var
   Fibo, Awal, Akhir, i : integer;
begin
     Awal  := 0;
     Akhir := 0;
     Fibo  := 1;
       writeln('Barisan Fibonacci ',N,' Suku : ');
       for i := 1 to N do
       begin
         write(Fibo);
         if(i<>N)
            then
            write(', ');

            Awal  := Akhir;
            Akhir := Fibo;
            Fibo  := Fibonacci(Awal,Akhir); {Memanggil Fungsi Fibonacci}
       end;

end; {Ini adalah End Procedure}

procedure SukuKeN(var N : integer);
{I.S : User memasukan suku (N)}
{F.S : Menampilkan letak posisi suku ke (N)}
begin
     write('Suku ke : '); readln(N);
end; {Ini adalah End Procedure}

procedure SukuKeN2(var N : integer);
{I.S : User memasukan Suku ke N}
{F.S : Menampilkan Suku Ke N}
var
   Fibo, Awal, Akhir, i : integer;
begin
   if(N=1) or (N=2) then
     Fibo := 1
       else
         begin
         Awal  := 1;
         Akhir := 1;
         for i := 3 to N do
         begin
             Fibo  := Fibonacci(Awal,Akhir); {Memanggil Fungsi Fibonacci};
             Awal  := Akhir;
             Akhir := Fibo;
         end;
   end;
   write('Suku ke-',N,' : ',Fibo);readln();
end; {Ini adalah End Procedure}

{Program Utama}
begin
   repeat
         clrscr;
         MenuPilihan(Menu);
         {I.S : User memilih salah satu Menu}
         {F.S : Menampilkan hasil sesuai Menu yang di pilih}

         case (Menu) of
              1 : begin
                       clrscr;
                       {Menyusun tiga nama}
                       writeln('Menyusun Tiga Buah Nama');
                       writeln('-----------------------');
                       IsiTigaNama(Nama1, Nama2, Nama3);
                       writeln(' ');
                       writeln('Nama yang sudah tersusun : ');
                       writeln(' ');
                       SusunTigaNama(Nama1, Nama2, Nama3);
                  end;
              2 : begin
                       clrscr;
                       {Barisan Fibonnaci}
                       writeln('Barisan Fibonacci');
                       writeln('-----------------');
                       BanyakSuku(N);
                       writeln(' ');

                       {Validasi Harga N}
                       BarisanFibonacci(N);

                       writeln;
                       writeln(' ');
                       write('Tekan Enter untuk kembali ke Menu Pilihan');
                       readln;
                  end;
              3 : begin
                      clrscr;
                      {Suku ke-N dari fibonacci}
                      writeln('Suku ke-N dari Fibonacci');
                      writeln('------------------------');
                      SukuKeN(N);
                      {Validasi N}
                      SukuKeN2(N);
                  end;
         end;
   until(Menu=0);
end.
