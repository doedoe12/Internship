# Webvirt

Có 3 cách để triển khai webvirt:

- Cài đặt KVM và webvirt trên cùng 1 máy

- Cài đặt KVM và webvirt trên 2 máy khác nhau

- Cài đặt webvirt trên máy ảo của KVM 

Tôi sẽ sử dụng mô hình 2 vì đây là mô hình phổ biến nhất

## Mô hình 

### KVM

```
OS: ubuntu16.04
IP: 10.10.10.7
```

### Webvirt

```
OS: ubuntu16.04
IP: 10.10.10.8
```

## Cài đặt 

### Bước 1: Cài các gói cần thiết

```
sudo apt-get install git python-pip python-libvirt python-libxml2 novnc supervisor nginx
```

Cài đặt python, các gói cần thiết và thiết lập môi trường cho Django

```
git clone git://github.com/retspen/webvirtmgr.git 
cd webvirtmgr 
sudo pip install -r requirements.txt
./manage.py syncdb
./manage.py collectstatic
```

### Bước 2: Cấu hình cho webvirt

```
You just installed Django's auth system, which means you don't have any superusers defined.
Would you like to create one now? (yes/no): yes (Put: yes)
Username (Leave blank to use 'admin'): admin (Put: your username or login)
E-mail address: username@domain.local (Put: your email)
Password: xxxxxx (Put: your password)
Password (again): xxxxxx (Put: confirm password)
Superuser created successfully.
```

Có thể cài quyền quản trị cao nhất cho supper user 

`./manage.py createsuperuser`

Ở đây mặc định user sẽ là `root` và nhập pass cho user

### Bước 3: Cấu hình nginx

```
mkdir /var/www
cd ..
sudo mv webvirtmgr /var/www
```

Thêm file cấu hình `webvirtmgr.conf` có nội dung sau vào trong `/etc/nginx/conf.d`:

```
server {
    listen 80 default_server;

    server_name $hostname;
    #access_log /var/log/nginx/webvirtmgr_access_log; 

    location /static/ {
        root /var/www/webvirtmgr/webvirtmgr; # or /srv instead of /var
        expires max;
    }

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-for $proxy_add_x_forwarded_for;
        proxy_set_header Host $host:$server_port;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 600;
        proxy_read_timeout 600;
        proxy_send_timeout 600;
        client_max_body_size 1024M; # Set higher depending on your needs 
    }
}
```

Vào file `/etc/nginx/sites-enabled/default` comment toàn bộ section `Server` lại:

```
#    server {
#        listen       80 default_server;
#        server_name  localhost;
#        root         /usr/share/nginx/html;
#
#        #charset koi8-r;
#
#        #access_log  /var/log/nginx/host.access.log  main;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        location / {
#        }
#
#        # redirect server error pages to the static page /40x.html
#        #
#        error_page  404              /404.html;
#        location = /40x.html {
#        }
#
#        # redirect server error pages to the static page /50x.html
#        #
#        error_page   500 502 503 504  /50x.html;
#        location = /50x.html {
#        }
#    }
```

Khởi động lại nginx:

`sudo systemctl restart nginx`

### Bước 4: Setup supervisor

Tạo file với nội dung sau:

`sudo vi /etc/insserv/overrides/novnc`

```
#!/bin/sh
### BEGIN INIT INFO
# Provides:          nova-novncproxy
# Required-Start:    $network $local_fs $remote_fs $syslog
# Required-Stop:     $remote_fs
# Default-Start:     
# Default-Stop:      
# Short-Description: Nova NoVNC proxy
# Description:       Nova NoVNC proxy
### END INIT INFO
```

Cấp quyền:

`sudo chown -R www-data:www-data /var/www/webvirtmgr`

Tiếp tục tạo một file cấu hình `webvirt` cho `supervisor`

`vi /etc/supervisor/conf.d/webvirtmgr.conf`

