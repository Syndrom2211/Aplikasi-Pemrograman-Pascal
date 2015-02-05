program diameter_lingkaran;
{I.S : User memasukan diameter lingkaran}
{F.S : Menampilkan luas lingkaran}
var
   diameter : integer;
   luas : real;
begin
   // Input
   writeln('=========Masukan Diameter Lingkaran==========');
   writeln('    ');
   write('Diameter Lingkaran : ');readln(diameter);

   // Proses
   luas := 0.25*3.14*sqr(diameter);

   // Output
   writeln(' ');
   writeln('=========Luas Lingkaran==========');
   writeln(' ');
   writeln('Luas : ',luas:0:2);
   readln();
end.
