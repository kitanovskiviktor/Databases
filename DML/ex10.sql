WITH CounterPoseti AS (
SELECT *, COUNT(*) AS cnt FROM 
Poseta p
JOIN Mesto m ON p.id_mesto = m.id
JOIN Grad g ON g.id_mesto = m.id
GROUP BY g.id_mesto
),
MaxPoseta AS (
SELECT MAX(cnt) AS maks, id_mesto FROM CounterPoseti
)

SELECT m.ime FROM MaxPoseta mp
JOIN Objekt o ON mp.id_mesto = o.id_grad
JOIN Mesto m ON m.id = o.id_mesto
ORDER BY 1 DESC
