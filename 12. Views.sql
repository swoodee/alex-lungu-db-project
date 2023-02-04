-- 12 VIEWS

/**/
CREATE VIEW carte_view AS
SELECT * FROM carte;

SELECT * FROM carte_view;

/**/
CREATE VIEW com_cleint_view AS
SELECT
    o.comanda_id,
    FLOOR(RANDOM() * 11127) AS carte_id,
    ROUND(CAST(RANDOM() * 150 AS numeric), 2) AS pret
FROM com_client o;

SELECT * FROM com_cleint_view;