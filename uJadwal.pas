unit uJadwal;

interface
type Tayang = record
		Nama,
		Jam : string;
		Tanggal,
		Bulan,
		Tahun,
		LamaTayang : integer;
end;

type dbTayang = record
	Tayang : array[1..1000] of Tayang;
	Neff : integer;
end;

procedure load (var f:text;p:string);
procedure loadTayang(var dT: dbTayang);

implementation
procedure load (var f:text;p:string);
begin
	assign(f,p);
	reset(f);
end;
procedure loadTayang(var dT: dbTayang);
var 
	dTayang: text;
	f:ansistring; 
	pos1,l,i,j:integer;
begin
	j:=1;
	load(dTayang,'database\jadwal.txt');
	while not Eof(dTayang) do
	begin
		readln(dTayang,f);
			for i:=1 to 6 do
			begin
				pos1:=pos('|',f);
				l:=length(copy(f,1,pos1+1));
				case i of
				1:dT.Tayang[j].Nama:=copy(f,1,pos1-2);
				2:dT.Tayang[j].Jam:=copy(f,1,pos1-2);
				3:val(copy(f,1,pos1-2),dT.Tayang[j].Tanggal);
				4:val(copy(f,1,pos1-2),dT.Tayang[j].Bulan);
				5:val(copy(f,1,pos1-2),dT.Tayang[j].Tahun);
				6:val(copy(f,1,pos1-2),dT.Tayang[j].LamaTayang);
				end;
        		delete(f,1,l);
        	end;
        j:=j+1;
    end;
    dT.Neff:=j-1;
	close(dTayang);
	writeln('> Data JadwalTayang sudah di load, banyak Jadwal Tayang ada ',dT.Neff);

    begin
    	writeln('Nama :',dT.Tayang[1].Nama);
    	writeln('Jam Tayang :',dT.Tayang[1].Jam);
    	writeln('Tanggal :',dT.Tayang[1].Tanggal);
    	writeln('Bulan :',dT.Tayang[1].Bulan);
    	writeln('Tahun :',dT.Tayang[1].Tahun);
    	writeln('Lama Tayang :',dT.Tayang[1].LamaTayang);
    	writeln;
    end;

end;

	
end.
