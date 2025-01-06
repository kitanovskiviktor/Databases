WITH Gitaristi AS (
    SELECT * FROM Muzicar m
    JOIN Muzicar_instrument mi ON m.id = mi.id_muzicar
    WHERE mi.instrument = 'gitara'
)

SELECT g.ime, g.prezime FROM 
Koncert_muzicar_bend kmb
JOIN Gitaristi g ON kmb.id_muzicar = g.id
JOIN Bend b ON kmb.id_bend = b.id
JOIN Muzicar_bend mb ON mb.id_muzicar = g.id AND mb.id_bend = b.id
JOIN Koncert k  ON k.id = kmb.id_koncert
WHERE k.datum > mb.datum_napustanje