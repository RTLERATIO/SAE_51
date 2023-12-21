#!/bin/bash
DB_USER="root"
DB_PASSWORD="foo"
DB_HOST="127.0.0.1"
DB_PORT="3307"
DB_NAME="sae51"

execute_query() {
    query="$1"
    echo "Requête SQL: $query"

    result=$(mysql -u"$DB_USER" -p"$DB_PASSWORD" -h"$DB_HOST" --port="$DB_PORT" -D "$DB_NAME" -e "$query" --skip-column-names 2>/dev/null )
    echo "$result"
    echo "----------------------------------------"
}

queries=(
    "SELECT Machines.* FROM Machines JOIN Marques ON Machines.marque_id = Marques.marque_id WHERE Machines.nom_marque = 'HP';"
    "SELECT * FROM Machines WHERE date_achat BETWEEN '2021-01-01' AND '2022-12-31';"
    "SELECT Machines.* FROM Machines WHERE Machines.nom_marque = 'HP' AND date_achat BETWEEN '2021-01-01' AND '2022-12-31';"
    "SELECT COUNT(*) FROM Machines WHERE nom_marque = 'Dell';"
    "SELECT * FROM Machines WHERE ram BETWEEN 4 AND 8;"
    "SELECT Logiciels.nom, Logiciels.version FROM Logiciels JOIN Machines_Logiciels ON Logiciels.logiciel_id = Machines_Logiciels.logiciel_id JOIN Machines ON Machines_Logiciels.machine_id = Machines.machine_id WHERE Machines_Logiciels.machine_id = 3;"
    "SELECT Logiciels.nom, Logiciels.version FROM Logiciels JOIN Machines_Logiciels ON Logiciels.logiciel_id = Machines_Logiciels.logiciel_id JOIN Machines ON Machines_Logiciels.machine_id = Machines.machine_id JOIN Utilisateurs ON Machines.utilisateur_id = Utilisateurs.utilisateur_id WHERE Utilisateurs.nom = 'Duchmoll';"
    "SELECT Utilisateurs.nom FROM Utilisateurs JOIN Machines ON Utilisateurs.utilisateur_id = Machines.utilisateur_id WHERE Machines.nom_marque = 'HP';"
    "SELECT Utilisateurs.nom FROM Utilisateurs JOIN Machines ON Utilisateurs.utilisateur_id = Machines.utilisateur_id WHERE Machines.nom_marque = 'HP' AND Machines.os = 'Windows';"
    "SELECT Machines.* FROM Machines JOIN Maintenance ON Machines.machine_id = Maintenance.machine_id WHERE Maintenance.date_intervention BETWEEN '2021-10-10' AND '2021-12-10';"
    "SELECT Machines.* FROM Machines JOIN Maintenance ON Machines.machine_id = Maintenance.machine_id WHERE Maintenance.technicien = 'Jean Neymar';"
    "SELECT Machines.* FROM Machines JOIN Maintenance ON Machines.machine_id = Maintenance.machine_id WHERE Maintenance.technicien = 'Jean Neymar' AND Maintenance.date_intervention BETWEEN '2021-01-01' AND '2021-12-30';"
)



for query in "${queries[@]}"; do
    execute_query "$query"
done

