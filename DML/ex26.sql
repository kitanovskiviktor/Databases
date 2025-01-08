SELECT DISTINCT P.k_ime_od
FROM Korisnik K
JOIN Preporaka P ON K.k_ime = P.k_ime_od
WHERE P.naslov NOT IN (
    SELECT LZ.naslov
    FROM Lista_zelbi LZ
    WHERE LZ.k_ime = K.k_ime
)