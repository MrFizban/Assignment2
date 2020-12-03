SELECT  mt.stadium, COUNT(mt.stadium)
FROM "Match" as mt
WHERE CAST(mt.time as time) > '00:06:00' AND CAST(mt.time as time) < '00:11:59'
GROUP BY mt.stadium
