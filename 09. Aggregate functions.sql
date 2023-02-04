-- 09 AGGREGATE FUNCTIONS

/**/
SELECT AVG(comanda_id)::INTEGER AS com_avg FROM com_client;

/**/
SELECT COUNT(*) AS nr_comenzi FROM com_client;
SELECT COUNT(distinct client_id) AS clienti_unici FROM com_client;

/**/
SELECT data_publicare,COUNT(*) FROM carte 
WHERE data_publicare > '2020-01-01'
GROUP BY data_publicare;