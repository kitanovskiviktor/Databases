SELECT k.ime, k.prezime FROM
Transakcija_bankomat tb
JOIN Smetka s ON tb.broj = s.broj
JOIN Klient k ON k.MBR_k = s.MBR_k
WHERE s.valuta = 'USD' AND tb.suma > 400
ORDER BY 1