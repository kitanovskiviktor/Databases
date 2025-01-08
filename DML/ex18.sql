SELECT k.MBR_k, k.ime, k.prezime, k.adresa, k.datum FROM
Klient k
JOIN Smetka s ON k.MBR_k = s.MBR_k
JOIN Transakcija_bankomat tb ON s.broj = tb.broj
WHERE s.valuta = 'EUR' AND s.broj NOT IN (SELECT broj FROM Transakcija_shalter)
ORDER BY 2