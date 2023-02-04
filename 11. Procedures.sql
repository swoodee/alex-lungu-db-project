-- 11 PROCEDURES

/**/
CREATE OR REPLACE PROCEDURE update_met_livrare()

LANGUAGE SQL

AS $$

  UPDATE com_client SET met_livrare_id = 1;

$$;

CALL update_met_livrare();

/**/
CREATE OR REPLACE PROCEDURE AddBook(
	carte_id_u INT,
	titlu_u VARCHAR(100),
	limba_id_u INT,
	nr_pagini_u INT,
	data_publicare_u DATE,
    redactie_id_u INT
)

LANGUAGE plpgsql

AS
$$
BEGIN
INSERT INTO carte(carte_id, titlu, limba_id, nr_pagini, data_publicare, redactie_id) values(carte_id_u, titlu_u, limba_id_u, nr_pagini_u, data_publicare_u, redactie_id_u);
END
$$;

CALL AddBook(1001, 'The long book', 6, 500, '1943-10-28', 68);