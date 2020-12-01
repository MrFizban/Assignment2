SELECT  st.country
FROM "Match" as mt, "Stadium" as st, "Nationality" as nt
WHERE ((mt.home = nt.country) OR (mt.guest = nt.country)) AND (st.name = mt.stadium) AND
GROUP BY st.city
ORDER BY city ASC