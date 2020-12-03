SELECT  mt.stadium
FROM "Match" as mt
    INNER JOIN "Stadium" as st
    ON mt.stadium = st.name
        INNER JOIN "Nationality" as hm
        ON mt.home = hm.country
            INNER JOIN "Nationality" as gs
                ON  mt.guest = gs.country
WHERE hm.continent = 'Europe' AND gs.continent = 'Europe'
ORDER BY mt.stadium