program projectkomatfinal;
uses dos,crt;
var n,bilangan,m,b,nama:string;  t:char;
    pjg,bilterakhir,k:integer;   kode:integer;
    a:array[1..500] of integer;


function jumlah2n(v:string):string;

        var c,d:string; carry,tmp,i:longint;

	begin
                for i:=1 to length(v) do
                    begin
                         val(v[i],a[i],kode);
                    end;

                carry:=0;
                c:='';


		for i:= length(v) downto 1 do
		begin
			tmp:=a[i]+a[i] + carry;
                        str(tmp mod 10,d);
			c:=d+c;
			carry:=tmp div 10;
		end;
		if (carry > 0) then begin c:='1'+c; end;
		jumlah2n:=c;
	end;

function tiganplus1(v,w:string):string;

        var c,d:string; carry,tmp,i:longint;
            a,b:array[1..300] of integer;

        begin

                {menyamakan panjang}
                while length(v)>length(w) do begin w:='0'+w; end;
		while length(w)>length(v) do begin v:='0'+v; end;

		carry:=0;
                c:='';

                 for i:=1 to length(v) do
                    begin
                         val(v[i],a[i],kode);
                         val(w[i],b[i],kode);
                    end;

                for i:= length(v) downto 1 do
		begin
			if i=length(v) then begin
				tmp:=a[i] + b[i] + 1 + carry; end
			else begin
				tmp:=a[i] + b[i] + carry; end;
			str(tmp mod 10,d);
			c:=d+c;
			carry:=tmp div 10;
		end;
		if (carry > 0) then begin c:='1'+c; end;
		tiganplus1:=c;
	end;

function bagidua(bil:string):string;
          var a,b:array[1..500] of integer;
              l,i,kode:integer;  c,tmp:string;
          begin
               l:=length(bil);
               for i:=1 to l do
                   begin
                        val(bil[i],a[i],kode);
                   end;

               if a[1] >= 2 then
                  begin
                       b[1]:=a[1] div 2;

                       for i:=2 to l do
                       begin
                            if (a[i-1] mod 2 = 0) then
                               begin
                                    b[i]:=a[i] div 2;
                               end
                            else
                                begin
                                     b[i]:=(a[i]+10) div 2;
                                end;
                       end;

                       c:='';
                       for i:=l downto 1 do
                           begin
                                str(b[i],tmp);
                                c:=tmp+c;
                           end;
                       bagidua:=c;
                  end

               else
                   begin
                        b[1]:=(a[2]+10) div 2;

                        for i:=3 to l do
                            begin
                                 if (a[i-1] mod 2 = 0) then
                                    begin
                                         b[i-1]:=a[i] div 2;
                                    end
                                 else
                                     begin
                                          b[i-1]:=(a[i]+10) div 2;
                                     end;
                            end;

                        c:='';
                        for i:=(l-1) downto 1 do
                            begin
                                 str(b[i],tmp);
                                 c:=tmp+c;
                            end;
                        bagidua:=c;

                   end;

          end;




begin
                clrscr;
		writeln;
                writeln('==========================================================');
                writeln('              SELAMAT DATANG DI PROGRAM 3N+1');
                writeln('==========================================================');
                writeln;
                write('       Masukkan Nama Anda : '); readln(nama);
                t := 'y';
                while t = 'y' do
                begin
                clrscr;
                writeln;
                writeln(nama,', silakan masukkan sebuah bilangan bulat < 100 digit.');
                writeln;
                write('Bilangan bulat : ');
                readln(bilangan);
                clrscr;
                n:=bilangan;
                writeln;
                writeln;
                writeln('Proses Konjektur 3N+1 untuk N = ',bilangan);
                writeln;

                write(n,'-'); k:=1;

                while n <> '1' do
                      begin


		pjg:=length(n);

		val(n[pjg],bilterakhir,kode);

		{uji ganjil}
			if((bilterakhir+1) mod 2=0) then
				begin
				m:=jumlah2n(n);
				n:=tiganplus1(m,n);
				end
			else
                            begin
                                 n:=bagidua(n);
                            end;

                        if n <> '1' then begin write(n,'-'); end
                        else begin write(n); end;

                        k:=k+1;
                end;
                writeln;
                writeln;
                writeln;
                writeln('Banyaknya perlakuan : ',k-1);
                writeln;
                writeln;
                writeln('Ingin menguji bilangan lain ? (y/t)');
                write('Jawaban : '); readln(t);
                writeln;
                end;

end.


