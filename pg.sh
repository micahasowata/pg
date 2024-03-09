#! /usr/bin/bash

echo "

░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓███████▓▒░ ░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        
░▒▓████████▓▒░▒▓██████▓▒░  ░▒▓██████▓▒░ ░▒▓██████▓▒░       ░▒▓███████▓▒░░▒▓█▓▒▒▓███▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░          ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░          ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░          ░▒▓█▓▒░       ░▒▓██████▓▒░  
                                                                                       
                                                                                       
"
echo "Set volume name"
read -r pg_volume

length_of_pg_volume=${#pg_volume}

if [ "$length_of_pg_volume" -lt 3 ]
then
    echo "volume name is too short"
    exit
fi

echo "Set container name"
read -r pg_container

length_of_pg_container=${#pg_container}

if [ "$length_of_pg_container" -lt 3 ]
then
    echo "container name is too short"
    exit
fi

echo "Set root username"
read -r pg_username

length_of_pg_username=${#pg_username}

if [ "$length_of_pg_username" -lt 3 ]
then
    echo "username is too short"
    exit
fi

echo "Set database name"
read -r pg_dbname

length_of_pg_dbname=${#pg_dbname}

if [ "$length_of_pg_dbname" -lt 3 ]
then
    echo "database name is too short"
    exit
fi

echo "Set password"
read -r pg_password

length_of_pg_password=${#pg_password}

if [ "$length_of_pg_password" -lt 8 ]
then
    echo "password is too short"
    exit
fi

echo "Set port e.g 5432"
read -r pg_port

lower_bound=1024
upper_bound=65535

if ! [[ $pg_port -ge $lower_bound && $pg_port -le $upper_bound ]]
then
    echo "$pg_port is not a valid port"
fi

trap "

░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░      ░▒▓███████▓▒░ ░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░        
░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓██████▓▒░        ░▒▓███████▓▒░░▒▓█▓▒▒▓███▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░             ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░             ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓███████▓▒░   ░▒▓█▓▒░   ░▒▓████████▓▒░      ░▒▓█▓▒░       ░▒▓██████▓▒░  
                                                                          
                                                                          
                                                                                    
" SIGHUP SIGINT SIGTERM

@docker volume create "$pg_volume"
@docker run --name "$pg_container" -e POSTGRES_USER="$pg_username" -e POSTGRES_DB="$pg_dbname" -e POSTGRES_PASSWORD="$pg_password" -d -p "$pg_port":5432 -v "$pg_volume":/var/lib/postgresql/data postgres

echo 'DSN: postgresql://'"$pg_username"':'"$pg_password"'@localhost:'"$pg_port"'/'"$pg_dbname"'?sslmode=disable'