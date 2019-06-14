## Cấu hình lưu log MySQL và dùng Rsyslog để đẩy sang Log Server

Có 3 loại log chính của MySQL:

- `Error Log`: Chứa thông tin về các lỗi phát sinh khi server đang chạy

- `General Query Log`: Bản ghi chung về hoạt động của mysqld

- `Slow Query Log`: Bao gồm các "slow" SQL statements

Thêm vào file cấu hình `/etc/my.cnf` các dòng sau

Để lưu Error Log:

```
[mysqld]
log-error=/var/log/mariadb/mariadb.log

[mysqld_safe]
log-error=/var/log/mariadb/mariadb.log
```

Để lưu General Log:

```
general_log_file        = /var/log/mariadb/mariadb-general.log
general_log             = 1
```

Để lưu Slow Query Log:

```
log_slow_queries       = /var/log/mariadb/mariadb-slow.log
long_query_time = 2
log-queries-not-using-indexes
```

Cấu hình để rsyslog đẩy log sang server giống như bài [này](https://github.com/doedoe12/Internship/blob/master/Tim_hieu_ve_log/rsyslog.md)