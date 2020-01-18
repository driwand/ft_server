#!/bin/bash
service mysql start
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
mysql -uroot -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'driwand'@'localhost' IDENTIFIED BY 'driwandpass' WITH GRANT OPTION;"

mysql -uroot -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -uroot -e "GRANT ALL ON wordpress.* TO 'yassir'@'localhost' IDENTIFIED BY 'yassirpass';"
