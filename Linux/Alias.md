## Alias trong Linux

Nói đơn giản thì `Alias` là một công cụ dùng để thu gọn các Command. Thay vì phải gõ 1 lệnh dài và rất khó nhớ thì với `Alias`, bạn chỉ cần gõ có vài kí tự là xong, tất cả đều do bạn đặt ra.

Theo mặc định, các lệnh viết tắt được lưu trữ trong file `~/.bashrc` hoặc `~/.bash_profile`, trong đó `~/` là thư mục `home` của bạn.

- Để thêm một alias, mở file `.bashrc` bằng `sudo vi ~/.bashrc` và thêm vào dòng định nghĩa alias có dạng như sau:

```
alias <tên_alias>='câu lệnh'
```

Lưu lại và cập nhật các thay đổi bằng lệnh:

```
source ~/.bashrc 
```

### Ví dụ

Đặt alias cho lệnh xoá RAM cache:

```
alias clearcache = 'sh -c "sync;echo 3 > /proc/sys/vm/drop_caches"'
```

sau đó cập nhật danh sách alias bằng `~/.bashrc` 

Từ giờ thay vì gõ `sh -c "sync;echo 3 > /proc/sys/vm/drop_caches"` để xoá RAM cache thì chỉ cần gõ `clearcache` là được 