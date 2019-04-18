## Running mysql

docker run --rm -d -e MYSQL_ROOT_PASSWORD=8858 -p 3306:3306 mysql:5.7

## Taking DB dump

mysqldump --column-statistics=0 -uroot -p8858 -h127.0.0.1 TollApp