# Một số câu lệnh khi sử dụng GlusterFS

- Add 1 node vào pool:

`gluster peer probe <server>`

Trong đó `<server> là địa chỉ của server mà mình muốn add

- Xem status của pool:

`gluster peer status`

- Xoá node ra khỏi pool:

`gluster peer detach <server>`

`<server>` là địa chỉ của server muốn xoá

- Tạo volume:

```
gluster volume create <volume_name> [stripe COUNT | replica COUNT] [transport (tcp|rdma)] <brick1> <brick2> ...
```

Trong đó `stripe` và `replica` là kiểu volume muốn tạo (mặc định là distributed), `COUNT` là số lượng brick.

- Start volume:

`gluster volume start <volume_name>`

`volume_name` là tên volume cần start 

- Xem thông tin volume đã tạo:

`gluster volume info`

- Stop volume:

`gluster volume stop <volume_name>`

- Xoá volume:

`gluster volume delete <volume_name>`

- Add thêm brick vào volume:

`gluster volume add-brick <volume_name> <brick>`

Trong đó `volume_name` là tên volume cần thêm brick. `<brick>` là đường dẫn của brick cần add, ví dụ: `10.10.10.6:/mnt/brick1`

- Remove brick khỏi volume:

`gluster volume remove-brick <volume_name> <brick>`

- Chuyển dữ liệu từ brick1 đến brick2:

```
gluster volume replace-brick <volume_name> <brick1> <brick2> start // bắt đầu chuyển dữ liệu từ brick1 đến brick2 
gluster volume replace-brick <volume_name> <brick1> <brick2> status // xem quá trình chuyển dữ liệu 
gluster volume replace-brick <volume_name> <brick1> <brick2> commit
```

- Đồng bộ dữ liệu khi thêm, xoá brick:

```
gluster volume rebalance <volume_name> fix-layout start 
gluster volume rebalance <volume_name> migrate-data start 
gluster volume rebalance <volume_name> start 
```

- Sau khi 1 brick đã được sử dụng để tạo 1 volume, mà brick đó đã được remove ra khỏi volume hoặc volume đó đã bị xoá thì brick đó không tạo được volume khác. Vì thế để có thể tận dụng lại những brick đó để tạo volume khác, trước khi tạo volume ta phải làm như sau:

```
setfattr -x trusted.glusterfs.volume-id /mnt/brick1/
setfattr -x trusted.gfid /mnt/brick1/
rm -rf /mnt/brick1/.glusterfs
```