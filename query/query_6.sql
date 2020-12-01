SELECT DISTINCT st.country
FROM "Nationality" AS nt, "Stadium" AS st
WHERE st.country = nt.country AND st.capacity > 20000
EXCEPT
SELECT DISTINCT st.country
FROM "Nationality" AS nt, "Stadium" AS st
WHERE st.country = nt.country AND st.capacity <= 20000
