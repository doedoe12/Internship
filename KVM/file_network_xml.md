# Tạo virtual network từ file xml

Để có thể tạo ra một virtual network thì cần tạo ra một file xml cấu hình network

## Host-only

Ở đây mình sẽ tạo một mạng host-only với file `isolated.xml`

```
<network>
<name>isolated</name>
</network>
```

Tiến hành define network từ file xml bằng câu lệnh

`virsh net-define isolated.xml` 

Sau khi đã define, bạn có thể xem network khả dụng bằng lệnh:

`virsh net-list --all`

`isolated` đã xuất hiện, tuy nhiên nó vẫn chưa được active

Sau khi define, libvirt sẽ tự động add thêm một số thành phần vào file xml bạn vừa tạo và lưu nó tại file `/etc/libvirt/qemu/networks/`

Bạn có thể chỉnh sửa file xml bằng lệnh `virsh net-edit isolated`. Bên cạnh đó, bạn cũng có thể dùng lệnh `virsh net-dumpxml netname` để xem cấu hình trong các file network xml của Linux Bridge.

Sau khi cấu hình xong, ta tiến hành start virtual network vừa tạo bằng câu lệnh:

`virsh net-start isolated`

Như vậy, `isolated` đã được start và có thể sử dụng 

Trong trường hợp người dùng muốn thay đổi cấu hình, tiến hành chỉnh sửa trong file xml rồi dùng lệnh `virsh net-destroy` và `virt net-start` để reset lại virtual network.

## Bridge 

Tạo một file `bridge.xml` trong thư mục `/etc/libvirt/qemu/networks/` có nội dung sau:

```
<network>
	<name>bridge</name>
	<uuid>bd3974f3-71d8-480c-9575-bab8b9afa9fb</uuid>
	<forward mode='bridge'/>
	<bridge name='bridge'/>
</network>
```

Tạo mạng từ file bridge 

```
virsh net-define bridge.xml
virsh net-autostart bridge 
virsh net-start bridge 
```

Kiểm tra lại:

`virsh net-list`

## Routed 

Tạo file xml với nội dung sau:

```
<network>
  <name>route</name>
  <uuid>5e275ec6-5c18-4397-a77d-c2b152b4715a</uuid>
  <forward dev='ens33' mode='route'>
    <interface dev='ens33'/>
  </forward>
  <bridge name='virbr1' stp='on' delay='0'/>
  <mac address='52:54:00:91:3c:9e'/>
  <domain name='route'/>
  <ip address='192.168.1.225' netmask='255.255.255.224'>
    <dhcp>
      <range start='192.168.1.240' end='192.168.1.254'/>
    </dhcp>
  </ip>
</network>
```

Sử dụng lệnh sau để tạo mạng

```
virsh net-define route.xml 
virsh net-autostart route 
virsh net-start route 
```