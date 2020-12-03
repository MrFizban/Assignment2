SELECT  st.city
FROM "Match" as mt, "Stadium" as st, "Nationality" as nt
WHERE ((mt.home = nt.country) OR (mt.guest = nt.country)) AND (st.name = mt.stadium) AND
(nt.group = 'A' OR nt.group = 'B' OR nt.group = 'C')
GROUP BY st.city
ORDER BY city ASC