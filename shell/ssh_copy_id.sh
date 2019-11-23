#!/bin/bash



echo -e '\n\n'
echo -e "\033[34m Batch key distribution  \033[0m"

for i in `cat ./host_list.txt`

do

password="xietong123"

/usr/bin/expect -c "

spawn ssh-copy-id  root@$i
  expect {
  \"*(yes/no)\" { send \"yes\r\";exp_continue }
  \"*password\" { send \"$password\r\"; exp_continue }
  }
expect eof"

done


echo -e '\n\n'
echo -e "\033[34m Verification  \033[0m"



for t in `cat ./host_list.txt`

do
  echo -e '\n'
  echo -e "\033[32m $t times  \033[0m"
  ssh $t date
done
