#!/bin/bash
array=( 'github.com' )
for h in "${array[@]}"
do
    #echo $h
    ip=$(dig +short $h)
    ssh-keygen -R $h
    ssh-keygen -R $ip
    ssh-keyscan -H $ip >> /root/.ssh/known_hosts
    ssh-keyscan -H $h >> /root/.ssh/known_hosts
 done