SELECT st.name, st.capacity
FROM "Match" as mt, "Stadium" as st, "Nationality" as hm, "Nationality" as gs
WHERE ((mt.home = hm.country) AND (mt.guest = gs.country) AND (st.name = mt.stadium))
    AND
    (((hm.continent = 'Europe') AND (hm.group = 'A')) OR  ((gs.continent = 'Europe')AND (gs.group = 'A')))
GROUP BY st.name, st.capacity
ORDER BY st.name