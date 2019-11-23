#!/bin/bash


for i in `cat ./host_list.txt`

do

  for user in `cat ./username_list.txt`
  do
    ssh root@$i 'usermod -s /bin/bash $user'
    echo -e "$user \033[32m User created successfully \033[0m"
  done

done
