unit PROJECTKOMAT_KEL14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TTIGANPLUSSATU = class(TForm)
    LABEL1: TLabel;
    BILANGAN: TEdit;
    PROSES: TButton;
    HAPUS: TButton;
    KELUAR: TButton;
    HASIL1: TListBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Timer1: TTimer;
    procedure PROSESClick(Sender: TObject);
    procedure HAPUSClick(Sender: TObject);
    procedure KELUARClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TIGANPLUSSATU: TTIGANPLUSSATU;

implementation

{$R *.dfm}

procedure TTIGANPLUSSATU.PROSESClick(Sender: TObject);
var m,n:string;   f,g:integer;   kode:integer;
    pjg,bilterakhir,k:integer;
    a:array[1..300] of integer;

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

                {menyamakan panjang string}
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
				tmp:=a[i]+b[i]+1 + carry; end
			else begin
				tmp:=a[i]+b[i] + carry; end;
      str(tmp mod 10,d);
			c:=d + c;
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
      BILANGAN.SetFocus;
      n:=BILANGAN.Text;  k:=0; f:=0; g:=0;
      HASIL1.Items.Add(n);
      while n <> '1' do
        begin
          pjg:=length(n);
          val(n[pjg],bilterakhir,kode);
        	{uji ganjil}
			if((bilterakhir+1) mod 2=0) then
				begin
				m:=jumlah2n(n);
				n:=tiganplus1(m,n);
        f:=f+1;
				end
			else
                            begin
                                 n:=bagidua(n);   g:=g+1;
                            end;

                        if n <> '1' then begin HASIL1.Items.Add(n); end
                        else begin HASIL1.Items.Add(n);
                          showmessage('Konjektur 3N+1 untuk bilangan bulat N='+ BILANGAN.Text+' berhasil');end;

                        k:=k+1;
      end;
      memo1.Lines.add(inttostr(k));
      memo2.Lines.Add(inttostr(f));
      memo3.Lines.add(inttostr(g));

end;


procedure TTIGANPLUSSATU.HAPUSClick(Sender: TObject);
begin
      BILANGAN.Text:='';
      memo1.text:='';
      memo2.Text:='';
      memo3.Text:='';
      HASIL1.Items.Clear;
      BILANGAN.SetFocus;

end;

procedure TTIGANPLUSSATU.KELUARClick(Sender: TObject);
begin
application.Terminate;
end;







procedure TTIGANPLUSSATU.Timer1Timer(Sender: TObject);
begin
label1.Left:=label1.Left-5;
if label1.Left < -110 then label1.left:=550;
end;

end.
