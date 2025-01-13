
CREATE TABLE Bend(
id int primary key, 
ime varchar(50), 
godina_osnovanje int
CHECK(godina_osnovanje>=1970)
);

CREATE TABLE Festival_bend(
id_festival int, 
datum_od date, 
id_bend int,
primary key(id_festival, datum_od, id_bend),
foreign key (datum_od, id_festival) references Festival_odrzuvanje(datum_od, id) on update cascade on delete cascade,
foreign key (id_bend) references Bend(id) on update cascade on delete set default,
CHECK(id_festival != 2 OR id_bend != 5)
);

CREATE TABLE Bend_zanr(
id_bend int, 
zanr varchar(50),
primary key(id_bend, zanr),
foreign key(id_bend) references Bend(id) on delete cascade on update cascade
);
