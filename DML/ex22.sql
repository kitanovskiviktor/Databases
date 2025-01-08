WITH Counter AS (
SELECT *, COUNT(*) as cnt FROM 
Korisnik k
JOIN Preporaka p ON k.k_ime = p.k_ime_od
GROUP BY k.k_ime
),
MaksIme AS (
SELECT k_ime, MAX(cnt) as maks FROM Counter
)

SELECT mi.k_ime, COUNT(*) AS dobieni_preporaki FROM 
Preporaka p
JOIN MaksIme mi ON p.k_ime_na = mi.k_ime