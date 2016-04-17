program ReservasiTiketBioskop;
uses uFilm, uJadwal, uKapasitas, uMember, uTanggal,
		sysutils,crt;

var
	tFilm	: dbFilm;
	tTayang	: dbTayang;
	tKapasitas: dbKapasitas;
	tMember : dbMember;
	tgl : Tanggal;
	Fx : string;
	stopProgram : boolean;
	
begin
	// -- Proses Inisiasi -- //
	stopProgram:= false;
	
	repeat
		clrscr;
		writeln('===========================================================');
		writeln('    Selamat Datang di Pelayan Pemesanan Tiker Bioskop X    ');
		writeln('===========================================================');
		writeln();
		writeln('Berikut adalah Fungsi yang bisa digunakan:                 ');
		writeln(' 1. load            6. ratingFilter   11. payCreditCard    ');
		writeln(' 2. nowPlaying      7. searchMovie    12. payMember        ');
		writeln(' 3. upcoming        8. showMovie      13. loginMember      ');
		writeln(' 4. schedule        9. showNextDay    14. register         ');
		writeln(' 5. genreFilter    10. selectMovie    15. exit             ');
		writeln();
		write('> ');readln(Fx);
		case Fx of
			'load'			: begin
								loadFilm(tFilm);
								loadTayang(tTayang);
								loadKapasitas(tKapasitas);
								loadMember(tMember);
								loadTanggal(tgl);
								delay(1500);
							  end;
			'genreFilter'	: genreFilter(tFilm);
			'ratingFilter'	: ratingFilter(tFilm);
			'exit'			: begin
									stopProgram:=true;
							  end;
		end; 
		write('press Enter to continue..');readln();
	until stopProgram;
end.
