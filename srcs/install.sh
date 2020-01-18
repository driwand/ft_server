#!/bin/bash

#create serticaft
bash /tmp/create_cer.sh

#phpmyadmin install
wget -O /tmp/phpMyAdmin-4.9.3-english.tar.gz https://files.phpmyadmin.net/phpMyAdmin/4.9.3/phpMyAdmin-4.9.3-english.tar.gz
tar xzvf /tmp/phpMyAdmin-4.9.3-english.tar.gz -C /tmp
mv /tmp/phpMyAdmin-4.9.3-english /usr/share/phpmyadmin

#wordpress install
wget -O /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz 
tar xvf /tmp/latest.tar.gz -C /tmp
mv tmp/wordpress /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress

#config mysql and phpmyadmin
cp tmp/config.inc.php /usr/share/phpmyadmin
cp tmp/wp-config.php /var/www/html/wordpress

ln -s /usr/share/phpmyadmin/ /var/www/html/
mkdir -p /var/lib/phpmyadmin/tmp
chmod 777 /var/lib/phpmyadmin/tmp/
chown -R www-data:www-data /var/www/html/

sh /tmp/create_databases.sh
