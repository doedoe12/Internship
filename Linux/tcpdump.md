# Tìm hiểu về `tcpdump`

## 1. tcpdump là gì?

`tcpdump` là công cụ được phát triển nhằm mục đích phân tích các gói dữ liệu mạng theo dòng lệnh. Nó cho phép người dùng chặn và hiển thị các gói tin được truyền đi hoặc được nhận trên một mạng mà máy tính nó tham gia.

- `tcpdump` xuất ra màn hình nội dung gói tin (mà bắt được trên card mạng mà nó đang lắng nghe) phù hợp với biểu thức logic lọc mà người dùng nhập vào.

- Với option `-w`, người dùng có thể xuất ra những mô tả về các gói tin dưới dạng file `.pcap` để có thể dùng phân tích về sau, và có thể đọc nội dung một file `.pcap` với tuỳ chọn `-r`. Các file `.pcap` này cũng có thể được đọc trong một số chương trình phân tích gói khác có giao diện đồ hoạ như Wireshark, Enttercap...

- Khi `tcpdump` kết thúc việc bắt (capture) gói tin thì nó sẽ thống kê lại thông tin về số lượng các gói tin đã capture, số lượng gói tin nhận được từ bộ lọc (lọc theo nhu cầu người dùng nhập vào), và số lượng gói tin bị dropped do thiếu không gian vùng đệm, bởi cơ chế bắt gói tin của hệ điều hành.

- Được hỗ trợ sẵn trong hầu hết các hệ thống Linux/Unix

- Các đặc điểm của `tcpdump`:

	- Nhìn thấy được bản tin dump trên terminal
	
	- Bắt được (capture) các bản tin và có thể lưu vào file định dạng `.pcap` (có thể đọc được nhờ Wireshark)
	
	- Tạo được các bộ lọc filter để lọc các bản tin cần thiết: http, ssh, ftp,...
	
	- Có thể nhìn được trực tiếp các bản tin điều khiển Linux.
	
	- Và nhiều hơn nữa, sẽ tìm hiểu ở phần sau.
	
## 2. Định dạng chung của một dòng giao thức tcpdump

```
time-stamp src > dst: flags data-seqno ack window urgent options
```

| Tên trường | Mô tả |
|------------|-------|
| Time-stamp | Hiển thị thời gian gói tin được capture |
| src và dst | Hiển thị địa chỉ IP của người gửi và người nhận |
| flags | S(SYN): Được sử dụng trong quá trình bắt tay của giao thức TCP.</br>.(ACK): Được sử dụng để thông báo cho bên gửi biết là gói tin đã nhận được dữ liệu thành công.</br>F(FIN): Được sử dụng để đóng kết nối TCP.</br>P(PUSH): Thường được đặt ở cuối để đánh dấu việc truyền dữ liệu.</br>R(RST): Được sử dụng khi muốn thiết lập lại đường truyền. |
| data-seqno | Số sequence number của gói dữ liệu hiện tại |
| ack | Mô tả số sequence number tiếp theo của gói tin do bên gửi truyền (số sequence number mong muốn nhận được) |
| window | Vùng nhớ đệm có sẵn theo hướng khác trên kết nối này |
| urgent | Cho biết có dữ liệu khẩn cấp trong gói tin |

## 3. Các tuỳ chọn lệnh:

| Option | Mô tả |
|--------|-------|
| -A | Hiển thị các gói tin bắt được dưới dạng ASCII |
| -c count | Capture đến khi đủ count gói tin sẽ dừng lại |
| -C file_size | Ghi lại thông tin các gói tin capture được vào file đến khi đủ dung lượng file_size sẽ ghi sang file mới |
| -D | List ra thông tin các card mạng mà tcpdump có thể capture gói tin |
| -e | Hiển thị ra header lớp link-layer. Dùng để hiển thị ra địa chỉ MAC đích mà MAC nguồn của gói tin bị capture |
| --version | In ra version của tcpdump |
| -i | Lắng nghe trên interface chỉ định |
| -n | In ra thông tin địa chỉ IP của gói tin |
| -r | Đọc gói tin từ 1 file đã được lưu thông tin các gói bắt được trước đó |
| -w | Ghi lại thông tin các gói tin bắt được vào file |
| -t | Bỏ in thời gian capture gói tin ở mỗi dòng |
| -ttt | In thêm khoảng thời gian bắt gói tin hiện tại và thời gian bắt gói tin trước đó tại mỗi đầu dòng |
| -tttt | Hiển thị thông tin chi tiết về thời gian bắt gói tin tại mỗi đầu dòng theo định dạng yyyy/mm/dd hh:mm:ss |

## 4. Một số tuỳ chọn bộ lọc sử dụng với tcpdump:

| Tuỳ chọn | Mô tả |
|--------|-------|
| and, or, not | Sử dụng kết hợp các bộ lọc |
| dst host *host* | Lọc các gói tin có địa chỉ IP hoặc tên host đích là *host* |
| src host *host* | Lọc các gói tin có địa chỉ IP hoặc tên host nguồn là *host* |
| host *host_addr* | Lọc nếu trong gói tin có địa chỉ nguồn hoặc đích bằng với *host_addr* |
| ether dst host *ehost* | Lọc gói tin nếu MAC đích của gói tin ethernet có giá trị là *ehost* |
| ether src host *ehost* | Lọc gói tin nếu MAC nguồn của gói tin ethernet có giá trị là *ehost* |
| ether host *ehost* | Lọc gói tin nếu gói tin ethernet có MAC đích hoặc MAC nguồn là *ehost* |
| dst port *port* | Lọc gói tin nếu gói tin bắt được có port đích bằng với *port* |
| src port *port* | Lọc gói tin nếu gói tin bắt được có port nguồn bằng với *port* |
| dst portrange *port1-port2* | Lọc gói tin nếu gói tin có địa chỉ port đích nằm trong khoảng từ *port1* tới *port2* |
| src portrange *port1-port2* | Lọc gói tin nếu gói tin có địa chỉ port nguồn nằm trong khoảng từ *port1* đến *port2* |
| less *length* | Lọc nếu gói tin có kích thước nhỏ hơn hoặc bằng *length* |
| greater *length* | Lọc nếu gói tin có kích thước lớn hơn hoặc bằng *length* |
| ip proto *protocol* | Lọc các gói tin ipv4 có giao thức là *protocol* |
| ether broadcast | Lọc các gói tin gửi broadcast layer 2 |
| vlan *vlan_id* | Lọc các gòi tin thuộc *vlan_id* |

## 5. Ví dụ 