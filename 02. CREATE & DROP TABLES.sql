-- 02 CREATE & DROP TABLES

--DROP table named “autor”
DROP TABLE autor;
--CREARE table named “autor”
CREATE TABLE autor (
    autor_id INT NOT NULL,
    nume_autor VARCHAR(100) NOT NULL,
    CONSTRAINT pk_autor PRIMARY KEY (autor_id)
);

--DROP table named “redactie”
DROP TABLE redactie;
--CREARE table named “redactie”
CREATE TABLE redactie (
    redactie_id INT NOT NULL,
    nume_redactie VARCHAR(100) NOT NULL,
    CONSTRAINT pk_redactie PRIMARY KEY (redactie_id)
);

--DROP table named “limba_carte”
DROP TABLE limba_carte;
--CREARE table named “limba_carte”
CREATE TABLE limba_carte (
    limba_id INT NOT NULL,
    nume_limba VARCHAR(100) NOT NULL,
    CONSTRAINT pk_limba_carte PRIMARY KEY (limba_id)
);

--DROP table named “carte”
DROP TABLE carte;
--CREARE table named “carte”
CREATE TABLE carte (
    carte_id INT NOT NULL,
	titlu VARCHAR(100) NOT NULL,
	limba_id INT NOT NULL,
	nr_pagini INT NOT NULL,
	data_publicare DATE NOT NULL,
    redactie_id INT NOT NULL,
    CONSTRAINT pk_carte PRIMARY KEY (carte_id),
    CONSTRAINT fk_limba_carte FOREIGN KEY (limba_id) REFERENCES limba_carte (limba_id),
    CONSTRAINT fk_redactie FOREIGN KEY (redactie_id) REFERENCES redactie (redactie_id)
);

--DROP table named “autor_carte”
DROP TABLE autor_carte;
--CREARE table named “autor_carte”
CREATE TABLE autor_carte (
    carte_id INT NOT NULL,
    autor_id INT NOT NULL,
    CONSTRAINT pk_autor_carte PRIMARY KEY (carte_id, autor_id),
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autor (autor_id)
);

--DROP table named “status_adresa”
DROP TABLE status_adresa;
--CREARE table named “status_adresa”
CREATE TABLE status_adresa (
    status_id INT NOT NULL,
    status_adresa VARCHAR(35) NOT NULL,
    CONSTRAINT pk_status_adresa PRIMARY KEY (status_id)
);

--DROP table named “tara”
DROP TABLE tara;
--CREARE table named “tara”
CREATE TABLE tara (
    tara_id INT NOT NULL,
    nume_tara VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tara PRIMARY KEY (tara_id)
);

--DROP table named “adresa”
DROP TABLE adresa;
--CREARE table named “adresa”
CREATE TABLE adresa (
    adresa_id INT NOT NULL,
    nume_strada VARCHAR(35) NOT NULL,
    numar_strada VARCHAR(35) NOT NULL,
    oras VARCHAR(35) NOT NULL,
    tara_id INT NOT NULL,
    CONSTRAINT pk_adresa PRIMARY KEY (adresa_id),
    CONSTRAINT fk_tara FOREIGN KEY (tara_id) REFERENCES tara (tara_id)
);

--DROP table named “client”
DROP TABLE client;
--CREARE table named “client”
CREATE TABLE client (
    client_id INT NOT NULL,
    nume VARCHAR(35) NOT NULL,
    prenume VARCHAR(35) NOT NULL,
    email VARCHAR(35) NOT NULL,
    CONSTRAINT pk_client PRIMARY KEY (client_id)
);

--DROP table named “adresa_client”
DROP TABLE adresa_client;
--CREARE table named “adresa_client”
CREATE TABLE adresa_client (
    client_id INT NOT NULL,
    adresa_id INT NOT NULL,
    status_id INT NOT NULL,
    CONSTRAINT pk_adresa_client PRIMARY KEY (client_id, adresa_id),
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client (client_id),
    CONSTRAINT fk_adresa FOREIGN KEY (adresa_id) REFERENCES adresa (adresa_id)
);

--DROP table named “met_livrare”
DROP TABLE met_livrare;
--CREARE table named “met_livrare”
CREATE TABLE met_livrare (
    met_livrare_id INT NOT NULL,
	nume_met_livrare VARCHAR(35) NOT NULL,
    cost INT NOT NULL,
    CONSTRAINT pk_met_livrare PRIMARY KEY (met_livrare_id)
);

--DROP table named “com_client”
DROP TABLE com_client;
--CREARE table named “com_client”
CREATE TABLE com_client (
    comanda_id SERIAL,
    data_comanda DATE NOT NULL,
    client_id INT NOT NULL,
    met_livrare_id INT NOT NULL,
    adresa_destinatie_id INT NOT NULL,
    CONSTRAINT pk_comanda PRIMARY KEY (comanda_id),
    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES client (client_id),
    CONSTRAINT fk_adresa FOREIGN KEY (adresa_destinatie_id) REFERENCES adresa (adresa_id)
);

--DROP table named “status_com”
DROP TABLE status_com;
--CREARE table named “status_com”
CREATE TABLE status_com (
    status_id INT NOT NULL,
    valoare_status VARCHAR(35) NOT NULL,
    CONSTRAINT pk_status PRIMARY KEY (status_id)
);

--DROP table named “coada_com”
DROP TABLE coada_com;
--CREARE table named “coada_com”
CREATE TABLE coada_com (
    coada_id SERIAL,
    comanda_id INT NOT NULL,
    carte_id INT NOT NULL,
    pret INT NOT NULL,
    CONSTRAINT pk_coada PRIMARY KEY (comanda_id),
    CONSTRAINT fk_comanda FOREIGN KEY (comanda_id) REFERENCES com_client (comanda_id)
);

--DROP table named “ist_comenzi”
DROP TABLE ist_comenzi;
--CREARE table named “ist_comenzi”
CREATE TABLE ist_comenzi (
    istoric_id SERIAL,
    comanda_id INT NOT NULL,
    status_id INT NOT NULL,
    data_status DATE NOT NULL,
    CONSTRAINT pk_ist_comenzi PRIMARY KEY (istoric_id),
    CONSTRAINT fk_comanda FOREIGN KEY (comanda_id) REFERENCES com_client (comanda_id),
    CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES status_com (status_id)
);