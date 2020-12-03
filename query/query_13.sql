SELECT st.name, COUNT(mt.stadium)
FROM "Stadium" as st
LEFT OUTER JOIN (SELECT  *
        FROM "Match" as mt
        WHERE CAST(mt.time as time) > '00:06:00' AND CAST(mt.time as time) < '00:11:59') as mt
ON mt.stadium = st.name
GROUP BY st.name

