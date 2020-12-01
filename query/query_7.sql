SELECT DISTINCT nt.country
FROM  "Match" as mt, "Nationality" as nt
WHERE nt.continent = 'Europe' and nt.country <> mt.home

