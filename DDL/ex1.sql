CREATE TABLE Transakcija_shalter(
ID int primary key, 
ID_v int, 
MBR_k int, 
MBR_k_s int, 
broj int, 
datum date, 
suma int, 
tip varchar(50),
foreign key (ID_v) references Shalterski_rabotnik(ID) on delete set null on update cascade,
foreign key (MBR_k) references Klient(MBR_k) on delete cascade on update cascade,
foreign key (broj, MBR_k_s) references Smetka(broj, MBR_k_s) on delete cascade on update cascade,
CHECK (datum > '2021-01-14' OR datum < '2020-12-30'),
CHECK(tip = 'uplata' OR tip = 'isplata')
);


CREATE TABLE Vraboten(
ID int primary key, 
ime varchar(50), 
prezime varchar(50), 
datum_r date, 
datum_v date, 
obrazovanie varchar(50), 
plata int,
CHECK (datum_r < datum_v)
);

CREATE TABLE Shalterski_rabotnik(
ID int primary key,
foreign key (ID) references Vraboten(ID)
on delete cascade on update cascade
);