```
[program:webvirtmgr]
command=/usr/bin/python /var/www/webvirtmgr/manage.py run_gunicorn -c /var/www/webvirtmgr/conf/gunicorn.conf.py
directory=/var/www/webvirtmgr
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/webvirtmgr.log
redirect_stderr=true
user=www-data

[program:webvirtmgr-console]
command=/usr/bin/python /var/www/webvirtmgr/console/webvirtmgr-console
directory=/var/www/webvirtmgr
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/webvirtmgr-console.log
redirect_stderr=true
user=www-data
```

Khởi động lại supervisor

```
sudo systemctl restart supervisor 

cd /var/www/webvirtmgr
sudo git pull
sudo ./manage.py collectstatic 
sudo systemctl restart supervisor
```

Lúc này vào thử giao diện web trên trình duyệt với địa chỉ `http://10.10.10.8` nhập username và password như đã tạo.

Giờ cần kết nối tới KVM qua TCP nên cần cấu hình libvirt trên KVM 

### Bước 5: Cấu hình trên máy ảo cài đặt KVM 

Chỉnh sửa file cấu hình của libvirt:

`vi /etc/libvirt/libvirtd.conf`

```
listen_tls = 0
listen_tcp = 1
tcp_port = "16509"
listen_addr = "0.0.0.0"
unix_sock_group = "libvirtd"
unix_sock_ro_perms = "0777"
unix_sock_rw_perms = "0770"
auth_unix_ro = "none"
auth_unix_rw = "none"
auth_tcp = "none"
```

Trong đó dòng `auth_tcp = "none"` để không yêu cầu xác thực khi đăng nhập với `virsh` (Ví dụ: virsh -c qemu+tcp://127.0.0.1/system)

Tiếp theo sửa file `/etc/default/libvirt-bin` như sau:

```
start_libvirtd="yes"
libvirtd_opts="-l -d"
```

Khởi động lại libvirt

`sudo systemctl restart libvirt-bin`

Kiểm tra:

```
ps ax | grep [l]ibvirtd
netstat -pantu | grep libvirtd 
virsh -c qemu+tcp://127.0.0.1/system 
```

### Bước 6: Kết nối webvirt với KVM

Vào trình duyệt nhập địa chỉ của webvirt và đăng nhập.

<img src="img/70.jpg">

Sau khi đăng nhập thành công, chọn `Add Connection` để add KVM vào webvirt:

<img src="img/71.jpg">

Chọn `TCP Connections`, đặt tên cho connect vào `Label`, tiếp theo nhập ip của máy KVM vào `FQDN/IP`. Lưu ý username và password ở đây là để login vào KVM.

<img src="img/72.jpg">

<img src="img/73.jpg">

Chọn vào `kvm-.7` 

<img src="img/74.jpg">

#### Tạo một mạng mới cho KVM

Chuyển sang tab `Networks`, chọn `New Network` để tạo một mạng mới

- NAT

<img src="img/75.jpg">

- Bridge 

<img src="img/76.jpg">

#### Tạo `Interfaces`

<img src="img/77.jpg">

Tạo interface `br0`

<img src="img/78.jpg">

Giờ có thể tạo một `Instances` mới, chọn tab `Instances` -> `New Instance` -> `Custom Instance`, điền các thông số rồi chọn `Create`:

<img src="img/79.jpg">

Click vào `Start`

<img src="img/80.jpg">

Sau khi đã bật được, chọn `Access` -> `Console` -> `Console` 

<img src="img/81.jpg">

Khi đó giao diện noVNC hiện lên cho phép bạn sử dụng máy ảo

<img src="img/82.jpg">

#### Tạo VM

- Add new image

Chọn task `Storages` -> Chọn storage với `Type` là `Dir` -> `Add images`

<img src="img/83.jpg">

<img src="img/84.jpg">

- Tạo máy ảo sử dụng image vừa tạo

<img src="img/85.jpg">

- Add file iso vào để cài đặt hệ điều hành

<img src="img/86.jpg">

- Bật máy ảo và theo dõi với noVNC

#### Snapshot

- Để snapshot, trước tiên tắt máy ảo.

<img src="img/87.jpg">

- Tiếp theo tiến hành tạo snapshot 

<img src="img/88.jpg">

- Revert 1 snapshot

<img src="img/89.jpg">

- Xoá 1 snapshot 

<img src="img/90.jpg">