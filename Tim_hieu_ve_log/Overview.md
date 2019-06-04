## 1. Tổng quan về Log

### 1.1 Khái niệm

`Log` là một tệp tin được tạo ra bởi một máy chủ web hoặc máy chủ proxy chứa tất cả các thông tin về các hoạt động trên máy chủ đó. 

Các file log hệ thống lưu những thông tin hoạt động của các function thiết yếu trong hệ thống. Ví dụ như cơ chế uỷ quyền, các tiến trình hệ thống, các message hệ thống, syslog,...

### 1.2 Tác dụng của Log

- Log ghi lại liên tục các thông báo về hoạt động của cả hệ thống hoặc của các dịch vụ được triển khai trên hệ thống và file tương ứng. Log file thường là các file văn bản thông thường dưới dạng **clear text**, tức là bạn có thể dễ dàng đọc được nó, vì thế có thể sử dụng các trình soạn thảo văn bản (vi, vim, nano,...) hoặc các trình xem văn bản thông thường (cat, tailf, head,...) là có thể xem được file log.

- Các file log có thể cho bạn bất cứ thứ gì bạn cần biết, để giải quyết các rắc rối mà bạn gặp phải miễn là bạn biết ứng dụng nào, tiến trình nào được ghi vào log nào cụ thể.

- Trong hầu hết hệ thống Linux thì `/var/log` là nơi lưu lại tất cả các log.

Việc sinh ra log để giúp quản trị viên theo dõi hệ thống của mình tốt hơn, hoặc giải quyết các vấn đề gặp phải với hệ thống hoặc service. Điều này đặc biệt quan trọng với các hệ thống cần phải online 24/24 để phục vụ nhu cầu của mọi người dùng.

### 1.3 Các loại log

Có thể phân loại Log ra làm 4 loại cơ bản

- Application Logs

- Event Logs

- Service Logs

- System Logs

### 1.4 Một số file log quan trọng

- `/var/log/syslog` hoặc `/var/log/messages`: Hiển thị thông báo và thông tin chung về hệ thống. Về cơ bản là một bản ghi tất cả hoạt động của hệ thống. `/var/log/messages` đối với các hệ thống Redhat-based,  `/var/log/syslog` đối với hệ thống Debian/Ubuntu

- `/var/log/auth.log` hoặc `/var/log/secure`: Ghi lại nhật ký xác thực đăng nhập.

- `/var/log/boot.log`: Thông tin khởi động hệ thống

- `/var/log/maillog` hoặc `/var/log/mail.log`: Log của các mail server chạy trên hệ thống 

- `/var/log/kern`: Các log về kernel

- `/var/log/dmesg`: Device driver message, sử dụng lệnh `dmesg` để xem thông tin bên trong file này

- `/var/log/faillog`: Ghi lại thông tin đăng nhập thất bại, hữu ích cho việc điều tra tấn công dò đoán mật khẩu và tấn công vét cạn.

- `/var/log/cron`: Giữ các bản ghi cron jobs

- `/var/log/daemon.log`: Theo dõi các dịch vụ chạy nền

- `/var/log/btmp`: Ghi lại tất cả các cố gắng đăng nhập thất bại

- `/var/log/utmp`: Trạng thái đăng nhập hiện tại của người dùng

- `/var/log/wtmp`: Ghi lại mỗi lần đăng nhập/đăng xuất

- `/var/log/lastlog`: Giữ thông tin về lần đăng nhập cuối cùng của tất cả các user. Sử dụng lệnh `lastlog` để đọc file.

- `/var/log/yum.log`: Giữ thông tin về các package được cài đặt bằng lệnh `yum`

- `/var/log/httpd/`: Thư mục log của Apache

- `/var/log/spooler`: Thường sẽ không có gì, ngoại trừ các thông báo quan trọng từ USENET

## 2. Các thuật ngữ cơ bản

Có 4 thuật ngữ cơ bản mà chúng ta cần phải hiểu

| Thuật ngữ | Mô tả |
|-----------|-------|
| Facility | Identifier dùng để mô tả ứng dụng hoặc chương trình đã gửi thông điệp đến syslogd |
| Priority | Chỉ số này cho phép chúng ta biết được tầm  quan trọng của thông báo. Các mức được định nghĩa trong syslog, từ việc gỡ lỗi, thông tin dịch vụ cho đến các cảnh báo quan trọng khác. |
| Selector | Sự kết hợp của một hoặc nhiều Facility và các mức độ nghiêm trọng. Khi một sự kiện đến khớp với một Selector thì một Action được thực hiện |
| Action | Điều sẽ xảy ra khi một sự kiện khớp với Selector. Hành động đó có thể là ghi message đó vào tập tin nhật ký, lặp lại thông báo tới console hoặc thiết bị khác, viết nhật ký dưới tên một user khác, hoặc gửi message tới log server |

## Tham khảo

https://www.plesk.com/blog/featured/linux-logs-explained/

https://github.com/datkk06/ghichep-log/blob/master/docs/1.Ghi-chep-ve-log.md

https://github.com/trangnth/Tim-hieu-ELK/blob/master/Overview.md#bon

https://github.com/hocchudong/Mot-vai-hieu-biet-ve-log