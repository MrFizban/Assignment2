SELECT DISTINCT nt.continent, MAX(st.capacity), AVG(st.capacity)
FROM  "Nationality" as nt
INNER JOIN "Stadium" as st
ON nt.country = st.country
GROUP BY nt.continent
ORDER BY nt.continent