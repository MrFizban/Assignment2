SELECT DISTINCT team1.country AS "C1", team2.country AS "C2"
FROM
(SELECT DISTINCT st.country
    FROM "Nationality" AS nt, "Stadium" AS st
    WHERE st.country = nt.country AND st.capacity > 100000
    EXCEPT
    SELECT DISTINCT st.country
    FROM "Nationality" AS nt, "Stadium" AS st
    WHERE st.country = nt.country AND st.capacity <= 100000)
    as team1,

(SELECT DISTINCT st.country
    FROM "Nationality" AS nt, "Stadium" AS st
    WHERE st.country = nt.country AND st.capacity < 100000
    EXCEPT
    SELECT DISTINCT st.country
    FROM "Nationality" AS nt, "Stadium" AS st
    WHERE st.country = nt.country AND st.capacity >= 100000)
    as team2,

    "Match" as mt
WHERE ((mt.home = team1.country AND mt.guest = team2.country) OR (mt.home = team2.country AND mt.guest = team1.country))