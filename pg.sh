#! /usr/bin/bash

echo "
               _             _            _             
 _ __   __ _  (_)_ __     __| | ___   ___| | _____ _ __ 
| '_ \ / _` | | | '_ \   / _` |/ _ \ / __| |/ / _ \ '__|
| |_) | (_| | | | | | | | (_| | (_) | (__|   <  __/ |   
| .__/ \__, | |_|_| |_|  \__,_|\___/ \___|_|\_\___|_|   
|_|    |___/                                            "

echo "Set volume name"
read pg_volume

docker volume create $pg_volume

echo "Container name"
read pg_container

echo "postgres root user name"
read pg_username

echo "postgres db name"
read pg_dbname

echo "postgres root password"
read pg_password

echo "what port should it run on"
read pg_port

docker run --name $pg_container -e POSTGRES_USER=$pg_username -e POSTGRES_DB=$pg_dbname -e POSTGRES_PASSWORD=$pg_password -d -p $pg_port:5432 -v $pg_volume:/var/lib/postgresql/data postgres

echo "🥳🥳🥳🥳"