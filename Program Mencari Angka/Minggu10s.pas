program Pencarian_Data;
{I.S : User memasukkan array Angka(1:N)}
{F.S : Menampilkan Angka yang dicari}
uses crt;
const
     MaksAngka = 20;
type
     LarikAngka = array[1..MaksAngka] of integer;
var
     Angka : LarikAngka;
     N     : integer; // Banyaknya Angka

// --------------------------PROCEDURE ISI ANGKA--------------------------------
procedure IsiAngka(var Angka:LarikAngka;var N:integer);
{I.S : Array Angka (1:N) dan banyaknya angka (N) sudah terdefinisi}
{F.S : Menghasilkan array Angka (1:N)}
var
   i : integer;
begin
     // Memasukkan banyaknya angka (n)
     write('Masukkan Banyaknya Angka : ');readln(N);

     // Validasi banyaknya angka (N)

     // Memasukkan Array Angka 1..N
     for i := 1 to N do
     begin
        write('Angka ke-',i,' : ');readln(Angka[i]);
     end; // End For

end; //End Procedure

// --------------------------PROCEDURE SEARCHING--------------------------------
procedure CariAngka(N:integer;Angka:LarikAngka);
{I.S : Banyaknya Angka (N) dan Array Angka (1:N) sudah terdefinisi}
{F.S : Menampilkan Angka yang dicari}
// Menggunakan Metode Sequential dan Boolean
var
    i,j,No     : integer;
    AngkaCari  : integer;
    Ketemu     : boolean;

begin
    clrscr;
    // Memasukkan Angka yang dicari
    write('Angka yang dicari : ');readln(AngkaCari);

    // Inisialisasi awal harga i
    i := 1;

    // Inisialisasi awal harga Ketemu
    Ketemu := false;

    // Proses Searching
    while(not Ketemu) and (i <= N) do
    begin
         if(Angka[i] = AngkaCari) then
               Ketemu := true
         else
               i      := i + 1;
    end; // End While

    if(Ketemu) then
    begin
        clrscr;
        writeln('Angka yang dicari ada di :');
        writeln;
        writeln('===============');
        writeln('| Posisi ke : |');
        writeln('===============');
        No := 0;

        for j := i to N do
        begin
             if(Angka[j] = AngkaCari) then
             begin
                  No := No+1;
                  gotoxy(13,No+5);write(j);
             end; // End If
        end; //End For
        writeln;
        writeln('===============');
    end
    else
         write(AngkaCari,' tidak ditemukan');

end; //Eng Procedure

// -----------------------------PROGRAM UTAMA-----------------------------------
begin
    IsiAngka(Angka,N);
    CariAngka(N,Angka);
    readln;
end.
