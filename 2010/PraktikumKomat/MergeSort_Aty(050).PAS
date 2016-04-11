program mergesort;
uses dos,crt;
var n,d,k:integer;
    pas,pkt,size:integer;
    pkt2,psg,sa:integer;
    p,q,i,j,t,s,r:integer;
    a,b: array [1..100] of integer;
begin
     clrscr;
     write('Masukkan jumlah elemen: ');   {input jml elemen}
     readln(n);

     writeln; writeln;
     for i:=1 to n do begin readln(a[i]); end;     {input elemen}
     writeln;

     d:=1; k:=trunc(n/2);
     while k <> 1 do begin  d:=d+1;   k:=trunc(k/2); end;    {d=log2 n}
     writeln;


     for pas:=1 to d do
         begin
         pkt:=0;
         while pkt <= (pas-1) do   begin
               if pkt=0 then begin size:=1; end
               else begin size:=size*2; end;
         pkt:=pkt+1;      end;
         p:=1;                  q:=p+size;

         pkt2:=0;
         while pkt2 <= pas do  begin
               if pkt2 <= pas then begin sa:=1; end
               else begin sa:=sa*2; end;
         pkt2:=pkt2+1;    end;

         psg:=trunc(n/sa);

         for s:=1 to psg do begin
             i:=p;   j:=q;    t:=p;
             while (i<=p+size-1) and (j<=q+size-1) do begin
               if trunc(pas/2)*2 <> pas then begin
                  if a[i] <= a[j] then begin b[t]:=a[i]; i:=i+1;  end
                     else begin  b[t]:=a[j];  j:=j+1;  end;   end
                  else begin
                       if b[i] <= b[j] then begin a[t]:=b[i]; i:=i+1;  end
                          else begin  a[t]:=b[j];  j:=j+1;  end;
                       end;
               t:=t+1; end;
         if (i > p+size-1) then begin
            if trunc(pas/2)*2 <> pas then begin
               for r:=j to (q+size-1) do begin
                   b[t]:=a[r];        t:=t+1;     end;    end
               else begin for r:=j to (q+size-1) do begin
                    a[t]:=a[r];       t:=t+1; end; end;
         end
         else begin if trunc(pas/2)*2 <> pas then begin
                    for r:=i to p+size-1  do  begin
                        b[t]:=a[r];      t:=t+1; end; end
                    else begin for r:=i to p+size-1 do begin
                        a[t]:=b[r];     t:=t+1; end; end;
         end;
         p:=q+size;     q:=p+size;
         end; end;

         writeln;
         writeln('Setelah di merge sort....');
         writeln;

     if trunc(d/2)*2 <> d then begin
            for i:=1 to n do begin
                a[i]:=b[i];  end;  end;

     for i:=1 to n do begin
         write('   ', a[i]); end;

         writeln;
         writeln;

         writeln;
         readkey;
end.










