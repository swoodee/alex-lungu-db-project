-- 04 INSERTS

--DELETE all data from table named “adresa_client”
DELETE FROM adresa_client;

--INSERT all clients into table named “adresa_client”
INSERT INTO adresa_client (client_id, adresa_id, status_id)
SELECT c.client_id,
       (SELECT adresa_id
    FROM adresa
    WHERE c=c
    ORDER BY RANDOM()
    LIMIT 1),
    1
FROM client c;

--INSERT clients with the "status_id = 2" (inactive address) into the table named “adresa_client”
INSERT INTO adresa_client (client_id, adresa_id, status_id)
SELECT client_id, adresa_id, 2
FROM (
         SELECT ca.client_id,
                (SELECT adresa_id
                 FROM adresa
                WHERE ca=ca
                 ORDER BY RANDOM()
                 LIMIT 1) AS adresa_id
         FROM adresa_client ca
         WHERE ca=ca
         ORDER BY RANDOM()

     ) sub
WHERE NOT EXISTS (
    SELECT 1
    FROM adresa_client c
    WHERE c.client_id = sub.client_id
    AND c.adresa_id = sub.adresa_id
    )
LIMIT 200;

--INSERT 500 orders into the table named “com_client”
INSERT INTO com_client (data_comanda, client_id, met_livrare_id, adresa_destinatie_id)
SELECT
    (NOW() - FLOOR(RANDOM() * 365 * 3 * 24 * 60 * 60) * '1 second'::interval) AS data_comanda,
    c.client_id,
    FLOOR(1 + RANDOM() * 4) AS met_livrare_id,
    ca.adresa_id
FROM client c
INNER JOIN adresa_client ca ON c.client_id = ca.client_id
LIMIT 500;

--INSERT INTO "coada_com" a line for all orders that we have
INSERT INTO coada_com (comanda_id, carte_id, pret)
SELECT
    o.comanda_id,
    FLOOR(RANDOM() * 11127) AS carte_id,
    ROUND(CAST(RANDOM() * 20 AS numeric), 2) AS pret
FROM com_client o;

--DELETE all data from table named “ist_coemnzi”
DELETE FROM ist_comenzi;

--INSERT all orders received older than 12 hours
INSERT INTO ist_comenzi (comanda_id, status_id, data_status)
SELECT
o.comanda_id,
1 AS status_id,
o.data_comanda + FLOOR(RANDOM() * 60 * 60 * 12) * '1 second'::interval AS data_status
FROM com_client o
WHERE o.data_comanda < NOW() - '12 hours'::interval;

--INSERT 50 cancelled orders
INSERT INTO ist_comenzi (comanda_id, status_id, data_status)
SELECT
o.comanda_id,
5 AS status_id,
o.data_status + FLOOR(RANDOM() * 60 * 60 * 24) * '1 second'::interval AS data_status
FROM ist_comenzi o
WHERE o.status_id = 1
AND NOT EXISTS (
    SELECT 1
    FROM ist_comenzi oh
    WHERE oh.comanda_id = o.comanda_id
    AND oh.status_id = 2
)
ORDER BY RANDOM()
LIMIT 50;

--INSERT 50 returned orders from the last 7 days
INSERT INTO ist_comenzi (comanda_id, status_id, data_status)
SELECT
o.comanda_id,
6 AS status_id,
o.data_status + FLOOR(RANDOM() * 60 * 60 * 24 * 7) * '1 second'::interval AS data_status
FROM ist_comenzi o
WHERE o.status_id = 1
AND EXISTS (
    SELECT 1
    FROM ist_comenzi oh
    WHERE oh.comanda_id = o.comanda_id
    AND oh.status_id = 4
)
AND o.data_status < NOW() - '7 days'::interval
ORDER BY RANDOM()
LIMIT 50;