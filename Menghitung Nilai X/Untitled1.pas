uses crt;
var
   a,b,c : real;
   x : real;
begin
   {I.S : User memasukan angka ke dalam var a,b, dan c}
   {F.S : Menampilkan hasil perhitungan}
   textcolor(6);
   writeln('==============================================');
   writeln('                                              ');
   writeln('|\/| _ ._  _ |_ o_|_    ._  _   |\ |o| _.o  \/');textcolor(3);
   writeln('|  |(/_| |(_|| || |_ |_|| |(_|  | \|||(_||  /\');textcolor(6);
   writeln('           _|               _|                ');textcolor(4);
   writeln('                                              ');
   writeln('                                              ');textcolor(3);
   writeln('Nama  : Firdamdam.Sasmita');
   writeln('Kelas : IF-5');
   writeln('                                              ');textcolor(6);
   writeln('==============================================');
   textcolor(6);write('----------------');
   textcolor(3);write('Masukan Nilai');
   textcolor(6);writeln('-----------------');textcolor(7);
   writeln('                                              ');
   writeln('                                              ');
   write('A = ');readln(a);
   write('B = ');readln(b);
   write('C = ');readln(c);
   writeln('                                              ');
   writeln('                                              ');textcolor(6);
   writeln('==============================================');
   textcolor(6);write('----------------');
   textcolor(3);write('Hasil Nilai X');
   textcolor(6);writeln('-----------------');textcolor(7);

   // Proses untuk mengasilkan output X
   x := (-b-2*sqr(c)+4*a*b*c)/(2*c*(3*a+4*c));

   // Menampilkan Hasil Output
   writeln('                                              ');
   writeln('                                              ');
   write('X =   -',b:0:0,'-2*(',c:0:0,')+4*',a:0:0,'*',b:0:0,'*',c:0:0,')/');
   write('(2*',c:0:0,'*(3*',a:0:0,'+4*',c:0:0,'  =  ');textcolor(6);
   write(x:0:2);
   writeln('                                              ');
   writeln('                                              ');textcolor(6);
   writeln('==============================================');
   readln;
end.
