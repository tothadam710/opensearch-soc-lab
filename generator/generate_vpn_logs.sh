#!/bin/bash

LOGFILE="/logs/vpn.log"

USERS=("john" "admin" "alice" "bob" "charlie" "david" "eve")
COUNTRIES=("US" "DE" "FR" "RU" "CN" "HU" "BR" "IN")
ACTIONS=("LOGIN" "FAILED")

random_ip() {
    echo "$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))"
}

while true
do
    TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")
    
    USER=${USERS[$RANDOM % ${#USERS[@]}]}
    COUNTRY=${COUNTRIES[$RANDOM % ${#COUNTRIES[@]}]}
    ACTION=${ACTIONS[$RANDOM % ${#ACTIONS[@]}]}
    IP=$(random_ip)
    
    echo "$TIMESTAMP vpn-gateway $ACTION user=$USER src_ip=$IP country=$COUNTRY" >> $LOGFILE
    
    sleep 2
done