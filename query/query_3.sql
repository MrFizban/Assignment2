<<<<<<< HEAD
SELECT tabella.country
FROM(SELECT primo.country
    FROM(SELECT  mt.stadium, mt.date, mt.time, mt.home AS country
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home
        UNION
        SELECT  mt.stadium, mt.date, mt.time, mt.guest AS country
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home) AS primo
    WHERE primo.country = primo.country AND primo.date = primo.date AND primo.stadium <> primo.stadium
    UNION
    SELECT primo.country
    FROM(SELECT  mt.stadium, mt.date, mt.time, mt.home AS country
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home
        UNION
        SELECT  mt.stadium, mt.date, mt.time, mt.guest AS country
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home) AS primo
    WHERE (primo.time >= primo.time OR primo.time <= CAST(primo.time as time) + '02:00:00')   AND primo.date = primo.date AND primo.stadium = primo.stadium) AS tabella
GROUP BY tabella.country
ORDER BY tabella.country
=======
SELECT primo.country​
FROM    (SELECT  mt.stadium, mt.date, mt.time, mt.home AS country​
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home 
        UNION
        SELECT  mt.stadium, mt.date, mt.time, mt.guest AS country​
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home) AS primo
>>>>>>> main
