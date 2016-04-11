program no7;
uses dos,crt;
var
   i,j,n:integer;
   a:array[1..500] of integer;
   b:array[1..500] of integer;
   tanda:boolean;
begin
     clrscr;
     tanda:=true;
     writeln('Masukkan jumlah elemen!');
     readln(n);
     writeln;

     for i:=1 to n do
         begin
         write('Masukkan bilangan ke-',i,' : '); readln(a[i]);
         end;

     writeln;

     b[1]:=a[1];
     writeln('Bilangannya adalah ');
     write(b[1],' ');
     j:=1 ;
     for i:=2 to n do
         begin
              while j<i do
                  begin
                       tanda:=tanda and ((a[i])<>(b[j]));

                       j:=j+1;

                  end;
          if tanda=false then
                 begin
                      tanda:=true;
                 end
          else
              begin
                    b[i]:=a[i];

                    write(b[i],' ');
              end;
          end;
     readkey;
end.