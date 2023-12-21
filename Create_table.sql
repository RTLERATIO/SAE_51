CREATE DATABASE IF NOT EXISTS sae51;
USE sae51;

CREATE TABLE `Utilisateurs` (
  `utilisateur_id` INT PRIMARY KEY,
  `nom` VARCHAR(50)
);

CREATE TABLE `Machines` (
  `machine_id` INT PRIMARY KEY,
  `date_achat` DATE,
  `ram` INT,
  `utilisateur_id` INT,
  `os` VARCHAR(20),
  `marque_id` INT,
  `nom_marque` VARCHAR(50)
);

CREATE TABLE `Logiciels` (
  `logiciel_id` INT PRIMARY KEY,
  `nom` VARCHAR(50),
  `version` VARCHAR(20)
);

CREATE TABLE `Maintenance` (
  `maintenance_id` INT PRIMARY KEY,
  `machine_id` INT,
  `technicien` VARCHAR(50),
  `date_intervention` DATE
);

CREATE TABLE `Marques` (
  `marque_id` INT PRIMARY KEY,
  `nom_marque` VARCHAR(50)
);

CREATE TABLE `Machines_Logiciels` (
  `machine_id` INT,
  `logiciel_id` INT,
  `version` VARCHAR(20),
  PRIMARY KEY (machine_id, logiciel_id)
);

ALTER TABLE `Machines` ADD FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateurs` (`utilisateur_id`);
ALTER TABLE `Machines` ADD FOREIGN KEY (`marque_id`) REFERENCES `Marques` (`marque_id`);
ALTER TABLE `Maintenance` ADD FOREIGN KEY (`machine_id`) REFERENCES `Machines` (`machine_id`);
ALTER TABLE `Machines_Logiciels` ADD FOREIGN KEY (`machine_id`) REFERENCES `Machines` (`machine_id`);
ALTER TABLE `Machines_Logiciels` ADD FOREIGN KEY (`logiciel_id`) REFERENCES `Logiciels` (`logiciel_id`);

