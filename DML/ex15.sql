SELECT v.ime, v.prezime FROM
Vraboten v
JOIN Shalterski_rabotnik sr ON v.id = sr.id
JOIN Transakcija_shalter sh ON sh.ID_v = sr.id
JOIN Smetka s ON s.broj = sh.broj
WHERE sh.suma > 1000 AND s.valuta = 'EUR' AND sh.tip = 'isplata'
ORDER BY v.ime