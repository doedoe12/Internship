# Câu lệnh history

`history` là command thường được dùng để check lại lịch sử các dòng lệnh đã được thực thi bởi người dùng. Mặc định thời gian sẽ không hiển thị cùng lịch sử câu lệnh. Tuy nhiên bash shell cung cấp cho chúng ta CLI tool dành cho việc chỉnh sửa lịch sử câu lệnh.

### Xem lịch sử các câu lệnh đã được thực thi trên Linux

Để xem danh sách các câu lệnh đã được thực thi trên Linux, sử dụng câu lệnh `history` đơn giản

### Lưu hoặc loại bỏ các lệnh lặp liên tiếp

Để tránh lưu những lệnh lặp lại liên tiếp dùng câu lệnh:

```
export HISTCONTROL=ignoredups 
```

Mặc định các lệnh lặp lại sẽ được lưu, nếu không thì bỏ giá trị `ignoredups` ở biến $HISTCONTROL đi thì các lệnh lặp liên tiếp sẽ vẫn được lưu lại.

### Lọc lịch sử command

Để không hiển thị một số command nào đó, chúng ta có thể lọc nó bằng câu lệnh `export HISTIGNORE='ls -l:pwd:date:'`

Trong đó `ls -l`, `pwd`, `date` là những câu lệnh sẽ không được hiển thị trong danh sách lịch sử.

### Hiển thị kèm theo thời gian

Để lệnh `history` hiển thị lại các câu lệnh và có kèm theo thời gian sử dụng câu lệnh đó, ta chỉ cần thêm giá trị cho biến $HISTTIMEFORMAT như sau:

```
export HISTTIMEFORMAT='%F %T '
```

Trong đó %F tương ứng với %Y - %m - %d (năm - tháng - ngày) và %T tương đương với thời gian (%H:%M:%S)

### Tìm kiếm lịch sử 

Để tìm kiếm trong danh sách lịch sử các câu lệnh đã thực hiện, bấm `Ctrl + R` rồi nhập vào từ cần tìm 

Bạn cũng có thể dùng `grep` để lọc ra những câu lệnh mong muốn. Ví dụ: `history | grep pwd` 

### Gọi lại câu lệnh vừa thực hiện 

Có 4 cách để gọi lại những câu lệnh vừa thực hiện:

- Sử dụng nút định hướng lên trên để gọi lại câu lệnh và ấn enter

- Ấn `!!` và ấn enter 

- Ấn `!-1` và ấn enter 

- Sử dụng tổ hợp phím `Ctrl P` và nhấn enter 

Để gọi lại chính xác một câu lệnh nào đó từ danh sách lịch sử, sử dụng câu lệnh `!n`, trong đó `n` là số thứ tự theo danh sách lịch sử câu lệnh.

### Thay đổi số dòng hiển thị và số dòng được lưu vào history

Mặc định thì lịch sử sẽ được lưu tại `~/.bash_history`. Để chỉnh sửa số dòng được lưu và số dòng được hiển thị khi chạy lệnh history. Ta cần chỉnh sửa file `.bash_profile`. Thêm 2 dòng sau rồi login lại vào bash shell:

```
vi ~/.bash_profile
HISTSIZE=1000
HISTFILESIZE=2000
```

Trường hợp trên, mỗi khi chạy lệnh history, sẽ có tối đa 1000 dòng được hiển thị và file sẽ lưu được tối đa 2000 dòng. Nếu muốn lịch sử không được hiển thị, sử dụng lệnh `export HISTSIZE=0`

### Xem lịch sử command của từng user cụ thể

`~/.bash_history` là thư mục chứa lịch sử, mặc định thì thư mục này sẽ bị ẩn đi. Bạn có thể vào thư mục của từng user để xem lịch sử của user đó theo đường dẫn `/home/username/.bash_history`. Lưu ý rằng chỉ user root mới có quyền được xem lịch sử của tất cả các user.

### Xoá tất cả lịch sử 

Dùng câu lệnh `history -c` để xoá lịch sử 