SELECT primo.country​
FROM    (SELECT  mt.stadium, mt.date, mt.time, mt.home AS country​
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home 
        UNION
        SELECT  mt.stadium, mt.date, mt.time, mt.guest AS country​
        FROM "Match" as mt
        GROUP by mt.stadium, mt.date, mt.time, mt.home) AS primo