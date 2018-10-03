## VMWare Workstation
### Mục lục

[1. Tổng quan](#tongquan)

[2. Cài đặt VMWare Workstation](#caidatvmware)

[3. Các chế độ card mạng của VMWare](#cacchedocardmang)

[4. Tạo máy ảo](#taomayao)

<a name="tongquan"></a>
### 1. Tổng quan

- VMWare Workstation là một trong những phần mềm ảo hóa desktop mạnh mẽ nhất hiện nay, có giao diện thân thiện, dễ sử dụng, có nhiều tính năng tối ưu hóa bộ nhớ và khả năng quản lý các thiết lập nhiều lớp.
- Phần mềm cho phép người dùng có thể chạy nhiều hệ điều hành khác nhau như Windows, Linux, Fedora,... trên một máy tính mà không cần khởi động lại hay phân vùng lại ổ cứng, giúp cho việc học tập và nghiên cứu trở nên dễ dàng hơn.

#### Các tính năng chính
- Cung cấp môi trường làm việc an toàn
- Kết nối với các Workstation Servers khác để quản lý máy ảo an toàn
- Nâng cao tính bảo mật
- Nâng cao hiệu năng nhờ tận dụng kiến trúc CPU mới

**Phiên bản mới nhất hiện nay là VMWare Workstation 15.0.0 ra mắt ngày 24/09/2018**

**Các tính năng mới**
- Các hệ điều hành mới được hỗ trợ:

<ul>
<li>Windows 10 1803</li>
<li>Ubuntu 18.04</li>
<li>Fedora 28</li>
<li>RHEL 7.5</li>
<li>CentOS 7.5</li>
<li>Debian 9.5</li>
<li>OpenSuse Leap 15.0</li>
<li>FreeBSD 11.2</li>
<li>ESXi 6.7</li>
</ul>

- Hỗ trợ DirectX 10.1
DirectX 10.1 là sự nâng cấp của DirectX 10.0. Nó cung cấp chất lượng hình ảnh cao hơn nhờ công nghệ khử răng cưa MSAA. DirectX 10.1 hỗ trợ Shader Model 4.1 và Cubermap Array

- Hardware version 16

<ul>
<li>Hỗ trợ DirectX 10.1</li>
<li>Hỗ trợ bộ nhớ đồ hoạ lên tới 3GB</li>
</ul>

- REST API
Có thể sử dụng Workstation RESTful API để tự động hoá các tác vụ thông thường của máy ảo bằng chuẩn JSON qua HTTP hoặc HTTPS. Các hoạt động được hỗ trợ bao gồm:

<ul>
<li>Virtual machine inventory management</li>
<li>Virtual machine power management</li>
<li>Networking management</li>
</ul>

- Hỗ trợ VCSA 6.7
Có thể import và sử dụng VCSA 6.7(vCenter Server Appliance) trong VMWare Workstation 15

- Kết nối USB tự động tới máy ảo
Các thiết bị USB có thể kết nối tự động đến một máy ảo đang bật nếu Workstation 15 được cấu hình để ghi nhớ connection rule.
Đây là tính năng chỉ dành cho Windows host

<a name="caidatvmware"></a>
### 2. Cài đặt VMWare Workstation

#### Yêu cầu phần cứng

**OS**: Windows 64-bit
**RAM**: 4GB trở lên
**CPU**: Các CPU bắt đầu từ 2011 đến nay đều được hỗ trợ ngoại trừ:

<ul>
<li>Intel Atom sử dụng kiến trúc Bonnell (Ví dụ: Atom Z670/Z650; Atom N570)</li>
<li>Intel Atom sử dụng kiến trúc Saltwell (Ví dụ: Atom S1200, Atom D2700/D2500)</li>
<li>AMD Llano và AMD Bobcat</li>

#### Cài đặt

- Download bản miễn phí mới nhất của VMWare Workstation tại [đây](https://my.vmware.com/en/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/15_0)

<a name="cacchedocardmang"></a>
### 3. Các chế độ card mạng của VMWare Workstation

Sau khi cài đặt xong, VMWare sẽ tạo ra 2 card mạng ảo VMnet1 và VMnet8 trên máy thật, máy thật sẽ sử dụng 2 card mạng này để kết nối với máy ảo.

VMWare có 3 chế độ card mạng:

```
- Bridged
- NAT
- Host-only
```

- Bridged

<ul>
<li>Card mạng của máy ảo sẽ được gắn trực tiếp với card mạng của máy thật (sử dụng switch ảo VMnet0). Lúc này, máy ảo sẽ đóng vai trò như một máy trong mạng thật, có thể nhận DHCP từ mạng ngoài, hoặc đặt IP tĩnh cùng dải với mạng ngoài để giao tiếp với các máy ngoài mạng hoặc lên Internet.</li>
</ul>

- NAT (Network Address Translation)

<ul>
<li>Máy ảo sẽ được cấu hình NAT và sử dụng IP của máy thật để giao tiếp với mạng ngoài</li>
<li>Các máy ảo được cấp địa chỉ IP nhờ một DHCP ảo của VMWare</li>
<li>Các máy ảo sẽ kết nối với máy thật qua switch ảo VMnet8, và máy thật sẽ đóng vai trò NAT server cho các máy ảo.</li>
</ul>

- Host-only

<ul>
<li>Máy ảo sẽ kết nối với máy thật trong một mạng riêng thông qua switch ảo VMnet1 và không thể kết nối ra mạng ngoài</li>
<li>Địa chỉ của máy ảo và máy thật trong mạng host-only có thể được cấp bới DHCP của switch ảo VMnet1 hoặc đặt IP tĩnh cùng dải để kết nối với nhau</li>
</ul>

<a name="taomayao"></a>
### 4. Tạo máy ảo

- Giao diện VMWare 10

<img src="https://github.com/doedoe12/Internship/blob/master/image/VMW1.jpg">

- Chọn `Create a New Virtual Machine`

<img src="https://github.com/doedoe12/Internship/blob/master/image/VMW2.jpg">

- Chọn `Typical` để tạo theo mặc định, `Custom` để tuỳ chỉnh.

<img src="https://github.com/doedoe12/Internship/blob/master/image/VMW3.jpg">

- Chọn phiên bản Workstation tại `Hardware` và xem các sản phẩm tương thích tại `Compatible products`, các thông số giới hạn tại `Limitations`. Chọn `Next` để tiếp tục quá trình.

<img src="https://github.com/doedoe12/Internship/blob/master/image/VMW4.jpg">

- Có 3 tuỳ chọn:

<ul>
<li>`Installer disc`: Cài đặt từ ổ đĩa</li>
<li>`Installer disc image file`: Cài đặt từ file .iso, cần download bản iso của hệ điều hành muốn cài về trước</li>
<li>`I will install the operating system later`: Tạo máy ảo với ổ đĩa trống</li>
</ul>
Chọn `Next` để tiếp tục

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw5.jpg">

- Điền **Full name**, **user name**, **password**

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw6.jpg">

- Điền tên máy và chọn nơi lưu máy

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw7.jpg">

- Lựa chọn số processors và số nhân cho mỗi processors

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw8.jpg">

- Chọn kích thước RAM.

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw9.jpg">

- Chọn card mạng phù hợp

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw10.jpg">

- Chọn I/O Controller Types
Tuỳ chọn `BusLogic` không khả dụng cho OS 64-bit. `LSI Logic` có giao diện song song và `LSI Logic SAS` có giao diện nối tiếp. Mặc định chọn LSI Logic.

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw11.jpg">

- Chọn định dạng ổ đĩa

<ul>
<li>Có thể chọn `IDE` disk cho bất kì hệ thống nào</li>
<li>Có thể chọn `SCSI` disk cho bất kì hệ thống nào có driver cho LSI Logic hoặc BusLogic SCSI controller có sẵn trong máy ảo.</li>
<li>Có thể chọn `SATA` disk cho một vài hệ thống</li>
<li>Có thể chọn `NVMe` cho hệ thống support loại NVMe disk</li>
</ul>

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw12.jpg">

- Chọn ổ đĩa

<ul>
<li>`Create a new virtual disk`: Tạo một ổ đĩa mới</li>
<li>`Use an existing virtual disk`: Sử dụng ổ đã tồn tại</li>
<li>`Use a physical disk`: Sử dụng ổ đĩa thật</li>
<ul>
Chọn tạo ổ mới.

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw13.jpg">

- Chọn dung lượng tối đa của ổ cứng
Tích vào `Allocate all disk space now` để cấp phát lập tức dung lượng tối đa của ổ cứng ảo từ ổ cứng thật, nếu không tích thì dung lượng ổ cứng ảo sẽ tăng dần tuỳ vào lượng dữ liệu được thêm vào ổ cứng ảo. Chọn `Store virtual disk as a single file` để lưu ổ cứng vào 1 file, hoặc `Split virtual disk into multiple files` để chia ổ cứng thành nhiều file.

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw14.jpg">

- Chọn nơi lưu ổ cứng

<img src="https://github.com/doedoe12/Internship/blob/master/image/vmw15.jpg">

- Xem lại các thông số, nhấn `Back` hoặc `Customize Hardware` để chỉnh lại. Tích `Power on this virtual machine after creation` để khởi động máy ảo ngay sau khi cài đặt xong. Chọn `Finish` để hoàn tất quá trình tạo máy ảo.




