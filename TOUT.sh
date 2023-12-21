./mysql_run.sh

echo "Attente du lancement du serveur MYSQL...";

sleep 10

./Creation_table.sh

./copier.sh

./insertion.sh

./requetes.sh
