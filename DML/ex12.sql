WITH Counter AS (
SELECT k_ime_od, naslov, COUNT(*) as cnt 
FROM Preporaka
GROUP BY naslov, k_ime_od
)

SELECT c1.k_ime_od AS k_ime, c1.naslov, cnt AS broj
FROM Counter c1
WHERE cnt=(SELECT MAX(cnt) FROM Counter c2 WHERE c1.k_ime_od = c2.k_ime_od)
ORDER BY k_ime_od