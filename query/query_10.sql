SELECT DISTINCT mt.home,mt.guest
FROM(SELECT DISTINCT primo.home, primo.guest
    FROM "Match" as primo
        INNER JOIN  "Match" as secondo
            ON primo.home = secondo.guest and not primo.guest = secondo.home
    EXCEPT
    SELECT DISTINCT primo.home, primo.guest
    FROM "Match" as primo
        INNER JOIN  "Match" as secondo
            ON primo.home = secondo.guest and  primo.guest = secondo.home) as mt
ORDER BY mt.home,mt.guest