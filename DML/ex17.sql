SELECT s.MBR_k, s.broj, s.valuta, s.saldo FROM
Smetka s 
JOIN Transakcija_bankomat tb ON s.broj = tb.broj
JOIN Transakcija_shalter ts ON s.broj = ts.broj
WHERE s.valuta = 'MKD' AND ts.datum LIKE '2021%' AND ts.tip = 'isplata' AND tb.datum LIKE '2021%'
ORDER BY s.broj