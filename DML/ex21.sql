SELECT DISTINCT k.ime, k.prezime FROM
Korisnik k
JOIN Premium_korisnik pk ON k.k_ime = pk.k_ime
JOIN Preporaka p ON p.k_ime_od = k.k_ime
JOIN Video_zapis vz ON p.naslov = vz.naslov
WHERE vz.vremetraenje > 120 AND p.ocena >= 4
ORDER BY k.datum_reg
