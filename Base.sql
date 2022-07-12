CREATE TABLE `users` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `administrateur` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO administrateur(username ,email, password) VALUES ('rabe','rabe@gmail.com',SHA('1234'));
INSERT INTO administrateur(username ,email, password) VALUES ('rakoto','rakoto@gmail.com','0000');

CREATE TABLE IF NOT EXISTS `types` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `types` varchar(50) NOT NULL,
`remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `vehicule` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `numero` int(11) NOT NULL,
 `idtype` int(11) NOT NULL,
 `remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`idtype`) REFERENCES types(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `place` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `numero` int(11) NOT NULL,
`remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

ALTER TABLE place ADD
taille INT(11);

INSERT INTO place(numero , remarque) values ('101','none');
INSERT INTO place(numero , remarque) values ('102','none');
INSERT INTO place(numero , remarque) values ('103','none');
INSERT INTO place(numero , remarque) values ('104','none');
INSERT INTO place(numero , remarque) values ('105','none');
INSERT INTO place(numero , remarque) values ('106','none');

CREATE TABLE IF NOT EXISTS `Parking` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`idPlace` int(50) NOT NULL,
`idTarif` int(50) NOT NULL,
`numVehicule` int(50) NOT NULL,
`dateDebut` datetime,
`remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`idPlace`) REFERENCES place(`id`),
 FOREIGN KEY (`idTarif`) REFERENCES tarif(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

ALTER TABLE Parking 
ADD duree time;

CREATE TABLE IF NOT EXISTS `tarif` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `durree` time,
 `montant` real,
`remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

INSERT INTO tarif(durree , montant , remarque) VALUES ('15:00','1000','none');
INSERT INTO tarif(durree , montant , remarque) VALUES ('30:00','3000','none');
INSERT INTO tarif(durree , montant , remarque) VALUES ('60:00','5000','none');

CREATE TABLE IF NOT EXISTS `Ammende` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`idParking` int(11) NOT NULL,
`tempsMin` time,
`tempsMax` time,
`montant` real,
`remarque` varchar(50) NOT NULL,
 PRIMARY KEY (`id`),
 FOREIGN KEY (`idParking`) REFERENCES parking(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;


