WITH CounterObjekti AS(
SELECT *, COUNT(*) AS cnt FROM
Poseta p 
JOIN Objekt o ON p.id_mesto = o.id_mesto
GROUP BY o.id_mesto
),
MaxObjekt AS (
SELECT MAX(cnt) AS maks, id_mesto FROM CounterObjekti
)

SELECT m.ime FROM Objekt o
JOIN MaxObjekt mo ON o.id_mesto = mo.id_mesto
JOIN Grad g ON g.id_mesto = o.id_grad
JOIN Mesto m ON m.id = g.id_mesto