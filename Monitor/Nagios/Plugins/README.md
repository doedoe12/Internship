## Cách dùng plugin check_log.sh qua NRPE

### Tại host 

Tải plugin và đặt tại `/usr/lib64/nagios/plugins`

Khai báo vào file `/etc/nagios/nrpe.cfg`

```
command[check_log]=/usr/lib64/nagios/plugins/check_log.sh [log_file] -w 45 -c 60
```

Thay [log_file] bằng file cần check, -w và -c là ngưỡng cảnh báo Warning sau 45 phút không sinh log và Critical sau 60 phút 

Khởi động lại NRPE 

`systemctl restart nrpe`

### Tại Nagios server

Thêm vào file cấu hình của host:

```
define service {
    use                 generic-service     ; Inherit default values from a template
    host_name           host1
    service_description check log time
    check_command       check_nrpe!check_log
}
```

Khởi động lại Nagios

`systemctl restart nagios`