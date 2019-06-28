# Tìm hiểu về Regular Expression (Regex)

## 1. Regex là gì?

Regular Expressions (biểu thức chính quy, viết tắt là regexp, regex hay regxp) là một chuỗi mẫu để mô tả một bộ các chuỗi khác, theo những quy tắc cú pháp nhất định.

## 2. Các quy tắc cơ bản

### 2.1. Khai báo chuỗi regex

Một pattern sẽ bắt đầu bằng dấu `/` và kết thúc cũng bằng dấu `/`. Đằng sau cặp dấu này là ký tự flag, 3 flag cơ bản:

- **i**: Không phân biệt chữ hoa, chữ thường

- **g**: Cho phép match lặp lại với các kí tự khác trong toàn bộ văn bản, nếu không có flag **g** thì sẽ chỉ match kết quả đầu tiên tìm thấy.

- **m**: Cho phép match theo từng dòng đối với văn bản đa dòng và có sử dụng cặp `^$`

Ví dụ:

- Pattern Regex: `/abc/` sẽ trả về chuỗi `abc` trùng khớp đầu tiên.

<img src="images/01.jpg">

Còn đây là kết quả của pattern trên khi thêm flag **g**, trả về tất cả chuỗi `abc` có trong văn bản

<img src="images/02.jpg">

Khi thêm flag **i** thì sẽ không phân biệt chữ hoa và chữ thường

<img src="images/03.jpg">

### 2.2 Ký tự bắt đầu và kết thúc trong Regex

- Dấu `^` chỉ các ký tự văn bản bắt đầu

Ví dụ pattern `/^abc/` sẽ match với chuỗi bắt đầu bằng `abc`

<img src="images/04.jpg">

- Dấu `$` chỉ các ký tự văn bản kết thúc

Ví dụ pattern `/abc$/` sẽ match với chuỗi kết thúc bằng `abc`

<img src="images/05.jpg">

- Nếu sử dụng cặp `^$` trong một biểu thức thì có nghĩa là match một chuỗi khớp hoàn toàn với biểu thức

<img src="images/06.jpg">

### 2.3. Xác định phạm vi của chuỗi

- Để match các chữ cái in thường, ta có pattern `/[a-z]/g`

<img src="images/07.jpg">

- Match các chữ cái in hoa với pattern `/[A-Z]/g`

<img src="images/08.jpg">

- Match các chữ số với pattern `/[0-9]/g`

<img src="images/09.jpg">

- Để kiểm tra một chữ cái in hoa hoặc in thường, ta có pattern `/[a-zA-Z]/g`

<img src="images/10.jpg">

- Regex kiểm tra ký tự số, chữ hoa, chữ thường (trừ các ký tự đặc biệt). `/[a-zA-Z0-9]/g`

<img src="images/11.jpg">

- Match các ký tự có trong tập hợp `afc` ta có pattern `/[afc]/g`

<img src="images/12.jpg">

- Để match các ký tự không nằm trong tập `afc` ta thêm dấu `^` vào để phủ định như sau: `/[^afc]/g`

<img src="images/13.jpg">

### 2.4. Xác định chiều dài chuỗi 

- Để tìm các chuỗi có khoảng chiều dài từ m đến n, ta có cú pháp {m,n}. Ví dụ tìm các chuỗi có từ 5 đến 10 ký tự thường

<img src="images/14.jpg"> 

- Tìm các chuỗi có độ dài chính xác

<img src="images/15.jpg">

### 2.5. Regex đại diện cho một ký tự

Ký tự `.` được dùng để định nghĩa cho một ký tự bất kì. Ví dụ pattern `/^.{0,10}$/gm` sẽ trả về các chuỗi bất kỳ có từ 0 đến 10 ký tự

<img src="images/16.jpg">

pattern `/a.c/gm` sẽ cho tất cả các cụm có 1 ký tự bất kỳ nằm giữa `a` và `c`

<img src="images/17.jpg">

### 2.6. Ký tự đặc biệt cho các từ khoá regex

Tất cả các ký tự như: `.`, `[]`, `{}`,... những ký tự liên quan đến quy tắc của Regex đều được quy về dạng ký tự đặc biệt trong regex, vì vậy để phân biệt giữa ký tự thường và ký tự đặc biệt trong regex thì ta thêm dấu `\` trước ký tự đó.

Ví dụ: Tìm dấu `.` trong đoạn văn bản, nếu ta cứ để như này `/./` thì sẽ có kết quả sau:

<img src="images/19.jpg">

Pattern đúng phải là `/\./`

<img src="images/18.jpg">

### 2.7. Regex A hoặc B

Giả sử cần kiểm tra chuỗi = A hoặc = B sẽ trả về đúng thì ta dùng dấu `|`, đây là ký hiệu biểu diễn mối quan hệ OR.

Ví dụ:

<img src="images/20.jpg">

### 2.8. Regex kiểm tra độ dài không giới hạn

- Ký tự `*` đại diện cho không hoặc nhiều ký tự, tương tự với biểu thức `{0,}`. Ví dụ pattern `/abc.*/gm`

<img src="images/21.jpg">

- Ký tự `+` đại diện cho một hoặc nhiều ký tự, tương tự biểu thức `{1,}`. Ví dụ pattern `/abc.+/gm`.

<img src="images/22.jpg">

- Ký tự `?` đại diện cho không hoặc 1 ký tự, tương tự biểu thức `{0,1}`. Ví dụ pattern `/abc.?/gm`.

<img src="images/23.jpg">

### 2.9. Các ký tự đặc biệt

Regex cung cấp những cú pháp đơn giản để có thể viết gọn một Regex. Danh sách các ký tự đặc biệt:

| Ký tự | Mô tả |
|-------|---------|
| \d | /[0-9]/ |
| \D | /[^0-9]/ |
| \w | /[a-zA-Z0-9]/ |
| \W | /[^a-zA-Z0-9]/ |
| \s | Khoảng trắng |
| \S | Ký tự bất kỳ không phải khoảng trắng |