# Tạo máy ảo KVM

## Tạo máy ảo bằng virt manager

Cài đặt virt-manager bằng lệnh:

`apt-get install virt-manager`

Mặc định, các file ISO sẽ được lưu ở thư mục `/var/lib/libvirt/images/`

Tải 1 image để test 

```
cd /var/lib/libvirt/images/
wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
```

Kích hoạt virt-manager:

`virt-manager`

Nếu sử dụng MobaXterm để ssh tới thì mặc định đã hỗ trợ forward X11, nếu sử dụng các công cụ khác cần kích hoạt chế độ này thì mới có thể sử dụng virt-manager.

Sau khi câu lệnh trên được thực hiện sẽ hiện ra giao diện của virt-manager

<img src="img/15.jpg">

Chọn `new` để tạo máy ảo

- `Local install media` nếu muốn cài từ file iso

- `Import existing disk image` nếu bạn muốn cài từ file image

- `Network install` nếu muốn tải file cài đặt từ mạng

<img src="img/16.jpg">

Ở đây chọn kiểu cài từ file image, chọn `Browse` và tìm file img vừa down.

<img src="img/17.jpg">

Chọn RAM và CPU

<img src="img/18.jpg">

Chọn dung lượng ổ đĩa

<img src="img/19.jpg">

Đặt tên cho máy ảo và tùy chọn `Customize configuration before install` nếu muốn xem lại hoặc thay đổi các cấu hình trước khi bắt đầu OS

<img src="img/20.jpg">

Chọn `Begin Installation` để bắt đầu tạo máy ảo, đợi một lúc cho nó khởi động lên:

<img src="img/21.jpg">

## Tạo máy ảo bằng virt-install 

`virt-install` là một phần của gói `virtinst`, cần cài đặt gói này 

`apt install virtinst`

Có một số tùy chọn sẵn để sử dụng virt-install. Ví dụ:

```
sudo virt-install -n VM01 -r 128 \
--disk path=/var/lib/libvirt/images/web_devel.img,bus=virtio,size=4 -c \
ubuntu-18.04-server-i386.iso --network network=default,model=virtio \
--graphics vnc,listen=0.0.0.0 --noautoconsole -v
```

`-n web_devel` chỉ định tên máy ảo mới là `web_devel`

`-r 512` xác định dung lượng bộ nhớ mà máy ảo sử dụng, đơn vị là megabytes.

`-disk path=/var/lib/libvirt/images/web_devel.img,size=4` cho biết đường dẫn đến đĩa ảo có thể là file, partition hoặc logical volume, ở ví dụ này là `web_devel.img` trong thư mục `/var/lib/libvirt/images/`, với kích thước là 4 gigabytes, và sử dụng virtio cho disk bus.

`-c ubuntu-18.04-server-i386.iso` file được sử dụng như một CDROM ảo.

`--network` cung cấp chi tiết các về interface của VM. Ở đây là default network được sử dụng, và interface model được cấu hình cho virtio.

`--noautoconsole`: sẽ không tự động kết nối tới console của máy ảo.

`-v` tạo một máy hoàn toàn được ảo hóa.

### Tạo máy ảo bằng file image

```
sudo virt-install \
-n VM01 \
-r 128 \
--vcpus 1 \
--os-variant=generic \
--disk path=/var/lib/libvirt/images/cirros-0.3.4-x86_64-disk.img,format=qcow2,bus=virtio,cache=none \
--network bridge=br0 \
--hvm --virt-type kvm \
--vnc --noautoconsole \
--import
```

Trong đó:

`n`: tên máy ảo
`r`: bộ nhớ ram
`vcpu` là số cpu
`os variant` : các tùy chon cho hệ điều hành
`disk path`: đường đẫn đến file img trong máy
`hvm`: sử dụng đầy đủ các tính năng ảo hóa
`brigde`: tên Linux brigde đã cấu hình
`vnc`: đưa ra giao diện ảo vnc để điều khiển VM .
`noautoconsole`: không tự động kết nối tới guest console

Nếu muốn tạo thêm một máy ảo nữa cũng sử dụng image trên thì thêm tùy chọn `--check all=off`. Nếu muốn hiển thị giao diện console sau khi máy ảo khởi động thì bỏ option `noautoconsole` đi.

### Tạo máy ảo bằng file ISO

```
virt-install --name vmname --ram 1024 --vcpus=1 \
--disk path=/var/lib/libvirt/images/vmname.img,size=20,bus=virtio \
--network bridge=br0 \
--cdrom /home/tannt/ubuntu-14.04.4-server-amd64.iso \
--console pty,target_type=serial --hvm \
--os-variant ubuntutrusty --virt-type=kvm --os-type Linux
```

Sau khi chạy lệnh sẽ hiển thị một giao diện virt-manager để cấu hình. Nếu không muốn hiển thị giao diện này thì thêm option `--graphics none`

### Tạo máy ảo bằng cách tải gói trên mạng

```
virt-install \
--name template \
--ram 1024\
--disk path=/var/kvm/images/template.img,size=20 \
--vcpus 1 \
--os-type linux \
--os-variant ubuntutrusty \
--network bridge=br0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://jp.archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'
```

Trong đó:

`--location` là đường link để download các file cài đặt

Sau đó sẽ hiển thị lên giao diện cài đặt bình thường như cài đặt một hệ điều hành.

