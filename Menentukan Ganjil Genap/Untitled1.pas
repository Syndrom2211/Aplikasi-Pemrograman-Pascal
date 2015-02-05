program menentukan_ganjil_atau_genap;
{I.S : User memasukan sebuah bilangan}
{F.S : Menampilkan keterangan Bilangan Ganjil atau Bilangan Genap}
var
   bilangan : integer;
   keterangan : string;
begin
   //Input
   writeln('===============Masukan Bilangan================');
   writeln('    ');
   write('Masukan Bilangan : ');readln(bilangan);

   //Proses
   keterangan := 'Bilangan Ganjil';
   if(bilangan mod 2 = 0) then
      keterangan := 'Bilangan Genap';

  //Output
  writeln(' ');
  writeln('==============Hasil Genap/Ganjil===============');
  writeln(' ');
  writeln(bilangan,' adalah ',keterangan);
  readln();
end.
