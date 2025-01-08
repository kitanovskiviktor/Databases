SELECT s.MBR_k, s.broj, AVG(tb.suma) AS prosechna_isplata_bankomat, AVG(ts.suma) prosechna_isplata_shalter  FROM
Smetka s
JOIN Transakcija_shalter ts ON s.broj = ts.broj
JOIN Transakcija_bankomat tb ON s.broj = tb.broj
WHERE ts.tip = 'isplata' AND (s.valuta = 'EUR' OR s.valuta = 'USD') AND ts.datum LIKE '2021%' AND tb.datum LIKE '2021%'
GROUP BY s.broj
