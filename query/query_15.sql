SELECT DISTINCT nt.continent,COUNT(mt)
FROM "Match" as mt
INNER JOIN "Nationality" as hm
ON mt.home = hm.country
INNER JOIN "Nationality" as gs
ON mt.home = gs.country

GROUP BY nt.continent