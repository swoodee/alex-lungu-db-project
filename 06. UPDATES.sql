-- 06 UPDATES

-- We want to urgentate the shipping of certain orders so we change the shipping from Standard to Priority
UPDATE com_client SET met_livrare_id='2' WHERE comanda_id IN (1,2);

-- We want to change the number of pages of a certain book because we're seen an error
UPDATE carte SET nr_pagini='123' WHERE carte_id=2 AND redactie_id=102;

-- We want to update the shipping methond only for those orders where "comanda_id" is present inside the "coada_com" table
UPDATE com_client SET met_livrare_id='2' WHERE comanda_id IN -- step 3 update
(
	SELECT comanda_id FROM coada_com WHERE coada_id = 29
);