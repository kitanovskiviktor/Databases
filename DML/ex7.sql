WITH AvgustPozitivni AS (
SELECT id
FROM Test
WHERE rezultat = "pozitiven" and datum LIKE '2021-08%'
),
VakciniraniDveDozi AS (
SELECT id_lice
FROM Vakcinacija_datum
GROUP BY id_lice
HAVING count(*) = 2
),
EdnaDozaAvgust AS (
SELECT id
FROM AvgustPozitivni
WHERE id NOT IN VakciniraniDveDozi
),
VkupnoAvgustPozitivni AS (
SELECT COUNT(*) AS cntVkupno FROM AvgustPozitivni
),
EdnaDozaPozitivni AS (
SELECT COUNT(*) AS cntEdnaDoza FROM EdnaDozaAvgust
)

SELECT cntEdnaDoza * 100.0 / cntVkupno AS procent
FROM VkupnoAvgustPozitivni
JOIN EdnaDozaPozitivni
