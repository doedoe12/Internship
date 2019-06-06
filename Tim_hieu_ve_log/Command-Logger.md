# Lệnh logger trong Unix/Linux

Unix cung cấp lệnh `logger`, là một lệnh thực sự hữu ích để giải quyết hệ thống ghi log. Lệnh logger gửi các thông báo ghi log tới `syslogd daemon`, và do đó kích thích hệ thống ghi log.

Điều này có nghĩa là chúng ta có thể kiểm tra từ dòng lệnh tại bất cứ thời gian nào. Lệnh logger cung cấp một phương thức để thêm cổng vào một dòng tới hệ thống ghi log file từ dòng lệnh.

Định dạng của lệnh là:

```
logger [-i] [-f file] [-p priority] [-t tag] [message]...
```

Chi tiết các tham số

| Tham số | Miêu tả |
|---------|---------|
| -f filename | Sử dụng nội dung của tên file như thông báo để log |
| -i | Log ID tiến trình của tiến trình logger với mỗi dòng |
| -p priority | Nhập thông báo với quyền ưu tiên được xác định (lối vào bộ chọn được xác định). Quyền ưu tiên thông báo có thể được xác định ở dạng số hoặc như là cặp phương thức.quyền ưu tiên. Quyền ưu tiên mặc định là user.notice |
| -t tag | Đánh dấu mỗi dòng được thêm tới hệ thống log với thẻ đã xác định |
| message | Các tham số chuỗi mà nội dung được kết nối cùng nhau theo thứ tự xác định, riêng rẽ bởi khoảng trống |

## Tham khảo 

https://vietjack.com/unix/he_thong_ghi_log_trong_unix_linux.jsp