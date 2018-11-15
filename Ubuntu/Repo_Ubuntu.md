# Cấu trúc Repository của Ubuntu

Ubuntu OS được xây dựng trên kiến trúc của Debian nên hầu như về kiến trúc hệ thống, kernel, Repository,... đều theo chuẩn Debian. 

## Debian Repository

Debian Repository là một máy chủ dịch vụ có chức năng lưu trữ các chương trình cài đặt. Qua đó hỗ trợ cho phép chương trình `apt` trên Ubuntu tự động lấy thông tin cũng như tự động cài đặt chương trình trên OS. Thông tin về các máy chủ Repository được lưu tại file `/etc/apt/sources.list`

### Khai báo Repository

Ta sẽ khai báo vào file `/etc/apt/sources.list` để khai báo 1 Repository

Cú pháp:

```
deb uri distribution [component1] [component2] [...]
deb-src distribution [component1] [component2] [...]
```

Ví dụ:

```
deb http://vn.archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://vn.archive.ubuntu.com/ubuntu/ trusty main restricted
```

### deb và deb-src

Nguồn web server lưu trữ Repository có thể lưu trữ cả **binary** và cả **source** của chương trình 

- **deb** là chỉ nguồn địa chỉ web chỉ để download chương trình binary 

- **deb-src** là dùng cho khai báo nguồn download source của chương trình.

### uri

Keyword **uri** là thông tin khai báo địa chỉ của web server Repository đang lưu trữ chương trình của OS tương ứng. Bạn có thể khai báo domain hoặc địa chỉ IP đều được, chỉ cần từ Ubuntu/Debian OS có thể truy cập đến web server Debian Repository là được.

Thông thường ở các web server Debian Repository sẽ phân cấp thư mục folder OS tương ứng để dễ quản lý và phân loại

```
Ubuntu: http://domain.com/ubuntu/ 
Debian: http://domain.com/debian/
```

### distribution

Ở phần keyword `distribution` khi khai báo thông tin nguồn Repository, đó là bạn cần khai báo **codename** của OS cùng tên **repository** nếu có, mà bạn cần download chương trình cài đặt tự động.

Ví dụ các codename:

```
Ubuntu 16.04: xenial
Ubuntu 14.04: trusty 
Ubuntu 12.04: precise
Debian 9: stretch
Debian 8: jessie
```

Ví dụ tên repository (tuỳ thuộc từng dòng distro Ubuntu hoặc Debian):

```
trusty: repo chứa chương trình dành cho việc nâng cấp phiên bản chương trình cũ hoặc hệ thống 
trusty-updates: repo chứa các chương trình dành cho việc nâng cấp fix lỗi chương trình cũ hoặc hệ thống.
trusty-security: chứa các chương trình dành cho bảo mật hệ thống.
trusty-backports: chương trình từ phân loại backport chứa các chương trình đã phát triển, bao gồm các phiên bản mới,... nhưng không được kiểm tra bởi nhóm bảo mật Ubuntu.
```

Để kiểm tra codename của OS, dùng lệnh `lsb_release -a`

#### Cấu trúc distribution trên web server

Cấu trúc của keyword `distribution` trên web server Repository sẽ tương ứng với tên folder nằm trong thư mục cha `$ARCHIVE_ROOT/dists/`. Đây mới là phần giúp khai báo giúp **apt** biết được thư mục nào trên server Repository hỗ trợ chương trình cho dòng OS phiên bản codename repository nào.

### Bốn phân loại của một Repository

Có bốn phân loại dành cho Repository của một distribution bao gồm:

- main: chương trình miễn phí và mã nguồn mở từ công ty cha của Ubuntu Canoninal

- universe: chương trình miễn phí và mã nguồn mở từ cộng đồng duy trì

- restricted: cung cấp driver cho thiết bị

- multiverse: một số chương trình được giới hạn bởi vấn để bản quyền

### Một số file cần lưu ý

Một số thông tin về các package lưu trữ trên hệ thống Debian Repository cần lưu ý:

- File **Release**: file chứa thông tin index và chuỗi hash của các file khác chứa thông tin dữ liệu thứ cấp nằm trong thư mục $distribution ($ARCHIVE_ROOT/dists/$distribution).

Thông thường chương trình `apt` sẽ tiến hành request để lấy file này về và đọc nó. Sau đó đọc các thông tin file thứ cấp để truy xuất dữ liệu cần thiết.

### Thư mục pool

Thư mục **pool** nằm cấp dưới của thư mục domain **uri**, cùng cấp với thư mục **dists**

Thư mục này chứa toàn bộ file cài đặt, chương trình .deb, thư viện, driver,... theo cấp tên thư mục alphabet

Sau khi `apt` đọc thông tin từ Repository, thì chương trình `apt` sẽ tìm đến thư mục pool để tiến hành download chương trình cần thiết về OS để cài đặt.