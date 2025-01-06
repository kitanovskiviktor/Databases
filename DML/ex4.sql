WITH Poseti AS (SELECT * FROM Korisnik
NATURAL JOIN Poseta
NATURAL JOIN Objekt
)

SELECT DISTINCT p1.ime, p1.prezime FROM
Poseti p1, Poseti p2, Sosedi
WHERE p1.ime = p2.ime AND p1.id_grad = grad1 AND p2.id_grad = grad2 AND rastojanie < 300