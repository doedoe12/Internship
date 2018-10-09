## Linux

### Mục lục

[1. Tổng quan](#tongquan)

[2. Phân biệt Linux và Unix](#phanbiet)

[3. Cấu trúc thư mục của Linux](#cautructhumuc)

<a name="tongquan"></a>
## 1. Tổng quan

### 1.1. Khái niệm

GNU/Linux là một hệ điều hành máy tính dựa trên Unix được phát triển và phân phối qua mô hình phần mềm tự do mã nguồn mở. Chính xác thì Linux có nghĩa là nhân (kernel) của hệ điều hành, thành phần cốt lõi giúp một hệ thống điều hành các phần cứng

### 1.2. Lịch sử phát triển

- Ngày 5/4/1991, Linus Torvalds, chàng sinh viên 21 tuổi của trường Đại học Helsinki, Phần Lan đã bắt tay vào viết những dòng lệnh đầu tiên của Linux.  

- Tháng 8/1991, Torvalds gửi đi thông điệp đã trở thành nổi tiếng sau này về sự ra đời của Linux: “Tôi đang làm một hệ điều hành miễn phí (chỉ làm theo sở thích, và sẽ không lớn và chuyên nghiệp)”. Ngay chính Torvalds cũng không ngờ đến sự thành công của Linux như ngày hôm nay.  

- Tháng 9/1991, phiên bản Linux 0.01, phiên bản Linux đầu tiên được Torvalds công bố, với 10.239 dòng lệnh. Phiên bản 0.02 được ra mắt 1 tháng sau đó.

- Năm 1992, Torvals đã có một quyết định được cho là đúng đắn khi phát hành Linux dưới dạng mã nguồn mở của giấy phép GPL, cho phép tất cả mọi người có quyền download về để xem mã nguồn để cung chung tay phát triển. Đây được xem là quyết định đã giúp Linux có được sự phổ biến như ngày nay.

- Năm 1993, Slackware, hệ điều hành đầu tiên phát triển dựa trên mã nguồn Linux được ra đời. Slackware là một trong những hệ điều hành Linux đầu tiên và có tuổi đời lâu nhất hiện nay.

- Ngày 14/3/1994, sau 3 năm làm việc miệt mài, Torvalds cho ra mắt phiên bản hoàn thiện đầu tiên, Linux 1.0 với 176.250 dòng lệnh. 1 năm sau đó, phiên bản 1.2 ra mắt với 310.950 dòng lệnh.

- Ngày 3/11/1994, Red Hat Linux, phiên bản 1.0 được giới thiệu. Đây là một trong những hệ điều hành được thương mại hóa đầu tiên dựa trên Linux.

- Năm 1996, Linus Torvalds ghé thăm công viên hải dương học, tại đây, ông đã quyết định sử dụng hình ảnh chú chim cánh cụt để làm biểu tượng chính thức của Linux.

- Năm 1998, Linux bắt đầu được các “ông lớn” công nghệ quan tâm và đầu tư để phát triển. Nổi bật trong số đó là IBM. Công ty này đã đầu tư hàng tỉ USD để phát triển các dịch vụ và phần mềm trên nền tảng Linux, với đội ngũ nhân viên phát triển hơn 300 người. Ngoài IBM, Compaq và Oracle cũng bắt đầu đầu tư và phát triển Linux.

- Năm 2005, Linus Torvalds được xuất hiện trên trang bìa của tạp chí về kinh tế BusinessWeek, với câu chuyện về sự thành công của hệ điều hành Linux.

- Năm 2007, hàng loạt hãng sản xuất máy tính lớn như HP, ASUS, Dell, Lenovo,... bắt đầu bán ra các sản phẩm laptop được cài đặt sẵn Linux.

- Tính đến thời điểm hiện tại, Linux đã có rất nhiều biến thể và phiên bản khác nhau, được xây dựng và phát triển riêng biệt bởi các công ty phần mềm và các cá nhân. Nổi bật trong số đó chính là hệ điều hành di động Android của Google, hiện là một trong những hệ điều hành thông dụng nhất hiện nay.

- Đến tháng 1/2009, số người dùng Linux trên toàn cầu đạt mốc 10 triệu người. Hiện nay, sau 20 năm tồn tại và phát triển, Linux được sử dụng rộng rãi trên toàn thế giới, trên các máy tính cá nhân, các máy chủ, đến các thiết bị di động, máy nghe nhạc, máy tính bảng, các máy ATM và thậm chí trên cả các siêu máy tính…

- Từ phiên bản đầu tiên với hơn 10 ngàn dòng lệnh, ngày 14/3/2011, sau 20 năm tồn tại và phát triển, nền tảng Linux 2.6.38 được phát hành, với 14.294.493 dòng lệnh, đánh dấu một chặng đường tồn tại và phát triển lâu dài của Linux.

- Ngày nay, Linux được xem là biểu tượng của sự chia sẻ cộng đồng, được phát triển bởi cộng đồng và được ủng hộ vì hoàn toàn miễn phí. Linux được xem là sự đối địch của Windows (Microsoft), bởi nhiều người cho rằng, với Microsoft tất cả chỉ có lợi nhuận.

### 1.3. Các nhóm distro phổ biến của Linux

#### Nhóm Arc, Gentoo, Slackware

- Là các distro nhắm vào người dùng am hiểu về hệ thống Linux. Hầu hết phương thức xây dựng và cấu hình hệ thống đều phải thực hiện qua môi trường dòng lệnh.

- Cấu trúc gọn nhẹ, uyển chuyển để có thể xây dựng một hệ thống hoàn toàn tuân theo ý của mình.

#### Nhóm Debian, Fedora

- Các distro cũng nhắm vào những người dùng am hiểu hệ thống, tuy nhiên cung cấp nhiều công cụ hơn cho những người chưa thật sự hiểu rõ hoàn toàn về Linux. Nhóm này tương đối thân thiện với người dùng mới bắt đầu hơn nhóm (1). Tuy nhiên, các distro nhóm này lại có một quy trình phát triển và kiểm tra chất lượng các gói phần mềm cực kì khắt khe so với các distro còn lại. Để trở thành một lập trình viên chính thức của Debian hay Fedora cần phải có thời gian đóng góp khá dài, và phải được chứng nhận bởi các lập trình viên khác. Do vậy, môi trường để lập trình và nghiên cứu ở 2 distro này khá tốt.

- Nhắm đến việc chuẩn hóa, chuyên môn hóa quá trình phát triển phần mềm nhằm tạo ra một hệ thống hoạt động nhịp nhàng, ăn khớp và hạn chế lổ hỗng bảo mật.

#### Nhóm Cent, RHEL

- Các distro này chủ yếu nhắm vào thị trường doanh nghiệp, cơ quan, thị trường máy chủ… Các dòng distro này có nhiều đặc tính phù hợp cho mảng thị trường đòi hỏi sự ổn định cao như: thời gian ra phiên bản mới thường khá lâu (3 – 5 năm tùy distro); dịch vụ hỗ trợ thương mại cho các công ty, tổ chức sử dụng sản phẩm; ít sử dụng các công nghệ mới nhất (thường kém ổn định) mà tập trung phát triển trên các công nghệ lâu đời và đáng tin cậy hơn.

- Phát triển theo hướng bền vững, chuyên nghiệp, cung cấp dịch vụ hỗ trợ dài hạn, cung cấp sản phẩm có vòng đời kéo dài (lên tới 7 năm).

#### Nhóm Ubuntu, Linux Mint

- Nhóm các distro nhắm đến người dùng cuối và người mới bắt đầu sử dụng Linux. Đặc tính của các distro này là thời gian phát hành ngắn, ứng dụng liên tục các công nghệ mới với nhiều công cụ đồ họa để cấu hình hệ thống, thiết kế với mục đích dễ dùng, dễ làm quen, không cần đọc tài liệu đối với người mới.

- Cung cấp những công nghệ mới nhất, những hiệu ứng đồ họa bắt mắt ngay sau khi cài đặt, không cần phải cấu hình nhiều…

<a name="phanbiet"></a>
## 2. Phân biệt Linux và Unix 

| Linux | Unix |
|-------|------|
| Mã nguồn mở | Mã nguồn đóng |
| Chủ yếu sử dụng giao diện đồ hoạ và giao diện dòng lệnh | Chỉ sử dụng giao diện dòng lệnh |
| Có tính di động và có thể hoạt động trong các ổ cứng khác nhau | Không có tính di động |
| Rất linh hoạt và có thể được cài đặt trên hầu hết các HOME BASED PSC | Có yêu cầu chặt chẽ về phần cứng, do đó nó không thể được cài đặt trên tất cả các thiết bị |
| Chủ yếu được sử dụng đối với máy tính để bàn, điện thoại di động hoặc máy tính cá nhân | Unix chủ yếu được sử dụng trong hệ thống máy chủ, máy tính chính và máy tính cao cấp |
| Các phiên bản của Linux: Ubuntu, Debian, OpenSure, Redhat, Solaris… | Các phiên bản của Unix: AIS, HP – UX, BSD, IRIS… |
| Cài đặt Linux khá tiết kiệm và không đòi hỏi nhiều phần cứng đặc biệt và cao cấp | Cài đặt Unix tương đối tốn kém vì nó yêu cầu các mạch phần cứng cụ thể hơn |
| Các hệ thống tập tin được Linux hỗ trợ có dạng: xfs, ramfs, nfs, vfat, cramfsm ext3, ext4, ext2, ext1, ufs, autofs, devpts, ntfs… | Các hệ thống tập tin được Unix hỗ trợ có dạng: zfs, js, hfx, gps, xfs, vxfs |
| Linux là sự phát triển của một cộng đồng Linux đang hoạt động trên toàn thế giới. | Unix được phát triển bởi các nhà phát triển của công ty AT&T |  

<a name="cautructhumuc"></a>
## 3. Cấu trúc thư mục của Linux

Linux quản lý hệ thống trên một "hệ thống tệp tin" duy nhất, bắt đầu ở gốc là thư mục root (/) đây là thư mục ở cấp cao nhất. Cấu trúc cơ bản của hệ thống Linux như sau:


<img src="img/687474703a2f2f696d6775722e636f6d2f6b647135594f4a2e6a7067.png">

Trong đó:

- **/**: là thư mục root, nơi mở đầu logic cho hệ thống file của Linux. Mọi đường dẫn tuyệt đối của bất kì file nào đều bắt đầu từ /. Thư mục / chứa toàn bộ hệ điều hành. Chỉ có người dùng root mới có quyền truy cập và thay đổi trong thư mục này. (phân biệt giữa / và /root)

- **/bin**: User binaries - thư mục lưu trữ các file nhị phân chương trình thực thi của người dùng như: pwd, cat, cp, ...

- **/sbin**: Chứa đựng các file thực thi dạng nhị phân của các chương trình cơ bản giúp hệ thống hoạt động. Các chương trình trong /sbin thường được sử dụng cho mục đích là duy trì và quản trị hệ thống => dành cho người dùng admin quản trị hệ thống - người dùng root hoặc superuser.

Một số chương trình trong thư mục này như: init, iptables, fdisk, ...

- **/boot**: boot loader file - Chứa các tệp tin khởi động và cả nhân kernel là vmlinuz. 

- **/dev**: Các file thiết bị - nơi lưu trữ các phân vùng ổ cứng, thiết bị ngoại vi như usb, ổ đĩa cắm ngoài hay bất cứ thiết bị nào được gán vào hệ thống.
	
	* Các hard drive thường được mount tại thư mục /dev/sda , usb mount trong /dev/sde ; các phân vùng trên ổ địa được phân ra /dev/sda1, /dev/sda2...
	
- **/etc**: Chứa file cấu hình cho các chương trình hoạt động. Chúng thường là các tệp tin dạng text thường. Chức năng gần giống "Control panel" trong Windows. Các cấu hình trong /etc thường ảnh hưởng tới tất cả người dùng trong hệ thống.

	Trong /etc còn chứa các shell scripts dùng để khởi động hoặc tắt các chương trình khác. Ví dụ: /etc/resolve.conf, sysctl.conf, ...
	
- **/home**: thư mục chứa các file cá nhân của từng user.

- **/lib**: Chứa các file library hỗ trợ cho các file thực binary. Mỗi khi cài đặt phần mềm trên Linux, các thư viện cũng tự động được download, và chúng hầu hết được bắt đầu với lib*.. Đây là các thư viện cơ bản mà Linux cần đề làm việc. Không giống như trong Windows, các thư viện có thể chia sẻ và dùng chung cho các chương trình khác nhau. Đó là một lợi ích trong hệ thống tệp tin của Linux.	

- **/media**: Chứa thư mục dùng để mount cho các thiết bị có thể gỡ bỏ, di chuyển khỏi hệ thống được như CDROM, floppy, ...

- **/mnt**: Chứa các thư mục dùng để system admin thực hiện quá trình mount. Như đã nói, hệ điều hành Linux coi tất cả là các file và lưu giữ trên một cây chung. Đây chính nơi tạo ra các thư mục để 'gắn' các phân vùng ổ đĩa cứng cũng như các thiết bị khác vào. Sau khi được mount vào đây, các thiết bị hay ổ cứng được truy cập từ đây như là một thư mục. Trong một số hệ điều hành, các ổ đĩa chưa được gắn sẵn vào hệ thống bởi fstab sẽ được gắn ở đây.

- **/opt**: Tên thư mục này nghĩa là optional (tùy chọn), nó chứa các ứng dụng thêm vào từ các nhà cung cấp độc lập khác. Các ứng dụng này có thể được cài ở /opt hoặc một thư mục con của /opt

- **/proc**: Chứa đựng thông tin về quá trình xử lý của hệ thống.

- **/root**: Thư mục home của người dùng root.

- **/tmp**: Thư mục lưu trữ các file tạm của hệ thống và các user. Các file lưu tại đây sẽ bị xóa khi hệ thống khởi động lại.

- **/usr**: Chứa các file binary, library, tài liệu, source-code cho các chương trình.
		
	* **/usr/bin** chứa file binary cho các chương trình của user. Nếu như một user trong quá trình thực thi một lệnh ban đầu sẽ tìm kiếm trong /bin, nếu như không có thì sẽ tiếp tục nhìn vào /usr/bin.
		
	* **/usr/sbin** chứa các file binary cho system administrator. Nếu như ta không tìm thấy các file system binary bên dưới /sbin thì ta có thể tìm ở trong /usr/sbin.
		
	* **/usr/lib** chứa các file libraries cho /usr/bin và /usr/sbin
		
	* **/usr/local** dùng để chứa chương trình của các user, các chương trình này được cài đặt từ source
		
- **/var**: Chứa đựng các file có sự thay đổi trong quá trình hoạt động của hệ điều hành cũng như các ứng dụng

	* Nhật ký của hệ thống `/var/log`
	
	* database file `/var/lib`
	
	* Email `/var/mail`
	
	* Các hàng đợi in ấn `/var/spool`
	
	* Lock file `/var/lock
	
	* Các file tạm thời cần cho quá trình reboot `/var/tmp`
	
	* Dữ liệu cho trang web `/var/www`
	
- **/srv**: Chứa dữ liệu liên quan đến các dịch vụ máy chủ như /srv/svs, chứa các dữ liệu liên quan đến CVS.