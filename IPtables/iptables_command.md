## Cấu trúc câu lệnh cơ bản

`iptables [-t table] command [match] [target/jump]`

Lưu ý:

- Mặc định iptables sử dụng bảng filter để implement tất cả các command 

- `command` luôn phải đặt ở đầu bởi nó sẽ cho iptables biết cần phải làm gì (ví dụ như insert hoặc add rule vào chain)

- `match` là chỗ để bạn gửi tới kernel các đặc tính chi tiết của gói tin, cái làm nó khác biệt với những packets còn lại

- Nếu tất cả các `match` có trong packet, ta sẽ ra lệnh cho kernel thực thi hành động với nó, đó là `target`

## Command

| Command | Explaination | Example |
|---------|--------------|---------|
| -A, --append | Chèn rule vào cuối chain hay nói cách khác là đây sẽ là rule được check cuối cùng trong chain tới khi thêm chain khác vào | iptables -A INPUT ... |
| -D, --delete | Xoá rule trong chain, được thực hiện bằng 2 cách: điền toàn bộ rule hoặc chỉ định số thứ tự của rule bắt đầu từ 1 | iptables -D INPUT --dport 80 -j DROP, iptables -D INPUT 1 |
| -R, --replace | Thay thế entry cũ dựa theo số thứ tự dòng | iptables -R INPUT 1 -s 192.168.0.1 -j DROP |
| -I, --insert | Chèn rule vào chain theo số thứ tự dòng | iptables -I INPUT 1 --dport 80 -j ACCEPT |
| -L, --list | Hiển thị toàn bộ rule ở chain hoặc table chỉ định | iptables -L INPUT |
| -F, --flush | Xoá toàn bộ rule ở chain chỉ định | iptables -F INPUT |
| -Z, --zero | Xoá toàn bộ counter ở chain chỉ định hoặc tất cả các chain | iptables -Z INPUT |
| -N, --new-chain | Tạo mới một chain | iptables -N allowed |
| -X, --delete-chain | Xoá chain chỉ định khỏi table | iptables -X allowed |
| -P, --policy | Chỉ định policy mặc định nếu packet không match với rule nào trong chain. Hai tuỳ chọn được cho phép đó là ACCEPT và DROP | iptables -P INPUT DROP |
| -E, --rename-chain | Thay đổi tên table, lưu ý nó không làm thay đổi cách table hoạt động | iptables -E allowed disallowed |

| Command | Explaination | Commands used with |
|---------|--------------|--------------------|
| -v, --verbose | Cho ra output chi tiết thường dùng với --list | --list, --append, --insert, --delete, --replace |
| -x, --exact | Cho ra các con số chi tiết, được dùng với --list, sẽ cho ra số lượng packet và byte chi tiết được count | --list |
| -n, --numeric | iptables sẽ hiển thị kèm theo các giá trị số, IP và port sẽ được hiển thị dưới dạng numerical values | --list |
| --line-numbers | Cho ra output với số thứ tự dòng | --list | 
| -c, --set-counters | Thường dùng khi tạo mới rule. Ta có thể dùng nó để khai báo số packet và byte counter ban đầu | --insert, --append, --replace |
| --modprobe | Khai báo modules nào sẽ được sử dụng | All |

## Matches 

### Generic matches

| Match | Explaination | Example | 
|-------|--------------|---------|
| -p, --protocol | Check protocol | iptables -A INPUT -p tcp |
| -s, --src, --source | Check địa chỉ ip nguồn, ta có thể khai báo dưới dạng địa chỉ thuần, CIDR hoặc network range cũng như netmask. Mặc định là match all ip | iptables -A INPUT -s 192.168.1.1 |
| -d, --dst, --destination | Check địa chỉ đích đến của packet, hoạt động như --source | |
| -i, --in-interface | Dùng cho interface mà packet được chuyển tới, chỉ được dùng với chain INPUT, FORWARD và PREROUTING, mặc định nó sẽ accept tất cả. Ta cũng có thể dùng ! để khai báo except. Ví dụ -i! eth0 là accept tất cả trừ eth0 | iptables -A INPUT -i eth0 |
| -o, --out-interface | Dùng cho interface mà packet rời đi, chỉ dùng cho chain OUTPUT, FORWARD và POSTROUTING. Hoạt động giống với -i | iptables -A FORWARD -o eth0 |
| -f, --fragment | Dùng để match với phần thứ 2 và 3 của gói tin phân mảnh | iptables -A INPUT -f |

