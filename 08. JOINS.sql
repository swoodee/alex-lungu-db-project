-- 08 JOINS

/**/
SELECT * FROM carte
INNER JOIN autor_carte
ON carte.carte_id=autor_carte.carte_id;

/**/
SELECT c.titlu Titlu_carte, c.nr_pagini Numar_file, a.autor_id ID_autor FROM carte AS c
INNER JOIN autor AS au
ON c.carte_id=au.autor_id
INNER JOIN autor_carte AS a
ON au.autor_id=a.carte_id;

/**/
SELECT *
FROM carte
LEFT JOIN autor_carte
ON carte.carte_id = autor_carte.carte_id
LEFT JOIN autor
ON autor_carte.autor_id = autor.autor_id;