CREATE TABLE Vakcinacija(
id_lice int, 
id_med_lice int, 
shifra_vakcina varchar(50),
primary key (id_lice, id_med_lice, shifra_vakcina),
foreign key(id_lice) references Lice(id) on update cascade on delete set default,
foreign key(id_med_lice) references Med_lice(id) on update cascade on delete set default,
foreign key(shifra_vakcina) references Vakcina(shifra) on update cascade on delete set default,
CHECK(id_lice != id_med_lice)
);

CREATE TABLE Test(
id int, 
shifra varchar(50),
tip varchar(50), 
datum date, 
rezultat varchar(50), 
laboratorija varchar(50),
primary key(id, shifra),
foreign key(id) references Lice(id) on delete cascade on update cascade,
CHECK (laboratorija!='lab-abc' OR tip = 'seroloshki')
);

CREATE TABLE Vakcinacija_datum(
id_lice int, 
id_med_lice int, 
shifra_vakcina varchar(50), 
datum date,
primary key(id_lice, id_med_lice, shifra_vakcina, datum),
foreign key(id_lice, id_med_lice, shifra_vakcina) references Vakcinacija(id_lice, id_med_lice, shifra_vakcina)
on update cascade on delete set null
);

