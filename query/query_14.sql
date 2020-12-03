SELECT DISTINCT nt.continent, MAX(st.capacity), ROUND(AVG(st.capacity),2) as "avg"
FROM  "Nationality" as nt
LEFT OUTER JOIN "Stadium" as st
ON nt.country = st.country
GROUP BY nt.continent
ORDER BY nt.continent
