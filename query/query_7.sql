SELECT DISTINCT tabella.country
FROM(SELECT DISTINCT nt.country
    FROM "Nationality" as nt
    WHERE nt.continent = 'Europe'
    EXCEPT
    SELECT DISTINCT mt.country
    FROM "Nationality" as nt, "Stadium" as st,
            (SELECT  mt.stadium, mt.date, mt.time, mt.home AS country
            FROM "Match" as mt
            GROUP by mt.stadium, mt.date, mt.time, mt.home
            UNION
            SELECT  mt.stadium, mt.date, mt.time, mt.guest AS country
            FROM "Match" as mt
            GROUP by mt.stadium, mt.date, mt.time, mt.home) AS mt
    WHERE nt.country = mt.country AND st.name = mt.stadium AND mt.country = st.country AND nt.continent = 'Europe') AS tabella
ORDER BY tabella.country