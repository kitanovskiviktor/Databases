SELECT vzz.zanr, COUNT(*) AS broj_zanrovi FROM
Video_zapis_zanr vzz 
JOIN Video_zapis vz ON vzz.naslov = vz.naslov
JOIN Preporaka p ON p.naslov = vz.naslov
WHERE p.komentar LIKE '%interesting%'
GROUP BY vzz.zanr