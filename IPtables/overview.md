# Tổng quan về IPtables

## IPtables là gì, để làm gì?

IPtables là một ứng dụng tường lửa dựa trên lọc gói rất mạnh, miễn phí và có sẵn trên Linux

IPtables/Netfilter gồm 2 phần là Netfilter ở trong nhân Linux và IPtables nằm ngoài nhân. IPtables chịu trách nhiệm giao tiếp với người dùng và sau đó đẩy các luật của người dùng vào cho Netfilter xử lý. Netfilter tiến hành lọc các gói dữ liệu ở mức IP. Netfilter làm việc trực tiếp trong nhân, nhanh và không làm giảm tốc độ của hệ thống.

## Lịch sử

Trước IPtables, các gói chương trình dùng để quản lý tường lửa trên Linux là ipchains trên Linux 2.2; ipfwadm trên Linux 2.0, dựa trên chương trình ipfw trên BSD.

IPtables giữ lại những ý tưởng chính trong ipfwadm: Các danh sách luật, trong đó mỗi luật chỉ ra những dấu hiệu cần tìm trong một gói tin, và các hành động sẽ thực hiện với một gói tin thoả mãn các dấu hiệu. ipchains thêm khái niệm chains rules, và IPtables mở rộng ra tables: một table được tra cứu khi cần quyết định phải NAT một gói tin, và một table khác chỉ ra phải lọc gói tin như thế nào. Thêm vào đó, ba điểm lọc trên hành trình của một gói tin được biến đổi sao cho mỗi gói tin thông qua một điểm lọc.

Cách phân chia này cho phép IPtables sử dụng thông tin mà lớp giám sát kết nối thu được từ gói tin, những thông tin thường gặp trong NAT. Điều này làm cho IPtables cao cấp hơn ipchains vì nó có khả năng giám sát trạng thái của kết nối và chuyển hướng, thay đổi hay dừng các gói tin dựa trên trạng thái của kết nối, không chỉ dựa vào nguồn, đích hay nội dung gói tin. Một tường lửa sử dụng IPtables theo cách này còn được gọi là stateful firewall, trong khi ipchains chỉ có thể cài đặt stateless firewall. Ta có thể rằng IPtables có thể nhận thức được ngữ cảnh của gói tin đang di chuyển, từ đó ra một quyết định đúng đắn hơn cho số phận của các gói tin và kết nối.

Hiện nay netfilter đang phát triển nftables, một sự thay thế cho IPtables trong tương lai.

## Các khái niệm

### Table

IPtables sử dụng table để định nghĩa các rules cụ thể cho các gói tin. Các phiên bản Linux hiện nay có 4 loại table khác nhau:

- Filter table: Table này quen thuộc và hay được sử dụng nhất. Bảng này nhằm quyết định liệu gói tin có được chuyển đến địa chỉ đích hay không.

- Mangle table: Bảng này liên quan đến việc sửa head của gói tin, ví dụ chỉnh sửa giá trị các trường TTL, MTU, ToS.

- NAT table: Bảng này cho phép route các gói tin đến các host khác nhau trong mạng NAT, NAT table thay đổi IP nguồn và IP đích của gói tin. Bảng này cho phép kết nối đến các dịch vụ không được truy cập trực tiếp được do đang trong mạng NAT.

- Raw table: 1 gói tin có thể thuộc một kết nối mới hoặc cũng có thể là của 1 kết nối đã tồn tại. Bảng Raw cho phép bạn làm việc với gói tin trước khi kernel kiểm tra trạng thái gói tin.

### Chains

Mỗi table được tạo với một số chains nhất định. Chains cho phép lọc gói tin tại các điểm khác nhau. IPtables có thể thiết lập với các chains sau:

- PREROUTING: Các rule thuộc chain này sẽ được áp dụng ngay khi gói tin vừa vào đến network interface. Chain này chỉ có ở table NAT, Raw và Mangle.

- INPUT: Các rule thuộc chain này áp dụng cho các gói tin ngay trước các gói tin được vào hệ thống. Chain này có trong 2 bảng Mangle và Filter.

- OUTPUT: Các rule thuộc chain này áp dụng cho các gói tin ngay khi gói tin đi ra từ hệ thống. Chain này có trong 3 bảng Raw, Mangle và Filter.

- FORWARD: Các rule thuộc chain này áp dụng cho các gói tin chuyển tiếp qua hệ thống. Chain này chỉ có trong 2 bảng Mangle và Filter.

- POSTROUTING: Áp dụng cho các gói tin đi network interface. Chain này có trong 2 bảng Mangle và NAT.



## Tham khảo

https://tech.vccloud.vn/tim-hieu-ve-iptables-phan-1-660.htm