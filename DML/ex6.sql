SELECT DISTINCT pk.k_ime, p.naslov FROM 
Korisnik k
JOIN Premium_korisnik pk ON k.k_ime = pk.k_ime
JOIN Preporaka p ON pk.k_ime = p.k_ime_na
JOIN Profil pr ON pr.k_ime = pk.k_ime
JOIN Lista_zelbi lz ON lz.naslov = p.naslov AND lz.k_ime = pk.k_ime
WHERE p.ocena > 3 AND p.datum LIKE '2021%'