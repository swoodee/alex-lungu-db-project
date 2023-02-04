-- 10 FUNCTIONS

/**/
CREATE OR REPLACE FUNCTION GetOrdersCount()
RETURNS BIGINT
LANGUAGE SQL
AS
$$
SELECT COUNT(*) AS nr_comenzi FROM com_client;
$$;

SELECT GetOrdersCount();

/**/
CREATE OR REPLACE FUNCTION GetBookID(book_id INTEGER)
RETURNS carte
LANGUAGE SQL
AS
$$
SELECT * FROM carte WHERE carte_id=book_id;
$$;

SELECT GetBookID(1);