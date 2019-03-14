# Tổng quan về Database

## 1. Khái niệm

Database được gọi là Cơ sở dữ liệu, là một bộ sưu tập dữ liệu có tổ chức, thường được lưu trữ và truy cập từ hệ thống máy tính. Khi cơ sở dữ liệu phức tạp hơn, chúng được phát triển bằng cách sử dụng các kỹ thuật thiết kế và mô hình hoá.

Hệ thống quản lý cơ sở dữ liệu (DBMS) là phần mềm tương tác với người dùng cuối, ứng dụng và chính cơ sở dữ liệu để thu thập và phân tích dữ liệu. Phần mềm DBMS bao gồm các tiện ích cốt lõi được cung cấp để quản trị cơ sở dữ liệu. Tổng cộng của cơ sở dữ liệu, DBMS và các ứng dụng liên quan có thể được gọi là hệ thống cơ sở dữ liệu. 

## 2. Các loại Database

### Cơ sở dữ liệu tập trung

Dữ liệu được lưu trữ tại một địa điểm tập trung và người dùng từ các địa điểm khác nhau có thể truy cập dữ liệu này. Loại cơ sở dữ liệu này chứa các quy trình ứng dụng giúp người dùng truy cập dữ liệu từ xa. Các loại thủ tục xác thực khác nhau được áp dụng để xác mình và xác thực người dùng cuối, số đăng ký được cung cấp bởi các ứng dụng giúp theo dõi và ghi lại việc sử dụng dữ liệu.

### Cơ sở dữ liệu phân phối

Trái ngược với cơ sở dữ liệu tập trung, cơ sở dữ liệu phân tán có sự đóng góp từ cơ sở dữ liệu chung cũng như thông tin được thu thập bởi các máy tính cục bộ. Dữ liệu không ở một nơi mà được phân phối tại nhiều địa điểm khác nhau của một tổ chức. Các trang web này được kết nối với nhau với sự trợ giúp của các liên kết truyền thông giúp truy cập dữ liệu phân tán dễ dàng.

Có 2 loại cơ sở dữ liệu phân tán là đồng nhất và không đồng nhất. Các cơ sở dữ liệu có cùng phần cứng, chạy trên cùng một hệ điều hành và quy trình ứng dụng được gọi là đồng nhất. Trong khi đó, các hệ điều hành có phần cứng và các quy trình ứng dụng khác nhau tại các trang web khác nhau được gọi là không đồng nhất.

### Cơ sở dữ liệu cá nhân

Dữ liệu được thu thập và lưu trữ trên các máy tính cá nhân nhỏ và dễ quản lý. Dữ liệu thường được sử dụng bởi cùng một bộ phận của một tổ chứ và được truy cập bởi một nhóm người nhỏ.

### Cơ sở dữ liệu người dùng

Đây là cơ sở dữ liệu dùng chung được thiết kế dành riêng cho người dùng cuối, tóm tắt toàn bộ thông tin được thu thập trong cơ sở dữ liệu này.

### Cơ sở dữ liệu thương mại 

Đây là các phiên bản trả phí của cơ sở dữ liệu khổng lồ được thiết kế dành riêng cho người dùng muốn truy cập thông tin cần thiết. Các cơ sở dữ liệu này là chủ đề cụ thể và lượng thông tin khổng lồ. Truy cập vào cơ sở dữ liệu như vậy được cung cấp thông qua các liên kết thương mại.

### Cơ sở dữ liệu quan hệ

Dữ liệu được lưu trữ trong các bảng dữ liệu gọi là các thực thể, giữa các thực thể này có mối liên hệ với nhau gọi là các quan hệ, mỗi quan hệ có các thuộc tính, trong đó có một thuộc tính là khoá chính. Các hệ quản trị hỗ trợ cơ sở dữ liệu quan hệ: MS SQL Server, Oracle, MySQL,...

### Cơ sở dữ liệu hướng đối tượng

