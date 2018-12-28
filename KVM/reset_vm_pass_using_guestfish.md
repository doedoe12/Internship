# Reset password của máy ảo KVM bằng guestfish

## Bước 1: Cài đặt Guestfish

### CentOS/RHEL Linux:

```
yum install libguestfs-tools 
```

### Fedora Linux:

```
dnf install libguestfs-tools
```

### Ubuntu/Debian Linux:

```
apt-get install libguestfs-tools
```

## Bước 2: Tắt máy ảo

Sử dụng lệnh `virsh list` để liệt kê các máy ảo đang chạy

<img src="img/91.jpg">

Tắt máy ảo bằng lệnh

```
virsh shutdown vm_id

hoặc 

virsh shutdown vm_name
```

## Bước 3: Xác định vị trí file image của máy ảo

Sử dụng câu lệnh:

```
virsh dumpxml Ubuntu1 | grep 'source file'
```

<img src="img/92.jpg">

## Bước 4: Tạo mật khẩu mã khoá cho user của máy ảo

Sử dụng lệnh `openssl` để tạo ra một mật khẩu được mã hoá MD5:

```
openssl passwd -1 "your password"
```

<img src="img/93.jpg">

Copy đoạn password MD5 để sử dụng cho việc đổi mật khẩu.

## Bước 5: Chỉnh sửa image của máy ảo bằng Guestfish

Dùng lệnh sau để chỉnh sửa file image của máy ảo:

```
guestfish -rw -a [file image]
```

<img src="img/94.jpg">

- Gõ lệnh `run` hoặc `launch` để mở backend.

<img src="img/95.jpg">

- Liệt kê các partitions

<img src="img/96.jpg">

- Tiếp theo mount ổ đĩa tìm được. 

<img src="img/97.jpg">

- Chỉnh sửa file `/etc/shadow`, tìm đến dòng `root` và thay đoạn mã hoá password của root bằng đoạn mật khẩu mã hoá mới tạo ở trên.

<img src="img/98.jpg">

<img src="img/99.jpg">

- Lưu lại và thoát

## Bước 6: Bật máy ảo

- Bật máy ảo và đăng nhập bằng mật khẩu mới

<img src="img/100.jpg">

<img src="img/101.jpg">