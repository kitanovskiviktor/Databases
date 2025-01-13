CREATE TABLE Vraboten(
ID int primary key,
ime varchar(50),
prezime varchar(50),
datum_r date,
datum_v date,
obrazovanie varchar(50) NOT NULL,
plata int,
CHECK(obrazovanie IN ('PhD', 'MSc', 'High School', 'BSc')),
CHECK(datum_v > datum_r)
);

CREATE TABLE Shalterski_rabotnik(
ID int primary key,
foreign key(ID) references Vraboten(ID) on update cascade on delete cascade
);

CREATE TABLE Klient(
MBR_k varchar(50) primary key,
ime varchar(50),
prezime varchar(50),
adresa varchar(50) DEFAULT 'Ne e navedena',
datum date
);

CREATE TABLE Smetka(
MBR_k varchar(50),
broj varchar(50),
valuta varchar(50),
saldo int,
primary key(MBR_k, broj),
foreign key(MBR_k) references Klient(MBR_k) on delete cascade on update cascade
);

CREATE TABLE Transakcija_shalter(
ID int primary key,
ID_v int,
MBR_k varchar(50),
MBR_k_s varchar(50),
broj varchar(50),
datum date,
suma int,
tip varchar(50),
foreign key(ID_v) references Shalterski_rabotnik(ID) on delete set null on update cascade,
foreign key(MBR_k) references Klient(MBR_k) on delete cascade on update cascade,
foreign key(MBR_k_s, broj) references Smetka(MBR_k, broj) on delete cascade on update cascade,
CHECK(tip = 'uplata' OR tip = 'isplata')
);

CREATE TABLE Bankomat(
ID int primary key,
lokacija varchar(50) UNIQUE,
datum date,
zaliha int,
CHECK(zaliha >= 0)
);

CREATE TABLE Transakcija_bankomat(
ID int primary key,
MBR_k_s varchar(50),
broj varchar(50),
ID_b int DEFAULT -1,
datum date,
suma int,
foreign key (MBR_k_s, broj) references Smetka(MBR_k, broj) on delete cascade on update cascade,
foreign key (ID_b) references Bankomat(ID) on delete set default on update cascade,
CHECK(datum < '2020-12-30' OR datum > '2021-01-14')
);