Dữ liệu cũng được lưu trữ trong các bảng dữ liệu nhưng các bảng có bổ sung thêm các tính năng hướng đối tượng như lưu trữ thêm các hành vị, nhằm thể hiện hành vi của đối tượng. Mỗi bảng xem như một lớp dữ liệu, một dòng dữ liệu trong bảng là một đối tượng. Các hệ quản trị có hỗ trợ cơ sở dữ liệu hướng đối tượng: MS SQL Server, Oracle, Postgre,...

### Cơ sở dữ liệu bán cấu trúc

Dữ liệu được lưu dưới dạng XML, với định dạng này thông tin mô tả về đối tượng thể hiện trong các tag. Đây là cơ sở dữ liệu có nhiều ưu điểm do lưu trữ được hầu hết các loại dữ liệu khác nhau nên cơ sở dữ liệu bán cấu trúc là hướng mới trong nghiên cứu và ứng dụng 

### Cơ sở dữ liệu dạng file

Dữ liệu được lưu trữ dưới dạng các file có thể là text, ascii, .dbf

## 3. Phân biệt MariaDB và MySQL 

MySQL là một trong nhưng cơ sở dữ liệu được sử dụng rộng rãi nhất trên thế giới được phát triển dựa trên C/C++. MySQL sau đó được Sun Microsystems mua lại vào năm 2008. Tiếp theo vào năm 2010, Sun Microsystems đã được Oracle mua lại và kể từ đó MySQL được duy trì và quản lý bởi đội ngũ Oracle.

Trong quá trình mua lại Sun Microsystems của Oracle thì một số kỹ sư cao cấp đang nghiên cứu phát triển MySQL cảm thấy có xung đột lợi ích giữa cơ sở dữ liệu thương mại của MySQL và Oracle. Kết quả là các kỹ sư đó đã tạo ra một nhánh của MySQL, và như thế MariaDB được tạo ra.

Bảng so sánh MariaDB và MySQL

| | MariaDB | MySQL |
|-|---------|-------|
| Nhà phát triển | MariaDB Corporation AB (MariaDB Enterprise) và MariaDB Foundation (community MariaDB Server) | Oracle |
| Năm phát hành | 2009 | 1995 |
| Giấy phép | Mã nguồn mở | Mã nguồn mở + độc quyền |
| Phát triển | Mở | Đóng |
| Công cụ lưu trữ | InnoDB, MyISAM, BLACKHOLE, CSV, MEMORY, ARCHIVE, MERGE, ColumnStore, MyRocks, Aria, SphinxSE, TokuDB, CONNECT, SEQUENCE, Spider, Cassandra | InnoDB, MyISAM, BLACKHOLE, CSV, MEMORY, ARCHIVE, MERGE |
| Quản lý SQL | HeidiSQL | MySQL Workbench |
| Ngôn ngữ | C và C++ | C và C++ |
| Hệ điều hành máy chủ | FreeBSD, Linux, Solaris, Windows | FreeBSD, Linux, OS X, Solaris, Windows |
| API | Proprietary native API, ADO.NET, JDBC, ODBC | Proprietary native API, ADO.NET, JDBC, ODBC |
| Ngôn ngữ lập trình hỗ trợ | Ada, C, C#, C++, D, Eiffel, Erlang, Go, Haskell, Java, Node.js, Objective-C, OCaml, Perl, PHP, Python, Ruby, Scheme, Tcl | Ada, C, C#, C++, D, Delphi, Eiffel, Erlang, Haskell, Java, Node.js, Objective-C, OCaml, Perl, PHP, Python, Ruby, Scheme, Tcl |
| Khách hàng | Booking.com, Wikipedia, Google, Canal+, ClubMed, Deutsche Telekom, La Poste, Virgin,... | NASA, US Navy, Spotify, Netflix, Nokia, Joomla, Uber, PHP-Nuke, Tesla, Fujitsu,... |
| Thị trường | MariaDB mặc định trong LAMP | MySQL mặc định trong AppServ |

## Tham khảo

https://vi.wikipedia.org/wiki/C%C6%A1_s%E1%BB%9F_d%E1%BB%AF_li%E1%BB%87u

https://websolutions.com.vn/database-la-gi-cac-loai-database-hien-nay/

https://teamvietdev.com/chuyen-muc/mariadb/