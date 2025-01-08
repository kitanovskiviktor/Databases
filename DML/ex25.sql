WITH najmalce_dva AS (
  SELECT naslov
  FROM Lista_zelbi
  GROUP BY naslov
  HAVING COUNT(DISTINCT ime) > 1
)

SELECT vz.naslov, vz.vremetraenje, COUNT(P.naslov) AS broj_preporaki
FROM najmalce_dva nd
JOIN Video_zapis vz ON nd.naslov = vz.naslov
LEFT JOIN Preporaka p ON vz.naslov = p.naslov
GROUP BY vz.naslov