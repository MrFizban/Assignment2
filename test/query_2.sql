SELECT  st.city
FROM "Match" as mt, "Stadium" as st, "Nationality" as hm, "Nationality" as gs
WHERE ((mt.home = hm.country) AND (mt.guest = gs.country) AND (st.name = mt.stadium)) AND
((hm.continent = 'South America') AND  (gs.continent = 'South America'))
GROUP BY st.city
ORDER BY city ASC