#!/bin/sh

#IF ELSE AND USER INPUT
echo "Enter LAMP to begin LAMP install"
read pass
if [ $pass="LAMP" ]
then
  echo "LAMP install initiated"
else
  echo "Unknown - please try again"
fi

#LOOP
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

#WRITE TO FILE
date >> LAMPINSTALL.txt
echo "LAMP install completed and up to date" >> LAMPINSTALL.txt
echo "" >> LAMPINSTALL.txt

echo ""
echo "LAMPINSTALL Logged"

#EMAIL
echo "Hello, You're LAMP software on your machine has been installed and updated!" | mail -s "Software Update" "c1018102@hallam.shu.ac.uk"
echo ""
echo "Email sent"

#CASE STATEMENT
echo ""
echo "Application Install Checker"
echo "1 - Apache2"
echo "2 - Nginx"
echo "3 - PHP"
echo "4 - MariaDB"
read app;
case $app in
  1) echo "Apache2 is installed!";;
  2) echo "Ngnix is not installed!";;
  3) echo "PHP is installed!";;
  4) echo "MariaDB is installed!";;
  *) echo "Unknown Application!";; 
esac

#COMBINING TWO STRINGS
echo ""
echo "Enter an installed application"
read First_string
echo -e "First application - \n ${First_string}"

echo "Enter a second installed application"
read Second_string
echo -e "Second application - \n ${Second_string}"

echo "${First_string} and ${Second_string} are working together!"
echo -e "\n"

#DIRECTORY STRUCTURE
echo ""
echo "Showing system directory structure in 5 seconds!"
sleep 5
echo ""
echo "Showing Directory Structure"
cd
tree

sleep 3
echo "Process Finished, Thanks!"