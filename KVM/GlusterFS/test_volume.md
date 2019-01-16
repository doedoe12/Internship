# Thử nghiệm các loại Volume của GlusterFS

## Distributed

- Tạo một Volume `vol1` theo loại Distributed:

```
gluster volume create vol1 transport tcp 10.10.10.6:/mnt/brick1 10.10.10.9:/mnt/brick1
gluster volume start vol1 
```

- Tại Client, mount Volume vol1 để sử dụng:

`mount.glusterfs 10.10.10.6:/vol1 /mnt`

- Tạo 2 file `1.txt` và `2.txt` và kiểm tra lại trên server

Kiểm tra trên server 10.10.10.6:

<img src="img/20.jpg">

Kiểm tra trên server `10.10.10.9` thì thấy không có gì.

## Replicate

- Tạo Volume `vol2` loại Replicate:

```
gluster volume create vol2 rep 2 transport tcp 10.10.10.6:/mnt/brick1 10.10.10.9:/mnt/brick1
gluster volume start vol2
```

- Tại Client, mount Volume vol1 để sử dụng:

`mount.glusterfs 10.10.10.6:/vol2 /mnt`

- Tạo 2 file `1.txt` và `2.txt` và kiểm tra lại trên server, ta thấy ở cả 2 server đều có cả 2 file. Chỉnh sửa file 1.txt tại Client và kiểm tra lại thì thấy file `1.txt` ở cả 2 server đều thay đổi theo.

## Stripe

- Tạo Volume `vol3` loại Stripe:

```
gluster volume create vol3 stripe 2 transport tcp 10.10.10.6:/mnt/brick1 10.10.10.9:/mnt/brick1
gluster volume start vol3
```

- Tại Client, mount Volume vol1 để sử dụng:

`mount.glusterfs 10.10.10.6:/vol3 /mnt`

- Tạo 1 file 100MB để test thử, kiểm tra trên 2 server thì thấy mỗi server có 1 file 50MB.