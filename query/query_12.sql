SELECT tabella.stadium, tabella.date, tabella.time, tabella.home, tabella.guest
FROM
    (SELECT *
        FROM "Match" as mt
        EXCEPT
        SELECT mt.stadium, mt.date, mt.time, mt.home, mt.guest
        FROM "Match" as mt
        INNER JOIN
            (SELECT MAX(mt.time) as time
            FROM "Match" as mt
            INNER JOIN
                (SELECT MAX(mt.date) as date
                FROM "Match" as mt) as giorno
            ON giorno.date = mt.date) as ora
        ON ora.time = mt.time
        INNER JOIN
            (SELECT MAX(mt.date) as date
            FROM "Match" as mt) as giorno
        ON giorno.date = mt.date) as tabella
INNER JOIN
    (SELECT MAX(tabella.time) as time
    FROM
        (SELECT *
        FROM "Match" as mt
        EXCEPT
        SELECT mt.stadium, mt.date, mt.time, mt.home, mt.guest
        FROM "Match" as mt
        INNER JOIN
            (SELECT MAX(mt.time) as time
            FROM "Match" as mt
            INNER JOIN
                (SELECT MAX(mt.date) as date
                FROM "Match" as mt) as giorno
            ON giorno.date = mt.date) as ora
        ON ora.time = mt.time
        INNER JOIN
            (SELECT MAX(mt.date) as date
            FROM "Match" as mt) as giorno
        ON giorno.date = mt.date) as tabella
    INNER JOIN
        (SELECT MAX(tabella.date) as date
        FROM(SELECT *
            FROM "Match" as mt
            EXCEPT
            SELECT mt.stadium, mt.date, mt.time, mt.home, mt.guest
            FROM "Match" as mt
            INNER JOIN
                (SELECT MAX(mt.time) as time
                FROM "Match" as mt
                INNER JOIN
                    (SELECT MAX(mt.date) as date
                    FROM "Match" as mt) as giorno
                ON giorno.date = mt.date) as ora
            ON ora.time = mt.time
            INNER JOIN
                (SELECT MAX(mt.date) as date
                FROM "Match" as mt) as giorno
            ON giorno.date = mt.date) as tabella) as giorno
    ON tabella.date = giorno.date) as ora
ON tabella.time = ora.time
INNER JOIN
    (SELECT MAX(tabella.date) as date
    FROM(SELECT *
        FROM "Match" as mt
        EXCEPT
        SELECT mt.stadium, mt.date, mt.time, mt.home, mt.guest
        FROM "Match" as mt
        INNER JOIN
            (SELECT MAX(mt.time) as time
            FROM "Match" as mt
            INNER JOIN
                (SELECT MAX(mt.date) as date
                FROM "Match" as mt) as giorno
            ON giorno.date = mt.date) as ora
        ON ora.time = mt.time
        INNER JOIN
            (SELECT MAX(mt.date) as date
            FROM "Match" as mt) as giorno
        ON giorno.date = mt.date) as tabella) as giorno
ON tabella.date = giorno.date
