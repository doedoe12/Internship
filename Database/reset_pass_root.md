## Reset the MariaDB root password

- Stop Mariadb, và restart nó với option không cần password

```
sudo systemctl stop mariadb
sudo mysql_safe --skip-grant-tables &
```

- Kết nối lại với MariaDB bằng tài khoản root 

`mysql -u root`

- Dùng các câu lệnh sau để đặt lại password cho root. 

```
use mysql;
update user SET PASSWORD=PASSWORD("password") WHERE USER='root';
flush privileges;
exit
```

Thay `password` bằng password mới

- Khởi động lại MariaDB

`sudo systemctl start mariadb`