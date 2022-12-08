#!/bin/sh
for i in {5..1}
do
   echo "Lamp install loading: $i "
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

if or i in {5..1} == True
then
  echo "Apache2 Running"
else
  echo "Apache2 Not Running"
fi
