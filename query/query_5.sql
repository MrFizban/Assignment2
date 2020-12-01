SELECT st.country
FROM(SELECT st.name,st.country, MAX(st.capacity) as capacity
    FROM  "Stadium" as st
    GROUP BY st.country,st.name) AS max_stadio, "Match" as mt,  "Stadium" as st
WHERE st.name = mt.stadium AND st.country = max_stadio.country AND  st.capacity < max_stadio.capacity
GROUP BY st.country
ORDER BY st.country