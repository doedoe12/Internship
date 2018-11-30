# Giữ các packages sau khi cài từ `yum` trên CentOS 7

- Cấu hình tại file `/etc/yum.conf`

`keepcache = 1`

- `cachedir` là đường dẫn thư mục lưu các cache packages

- Để cập nhật metadata từ các repo hiện có của `yum` cho các packages được cache, sử dụng lệnh:

`yum makecache`

- Để cấu hình thời gian mà metadata hết hạn, cấu hình tuỳ chọn `metadata-expire` tại file `/etc/yum.conf`. Nếu không muốn thì có thể cập nhật metadata manual bằng lệnh `yum update` 

- Để sử dụng lệnh `yum` mà không sử dụng internet, chỉ sử dụng cache, thêm tuỳ chọn `-C` hoặc `--cacheonly` vào câu lệnh yum.

- Để xoá dữ liệu trong yum caches, sử dụng lệnh:

`yum clean <option>`

Các option của lệnh `yum clean` có thể tìm hiểu tại [đây](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-Working_with_Yum_Cache#tabl-Yum-clean_options)