SELECT st.name as stadium
FROM "Stadium" as st, "Match" as mt, "Nationality" as nt
WHERE mt.home = 'Europe' OR mt.guest = 'Europe' AND (st.name = mt.stadium)
EXCEPT
SELECT st.name as stadium
FROM "Stadium" as st, "Match" as mt, "Nationality" as nt
WHERE mt.home <> 'Europe' OR mt.guest <> 'Europe'