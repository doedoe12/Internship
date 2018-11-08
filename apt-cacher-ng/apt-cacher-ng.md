# apt-cacher-ng

## apt-cacher-ng là gì?

- apt-cacher-ng là một proxy server, dùng để lưu trữ bản sao các gói cài đặt được download từ internet về. Nhờ vậy, các máy khác trong mạng lần sau sẽ không phải mất thời gian tải các gói cài đặt từ internet về nữa.

<img src="img/01.jpg">

- Hoạt động theo mô hình client-server 

- Với apt-cacher-ng, bạn có thể theo dõi sự update và download các gói phần mềm được thiết lập và hỗ trợ sử dụng trong cả các môi trường không phải Debian.

- Các tính năng:

	- Tiết kiệm thời gian 
	
	- Tiết kiệm băng thông
	
	- Có thể tích hợp các dữ liệu ISO image hoặc DVD để apt-cacher-ng sử dụng bằng tuỳ chọn `import`.
	
## Cài đặt và sử dụng 

### Mô hình 

- Server:

	- Ubuntu 14.04, có kết nối internet
	
	- Server cài apt-cacher-ng để trở thành caching proxy server 
	
- Client:

	- Ubuntu 14.04
	
### Server

- Cài đặt apache bằng câu lệnh:

```
apt-get install apache2
```

- Cài đặt apt-cacher-ng bằng lệnh:

```
apt-get install apt-cacher-ng
```

- Mở file cấu hình của apt-cacher-ng `/etc/apt-cacher-ng/acng.conf` và chỉnh sửa các nội dung:

	- Cấu hình thư mục chứa tất cả các gói phần mềm dpkg được cài đặt và cập nhật:
	
	`CacheDir: /var/cache/apt-cacher-ng`
	
	- Kích hoạt chế độ ghi lại log để theo dõi:
	
	`LogDir: /var/log/apt-cacher-ng`
	
	- Cấu hình port của `apt-cacher-ng` (mặc định là 3142, có thể thay đổi):
	
	`Port:3142`
	
	- Cấu hình `BindAddress` để server lắng nghe các request từ client:
	
	`BindAddress: 0.0.0.0`
	
	- Kích hoạt chế độ ghi lại report về lưu lượng và request qua `apt-cacher-ng` trên giao diện web:
	
	`ReportPage: acng-report.html`
	
	- Để chạy dịch vụ apt-cacher-ng, cần kích hoạt pid file:
	
	`PidFile: /var/run/apt-cacher-ng/pid`
	
	- Khởi động lại dịch vụ apt-cacher:
	
	`service apt-cacher-ng restart`
	
- Kiểm tra lại trên trình duyệt ta được:

<img src="img/03.jpg">

### Client 

- Trên máy Client, tạo file `01proxy` trong thư mục `/etc/apt/apt.conf.d/` để client gửi các request tới proxy apt-cacher-ng server có nội dung như sau:

`Acquire::http { Proxy "http://10.10.10.2:3142"; };`

- Lưu lại là xong, bây giờ các máy client trong mạng LAN có thể cài đặt và cập nhật các gói phần mềm thông qua proxy apt-cacher-ng

### Test

- Dùng máy Client 1 update phần mềm, lúc này trên cache server chưa có packages nào nên sẽ phải tải từ Repo trên internet:

<img src="img/02.jpg">

- Dùng Client 2 update phần mềm sau khi máy 1 đã update, lúc này các gói update trước từ máy 1 đã được cache lại trên apt-cacher-ng server nên tốc độ update nhanh lên rõ rệt.

<img src="img/04.jpg">

### Update phiên bản các gói cài đặt đã được cache

- Giao diện web của apt-cacher-ng cho bạn 1 tính năng Mirroring, tính năng này sẽ dựa vào các file index của các gói cài đặt đã có trong CacheDir để tìm và tải phiên bản cập nhật mới nhất của các gói đó về CacheDir. Để có thể dùng tính năng này, trước hết phải cấu hình tại file `/etc/apt-cacher-ng/acng.conf`:

`PrecacheFor: uburep/dists/trusty-updates/*/binary-amd64/Packages*`

- Sau đó vào giao diện web:

<img src="img/05.jpg">

- Ở đây có các lựa chọn:

	- **Calculate and display download size**: Tính toán và hiển thị dung lượng tải về
		
	- **Download package file**: Tích vào sẽ tiến hành download về ngay, không tích thì chỉ liệt kê những gói có thể download về thôi.
		
	- **Restrict to packages related to previously cached file**: Tuỳ chọn này để lọc các gói theo những gói đã có trong CacheDir.
		
	- **Don't update index files**: Tuỳ chọn cho phép không cập nhật các file index.
		
	- **Use Debdelta if possible (experimental)**: Tuỳ chọn sử dụng Debdelta để download ( Debdelta là ứng dụng giúp bạn so sánh sự khác nhau giữa gói cũ và phiên bản mới của gói đó, giúp tiết kiệm băng thông bằng cách chỉ tải về phần khác nhau đó)
		
- Sau khi lựa chọn xong các tuỳ chọn, chọn `Start Mirroring` để bắt đầu.

### Loại bỏ phiên bản cũ đã lỗi thời của các gói cài đặt khỏi CacheDir

