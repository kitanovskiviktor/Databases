CREATE TABLE Korisnik(
k_ime varchar(50) primary key,
ime varchar(50),
prezime varchar(50),
tip varchar(50),
pretplata varchar(50),
datum_reg date,
tel_broj varchar(12),
email varchar(50),
CHECK(datum_reg >= '2023-01-01' AND datum_reg <= '2024-12-31')
);

CREATE TABLE Premium_korisnik(
k_ime varchar(50) primary key,
datum date,
procent_popust int default 20,
foreign key (k_ime) references Korisnik(k_ime) on delete cascade on update cascade
);

CREATE TABLE Profil(
k_ime varchar(50),
ime varchar(50),
datum date,
primary key(k_ime, ime),
foreign key (k_ime) references Korisnik(k_ime) on delete cascade on update cascade
);

CREATE TABLE Video_zapis(
naslov varchar(50) primary key,
jazik varchar(50) default 'English',
vremetraenje int,
datum_d date,
datum_p date,
CHECK(datum_d >= datum_p)
);

CREATE TABLE Video_zapis_zanr(
naslov varchar(50),
zanr varchar(50),
primary key(naslov, zanr),
foreign key (naslov) references Video_zapis(naslov) on delete cascade on update cascade
);

CREATE TABLE Lista_zelbi(
naslov varchar(50),
k_ime varchar(50),
ime varchar(50),
primary key(naslov, k_ime, ime),
foreign key(naslov) references Video_zapis(naslov) on delete cascade on update cascade,
foreign key(k_ime, ime) references Profil(k_ime, ime) on delete cascade on update cascade
);

CREATE TABLE Preporaka(
ID int primary key,
k_ime_od varchar(50),
k_ime_na varchar(50),
naslov varchar(50) DEFAULT 'Deleted',
datum date,
komentar varchar(250) NOT NULL,
ocena varchar(50),
foreign key(k_ime_od) references Korisnik(k_ime) on delete cascade on update cascade,
foreign key(k_ime_na) references Korisnik(k_ime) on delete cascade on update cascade,
foreign key(naslov) references Video_zapis(naslov) on delete set default on update cascade,
CHECK(ocena BETWEEN 1 AND 5),
CHECK(datum >= '2022-12-07')
);