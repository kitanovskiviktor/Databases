CREATE TABLE Lista_zelbi(
ID int primary key,
naslov varchar(50),
k_ime varchar(50),
ime varchar(50),
foreign key(naslov) references Video_zapis(naslov) on update cascade on delete set null,
foreign key(k_ime, ime) references Profil(k_ime, ime) on delete cascade on update cascade
);

CREATE TABLE Korisnik(
k_ime varchar(50) primary key,
ime varchar(50),
prezime varchar(50),
tip varchar(50),
pretplata varchar(50),
datum_reg date,
tel_broj varchar(50),
email varchar(50),
CHECK(datum_reg >= '2015-01-01' OR pretplata<>'pretplata 3')
);

CREATE TABLE Premium_korisnik(
k_ime varchar(50) primary key,
datum date,
procent_popust int default 10,
foreign key (k_ime) references Korisnik(k_ime) on delete cascade on update cascade
);