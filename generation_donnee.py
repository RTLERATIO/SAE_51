import csv
from faker import Faker
import random

fake = Faker()

# Noms de marque de machine spécifiés
marques = ['HP', 'Lenovo', 'DELL', 'MSI']

# Noms spécifiés pour technicien et utilisateur et logiciel
technicien_nom = ["Jean Neymar", "Marie Curie", "Pierre Dupont", "Eléna Martin", "Sofia Lopez", "Victor Reynaud", "Emma Lambert", "Antoine Girard", "Léa Bernard"]
utilisateur_nom = ["M. Duchmoll", "Lucas Dubois", "Hugo Lefevre", "Clara Moreau", "Nathan Leroux", "Manon Chevalier", "Théo Roy", "Alexandre Fournier", "Maëlys Dupont"]
noms_logiciels = ["Office Suite", "Adobe Photoshop", "AutoCAD", "Visual Studio", "Chrome"]

# Nombre de lignes à générer
nombre_lignes = 100

# Fonction pour générer un fichier CSV pour une table donnée
def generer_fichier_csv(nom_fichier, en_tete, lignes):
    with open(nom_fichier, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(en_tete)
        csvwriter.writerows(lignes)

# Générer le fichier CSV pour la table 'logiciel'
logiciel_en_tete = ['logiciel_id', 'nom', 'version']
logiciel_lignes = [[i, f"'{random.choice(noms_logiciels)}'", f"'{fake.random_int(min=1, max=10)}'"] for i in range(1, nombre_lignes + 1)]
generer_fichier_csv('logiciel.csv', logiciel_en_tete, logiciel_lignes)

# Générer le fichier CSV pour la table 'utilisateur'
utilisateur_en_tete = ['utilisateur_id', 'nom']
utilisateur_lignes = [[i, f"'{random.choice(utilisateur_nom)}'"] for i in range(1, nombre_lignes + 1)]
generer_fichier_csv('utilisateur.csv', utilisateur_en_tete, utilisateur_lignes)

# Générer le fichier CSV pour la table 'marque'
marque_en_tete = ['marque_id', 'nom_marque']
marque_lignes = [[i, f"'{marque}'"] for i, marque in enumerate(marques, start=1)]
generer_fichier_csv('marque.csv', marque_en_tete, marque_lignes)

# Générer le fichier CSV pour la table 'machine'
machine_en_tete = ['machine_id', 'marque_id', 'date_achat', 'ram', 'utilisateur_id']
machine_lignes = [[i, fake.random_int(min=1, max=len(marques)), fake.date_between(start_date='-5y', end_date='today').strftime('%Y-%m-%d'), fake.random_int(min=2, max=64), fake.random_int(min=1, max=nombre_lignes)] for i in range(1, nombre_lignes + 1)]
generer_fichier_csv('machine.csv', machine_en_tete, machine_lignes)

# Générer le fichier CSV pour la table 'maintenance'
maintenance_en_tete = ['maintenance_id', 'machine_id', 'technicien', 'date_intervention']
maintenance_lignes = [[i, f"'{fake.random_int(min=1, max=nombre_lignes)}'", f"'{random.choice(technicien_nom)}'", fake.date_between(start_date='-5y', end_date='today').strftime('%Y-%m-%d')] for i in range(1, nombre_lignes + 1)]
generer_fichier_csv('maintenance.csv', maintenance_en_tete, maintenance_lignes)

# Générer le fichier CSV pour la table 'machine_logiciel'
machine_logiciel_en_tete = ['machine_id', 'logiciel_id']
machine_logiciel_lignes = [[i, f"'{fake.random_int(min=1, max=nombre_lignes)}'", fake.random_int(min=1, max=nombre_lignes)] for i in range(1, nombre_lignes + 1)]
generer_fichier_csv('machine_logiciel.csv', machine_logiciel_en_tete, machine_logiciel_lignes)

