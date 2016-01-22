#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo."
  exit
fi

array=('pip' 'redis-server' 'rqworker')
for i in "${array[@]}"
do
	command -v $i >/dev/null 2>&1 || { echo >&2 "Error: Cannot start server since command '$i' was not found."; exit 1; }
done

RED='\033[0;31m'
NC='\033[0m'


echo -e "${RED}- Installing dependicies...\n${NC}" && pip install -r requirements.txt

echo -e "${RED}- Starting redis-server...\n${NC}" && redis-server &

echo -e "${RED}- Starting rqworker...\n${NC}" && rqworker &

echo -e "${RED}- Starting python main.py...\n${NC}" && python main.py
