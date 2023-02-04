-- 05 SELECTS

/**/
SELECT
    o.comanda_id,
   (SELECT carte_id
     FROM carte
        WHERE o=o
     ORDER BY RANDOM()
     LIMIT 1) AS carte_id,
    ROUND(CAST(RANDOM() * 150 AS numeric), 2) AS pret
FROM com_client o;

/**/
SELECT
    o.comanda_id,
    FLOOR(RANDOM() * 11127) AS carte_id,
    ROUND(CAST(RANDOM() * 150 AS numeric), 2) AS pret
FROM com_client o;
