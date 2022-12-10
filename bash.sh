#!/bin/sh

echo "Enter password for LAMP install"
read pass
if [ $pass="password" ]
then
  echo "Password correct - LAMP install initiated"
else
  echo "Password incorrect - Please re-enter correct password"
fi

for i in {5..1}
do
   echo "LAMP install loading: $i "
   sleep 1
done

#LAMP INSTALL
sudo apt update
sudo apt upgrade -y
sudo apt install apache2 -y
sudo systemctl status apache2
sudo apt install mariadb-server mariadb-client -y
sudo systemctl status mariadb
sudo mysql_secure_installation
sudo apt install php php-mysql php-xml php-mbstring libapache2-mod-php -y


