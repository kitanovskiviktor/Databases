SELECT b1.ime AS B1, b2.ime AS B2 FROM
Bend b1
JOIN Bend b2 ON b1.godina_osnovanje = b2.godina_osnovanje AND b1.id <> b2.id AND b1.ime > b2.ime