CREATE TABLE Korisnik (
kor_ime varchar(50) primary key,
ime varchar(50),
prezime varchar(50),
pol varchar(50),
data_rag date,
data_reg date
);

CREATE TABLE Poseta(
id int primary key,
kor_ime varchar(50),
id_mesto int,
datum date,
foreign key(kor_ime) references Korisnik(kor_ime) on delete set null on update cascade,
foreign key(id_mesto) references Mesto(id) on update cascade on delete cascade,
CHECK(datum < '2023-02-09')
);

CREATE TABLE Korisnik_email(
kor_ime varchar(50),
email varchar(50),
primary key(kor_ime, email),
foreign key(kor_ime) references Korisnik(kor_ime) on delete cascade on update cascade,
CHECK (email LIKE '%.com' AND LENGTH(email) >= 10)
);
