CREATE DATABASE pizzabase;
USE pizzabase;

CREATE TABLE kunden(
id INT(3) PRIMARY KEY,
vorname VARCHAR(15) NOT NULL,
nachname VARCHAR(15) NOT NULL,
email VARCHAR(25),
num_mobil VARCHAR(15) NOT NULL);

INSERT INTO kunden VALUES
(1, 'Dennis', 'Schuh', 'dennis@htl.at','0120105');
INSERT INTO kunden VALUES
(2, 'Wanda', 'Schuh', 'wanda@htl.at','0120105');
INSERT INTO kunden VALUES
(3, 'Sue', 'Peh', 'sue@htl.at','0158801');

CREATE TABLE pizzas(
id INT(3) PRIMARY KEY,
name VARCHAR(20) NOT NULL,
preis DECIMAL(4,2) NOT NULL);

INSERT INTO pizzas VALUES
(1, 'Hawaii', 9.80),
(2, 'Salami', 11.50),
(3, 'Tonno', 7.80),
(4, 'Diabolo', 12.90);

CREATE TABLE bestellungen(
best_nr INT(5) PRIMARY KEY AUTO_INCREMENT,
datum date NOT NULL,
kunden_id INT(3) NOT NULL,
pizzas_id INT(3) NOT NULL,
FOREIGN KEY(kunden_id) REFERENCES kunden(id)
ON UPDATE CASCADE
ON DELETE NO ACTION,
FOREIGN KEY(pizzas_id) REFERENCES pizzas(id)
ON UPDATE CASCADE
ON DELETE NO ACTION
);

INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES (CURRENT_DATE(), 1, 1);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES (CURRENT_DATE(), 1, 2);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-05', 1, 4);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-05', 2, 2);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-05', 2, 1);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-07', 2, 3);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-07', 3, 1);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-07', 3, 2);
INSERT INTO bestellungen (datum, kunden_id, pizzas_id)
VALUES ('2018-03-07', 3, 3);


CREATE TABLE zutaten(
id INT(3) PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL);

INSERT INTO zutaten (name) VALUES
('Tomaten'),('Käse'),('Salami'),('Thunfisch'),('Schinken'),
('Ananas'),('Pfefferoni');

CREATE TABLE belag(
pizzas_id INT(3) NOT NULL,
zutaten_id INT(3) NOT NULL,
FOREIGN KEY(pizzas_id) REFERENCES pizzas(id)
ON DELETE CASCADE on UPDATE CASCADE,
FOREIGN KEY(zutaten_id) REFERENCES zutaten(id)
ON DELETE CASCADE on UPDATE CASCADE
);

INSERT INTO belag VALUES (1,1),(1,2),(1,5),(1,6);
INSERT INTO belag VALUES (2,1),(2,2),(2,3);
INSERT INTO belag VALUES (3,1),(3,2),(3,4);
INSERT INTO belag VALUES (4,1),(4,2),(4,3),(4,5),(4,7);
