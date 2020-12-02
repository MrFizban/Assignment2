SELECT  mt.stadium
FROM "Match" as mt
 INNER JOIN "Stadium" as st
  ON mt.stadium = st.name
  INNER JOIN "Nationality" as nt
    ON mt.home = nt.country OR mt.guest = nt.country
WHERE nt.continent = 'Europe'
EXCEPT
SELECT  mt.stadium
FROM "Match" as mt
 INNER JOIN "Stadium" as st
  ON mt.stadium = st.name
  INNER JOIN "Nationality" as nt
    ON mt.home = nt.country OR mt.guest = nt.country
WHERE nt.continent <> 'Europe'