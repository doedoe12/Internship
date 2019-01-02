# Virsh Command

- Là bộ công cụ dòng lệnh để tương tác với libvirtd có hỗ trợ quản lý KVM

## Cấu trúc câu lệnh

`virsh [Option]... <command> <domain> [ARG]...`

Các thành phần trong câu lệnh tìm hiểu thêm tại http://manpages.ubuntu.com/manpages/xenial/man1/virsh.1.html

## Các lệnh thường dùng

- Liệt kê các máy ảo đang chạy:

`virsh list`

- Liệt kê tất cả các máy ảo:

`virsh list --all`

- Bật máy ảo:

`virsh start <VM_name>`

- Tự động bật máy ảo khi khởi động hệ thống:

`virsh autostart <VM_name>`

- Reboot máy ảo:

`virsh reboot <VM_name>`

- Lưu trạng thái đang hoạt động của máy ảo vào một file và sau này restore lại:

`virsh save <VM_name> <VM_name_time>.state`

Tuỳ chọn **time** để đánh dấu thời điểm cho dễ nhớ.

- Restore lại máy ảo vừa lưu:

`virsh restore <VM_name_time>.state`

- Tắt máy ảo:

`virsh shutdown <VM_name>`

- Để quản lý các thành phần ảo khác như mạng ảo, pool ảo, volumn ảo,... thì dùng cú pháp chung sau:

`virsh <object>-<command> <object_name>`

Ví dụ sửa lại cấu hình cho mạng default:

`virsh net-edit default`

- Để console tới máy ảo:

`virsh console <VM_name>`

Tham khảo thêm tại [đây](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_administration_guide/chap-virtualization_administration_guide-managing_guests_with_virsh)