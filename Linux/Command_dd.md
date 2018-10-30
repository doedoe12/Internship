## Dùng `dd` để tạo ra 1 file có kích thước ảo:

Tạo file1 có kích thước 1MB tại thư mục `home`:

```
dd if=/dev/zero of=~/file1 bs=1M count=1
```