SELECT  st.country
FROM "Stadium" as st
WHERE st.capacity = (SELECT MAX(st.capacity) FROM "Stadium" as st)
GROUP BY st.country
ORDER BY st.country ASC