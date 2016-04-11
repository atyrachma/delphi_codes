program prakterakhir;
uses dos,crt;
var n,m,i,j,k,p,an:integer;            {yg baru ieuh}
    f1,f2:integer;
    prm:array[1..100] of integer;
    tanda:char;
    kode:integer;

procedure inputmn;
          begin
               write('Masukkan nilai n pada 2^n : '); readln(n);
               write('Masukkan nilai m pada 3^m : '); readln(m);
               writeln;
          end;

function fungsi1(a,c:integer):integer;

         function pangkat(a,c:integer):integer;
                 var  i,power:integer;
                 begin
                      power:=1;
                      for i:=1 to c do
                       begin
                            power:=power*a;
                        end;
                        pangkat:=power;
                 end;
         begin
              fungsi1:=pangkat(2,n)+pangkat(3,m);
         end;

function fungsi2(a,c:integer):integer;

         function pangkat(a,c:integer):integer;
                 var  i,power:integer;
                 begin
                      power:=1;
                      for i:=1 to c do
                       begin
                            power:=power*a;
                        end;
                        pangkat:=power;
                 end;
         begin
              fungsi2:=abs(pangkat(2,n)-pangkat(3,m));
         end;



function cekprima(bil:integer):boolean;
         begin
              if bil=2 then begin cekprima:=true; end
              else if bil=1 then begin cekprima:=false; end
              else if (bil mod 2)=0 then begin cekprima:=false; end
              else begin
                   an:=trunc(sqrt(bil));
                   if (an mod 2)=0 then begin an:=an+1; end;
                   p:=3;
                   while (bil mod p <> 0) and (p<=an) do
                   begin
                        p:=p+2;
                   end;
                   if p<=an then begin cekprima:=false; end
                   else begin cekprima:=true; end;
              end;
         end;

procedure prime(fungsi:integer);
          begin
               i:=1; j:=0;
                    while i<=fungsi do
                          begin
                               if cekprima(i) = true then
                                  begin
                                       j:=j+1;
                                       prm[j]:=i;
                                  end;
                               i:=i+1;
                          end;
               writeln;
               write('Bilangan prima yang <= ',fungsi,' adalah ');
               for k:=1 to j do
                   begin
                        write(prm[k],' ');
                   end;
               writeln;
               writeln('Bilangan prima tersebut ada ',j,' buah');
               writeln;
          end;

begin
     clrscr;
     writeln;
     writeln('------------------------------------------------------------');
     writeln('                  PROGRAM BILANGAN PRIMA');
     writeln('============================================================');
     writeln;
     tanda:='y';
     while tanda='y' do
     begin
     writeln('Pilih bilangan yang akan dihitung (Tekan kodenya saja)');
     writeln('1> Bilangan 2^n + 3^m');
     writeln('2> Bilangan abs(2^n - 3^m)');
     writeln;
     write('Kode = '); readln(kode);
     writeln;
     if kode = 1 then
        begin
             inputmn;
             f1:=fungsi1(n,m);
             writeln('Bilangan 2^n + 3^m untuk n,m di atas adalah ',f1);
             if cekprima(f1)=true then begin writeln(f1,' adalah bilangan prima'); end
             else begin writeln (f1,' bukan bilangan prima'); end;
             prime(f1);
             writeln;
        end
     else if kode = 2 then
          begin
               inputmn;
               f2:=fungsi2(n,m);
               writeln('Bilangan harga mutlak dari 2^n - 3^m untuk n,m di atas adalah ',f2);
               if cekprima(f2)=true then begin writeln(f2,' adalah bilangan prima'); end
               else begin writeln (f2,' bukan bilangan prima'); end;
               prime(f2);
               writeln;
          end
     else
         begin writeln ('Kode Anda salah'); end;
     writeln;
     writeln('Hitung lagi? (y/t)');
     readln(tanda); writeln; writeln;
     end;
end.