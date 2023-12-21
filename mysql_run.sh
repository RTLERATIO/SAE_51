docker stop $(docker ps -q)
docker volume rm vol-sql-demo

docker run --rm -d \
	-p 3307:3306\
	-v vol-sql-demo:/var/lib/mysql \
	-v /sae51/data.csv:/srv/csv \
	--name sae51-sql \
	--env MYSQL_ROOT_PASSWORD=foo \
	mysql:latest --local-infile=1 
