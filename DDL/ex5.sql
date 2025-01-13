CREATE TABLE Video_zapis(
naslov varchar(50) primary key,
jazik varchar(50),
vremetraenje int,
datum_d date,
datum_p date
);

CREATE TABLE Preporaka(
ID int primary key,
k_ime_od varchar(50),
k_ime_na varchar(50),
naslov varchar(50),
datum date,
komentar varchar(50),
ocena int,
foreign key(k_ime_od) references Korisnik(k_ime) on update cascade on delete set null,
foreign key(k_ime_na) references Korisnik(k_ime) on update cascade on delete cascade,
foreign key(naslov) references Video_zapis(naslov) on update cascade on delete cascade,
CHECK(k_ime_od <> k_ime_na),
CHECK(datum < CURRENT_DATE)
);

CREATE TABLE Video_zapis_zanr(
naslov varchar(50),
zanr varchar(50),
primary key(naslov, zanr),
foreign key(naslov) references Video_zapis(naslov) on delete cascade on update cascade
);