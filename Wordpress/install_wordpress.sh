#!bin/bash
echo "Database name: "
read -e dbname
echo "Database user: "
read -e dbuser
echo "Password: "
read -s dbpass
echo "Installing WordPress..."

firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload

yum install epel-release -y
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum install -y httpd
systemctl start httpd
systemctl enable httpd 

touch /etc/yum.repos.d/MariaDB.repo
cat > /etc/yum.repos.d/MariaDB.repo <<EOF
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

rm -rf /var/lib/mysql
yum install -y mariadb-server
systemctl start mariadb
systemctl enable mariadb

yum install -y php php-mysql
systemctl restart httpd

echo "CREATE DATABASE $dbname;" | mysql
echo "CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass';" | mysql
echo "GRANT ALL PRIVILEGES ON $dbname.* to '$dbuser'@'localhost';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

cd ~
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
rsync -avP ~/wordpress/ /var/www/html/
mkdir /var/www/html/wp-content/uploads
chown -R apache:apache /var/www/html/*

cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i s/database_name_here/$dbname/ wp-config.php
sed -i s/username_here/$dbuser/ wp-config.php
sed -i s/password_here/$dbpass/ wp-config.php

echo "Install successful, go to WebUI to finish configuration"