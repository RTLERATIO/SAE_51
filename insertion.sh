#!/bin/bash
mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/utilisateurs.csv'
INTO TABLE Utilisateurs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"

mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/marques.csv'
INTO TABLE Marques
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"

mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/machines.csv'
INTO TABLE Machines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"


mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/logiciels.csv'
INTO TABLE Logiciels
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"

mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/maintenances.csv'
INTO TABLE Maintenance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"

mysql -u root -p'foo' -h 127.0.0.1 --port 3307 -e "USE sae51
LOAD DATA INFILE '/var/lib/mysql-files/lien_machine_logiciel.csv'
INTO TABLE Machines_Logiciels
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;"