### Implicit matches 

#### TCP 

| Match | Explaination | Example |
|-------|--------------|---------|
| --sport, --source-port | Match với source port của gói tin. Ta có thể dùng port number hoặc service name. Nếu bạn dùng service name thì nó phải giống với trong file /etc/services vì iptables dùng file này để tìm kiếm. Ta cũng có thể dùng nó để match với port range ví dụ --source-port 22:80 và check except với ! | iptables -A INPUT -p tcp --sport 22 |
| --dport, --destination-port | Match với port đích, cách hoạt động giống --sport | iptables -A INPUT -p tcp --dport 22 |
| --tcp-flags | Dùng để check các TCP flags trong packet | iptables -p tcp --tcp-flags SYN,FIN,ACK SYN |

#### UDP 

--sport, --dport 

Hoạt động tương tự như TCP 

## Targets và Jumps

### Jumps

Ví dụ ta tạo mới 1 chain trong cùng table, có tên tcp_packets

`iptables -N tcp_packets`

Sau đó có thể thêm jump target vào đó

`iptables -A INPUT -p tcp -j tcp_packets`

Ta có thể bắt đầu traverse trong chain mới. Khi tới cuối chain, nó sẽ trả về INPUT chain và packet sẽ traverse bắt đầu từ rule phía dưới rule đã jump nó. Trong trường hợp packet được accept ở sub-chain, nó cũng sẽ được accept ở superset chain và không cần quay về nữa. Lưu ý rằng nó vẫn sẽ traverse ở các chain trong các bảng khác như bình thường. 

### ACCEPT target 

Target nàu không có thêm bất cứ option nào khác. Nếu packet match, nó sẽ được pass qua table nhưng nó sẽ vẫn phải traverse qua cùng chain ở table khác.

### DNAT target 

Được dùng để rewrite lại địa chỉ đích. Nếu packet match và đây là target của rule, packet và tất cả các subsequent packets khác trên cùng một stream sẽ được translate và route vào đúng device, network. DNAT chỉ được dùng với chain PREROUTING và OUTPUT trong bảng NAT.

DNAT target options

| Option | Explaination | Example |
|--------|--------------|---------|
| --to-destination | Phương thức để set địa chỉ đích vào ip header và đâu sẽ là nơi gói tin được gửi đến | iptables -t nat -A PREROUTING -p tcp -d 15.45.23.67 --dport 80 -j DNAT --to-destination 192.168.1.1-192.168.1.10 |

### DROP target 

Nó sẽ drop packet và không tiến hành thêm bất cứ tiến trình xứ lý nào nữa.

### REJECT target 

Cách làm việc gần giống với DROP target nhưng nó sẽ gửi lại một error message. Hiện nó chỉ hoạt động với chain INPUT, FORWARD và OUTPUT.

### RETURN target 

Packet sẽ không traverse ở chain hiện tại. Nếu nó là subchain thì nó sẽ quay lại superior chain. Nếu nó là main chain thì policy sẽ được áp dụng

### REDIRECT target 

Chỉ dùng với chain PREROUTING và OUTPUT. Nó sẽ rewrite địa chỉ đích của gói tin 

## Tham khảo 

https://github.com/thaonguyenvan/meditech-thuctap/blob/master/ThaoNV/Tim%20hieu%20Linux/firewall/iptables-command.md