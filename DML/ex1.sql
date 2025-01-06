SELECT DISTINCT l.id FROM 
Lice l
JOIN Test t ON l.id = t.id
JOIN Vakcinacija v ON v.id_lice = l.id
WHERE t.rezultat = 'pozitiven' AND t.datum < (
    SELECT MIN(VD.datum)
    FROM Vakcinacija_datum VD
    WHERE VD.id_lice = L.id
)
ORDER BY 1