# Ngôn ngữ Markdown
Ngôn ngữ Markdown chủ yếu được tôi sử dụng để ghi chép lại quá trình nghiên cứu của mình, do đó sẽ không sử dụng những thứ nâng cao mà chỉ tập trung vào những cái cơ bản hay sử dụng
Tạo 1 file .md rồi sử dụng các công cụ để edit file như notepad++,...
Những thứ tôi hay dùng nhất:

[1. Thẻ tiêu đề](#title)
[2. Chèn link, chèn ảnh](#chenlink)
[3. Ký tự in đậm, in nghiêng](#boldnitalic)
[4. Highlight chữ, đoạn văn bản](#highlight)
[5. Gạch đầu dòng](#gachdaudong)
[6. Tạo bảng](#taobang)

==========================================================
<a name="title"></a>
## 1. Thẻ tiêu đề

Markdown sử dụng kí tự # để bắt đầu 1 thẻ tiêu đề, có thể dùng từ 1 đến 6 ký tự # liên tiếp. Độ lớn của tiêu để sẽ giảm dần từ 1 đến 6

Ví dụ:

```sh
#1.Tiêu đề cấp 1
##2. Tiêu đề cấp 2
...
######6. Tiêu đề cấp 6
```

Kết quả:

```sh
# 1.Tiêu đề cấp 1
## 2.Tiêu đề cấp 2
...
###### 6. Tiêu đề cấp 6
```

<a name="chenlink"></a>
## 2. Chèn link, chèn ảnh

- Để chèn 1 hyperlink vào file .md bạn chỉ cần copy link và paste trực tiếp vào file 

Ví dụ: 
```sh
`https://github.com`
```

Kết quả: 
https://github.com

- Hoặc có thể rút ngắn đường dẫn bằng cú pháp
```sh
`[GitHub](https://github.com)`
```
Kết quả:
[GitHub](https://github.com)

- Để chèn ảnh sử dụng cú pháp
```sh
`<img src="link_anh">`
```
Cách tôi thường sử dụng đó là đẩy hết ảnh vào một folder rồi đẩy lên GitHub sau đó lấy đường dẫn ảnh đó đưa vào file, làm vậy sẽ giảm nguy cơ bị lỗi đường dẫn ảnh.

<a name="boldnitalic"></a>
## 3. Ký tự in đậm, in nghiêng
- Để in đậm 1 đoạn text ta như sau:
```sh
**từ cần in đậm**
```

Kết quả:
**từ cần in đậm**

- Để in nghiêng 1 đoạn text làm như sau:
```sh
*từ cần in nghiêng*
```

Kết quả:
*từ cần in nghiêng*

<a name="highlight"></a>
## 4. Highlight chữ, đoạn văn bản
- Để highlight 1 dòng text ta làm như sau:

```sh
`đoạn cần highlight`
```

Kết quả: `đoạn cần highlight`

- Để highlight 1 đoạn ta làm như sau 
```sh
```sh
đoạn này cần phải highlight
để nhìn cho nổi bật
```
```

Kết quả:
```sh
đoạn này cần phải highlight
để nhìn cho nổi bật 
```

<a name="gachdaudong"></a>
## 5. Gạch đầu dòng

Để sử dụng gạch đầu dòng chỉ cần dùng cú pháp:
```sh
- Gạch đầu dòng 1
<ul>
<li>Lùi so với đầu dòng 1</li>
</ul>
```

Kết quả:
- Gạch đầu dòng 1
<ul>
<li> Lùi so với đầu dòng 1</li>
</ul>

<a name="taobang"></a>
## 6. Tạo bảng

Để tạo bảng dùng cú pháp:
```sh
|| Cột 2 | Cột 3| Cột 4|
|Hàng 2| 1| 2| 3|
|Hàng 3| 3| 2| 1|
```

Kết quả:
|| Cột 2 | Cột 3| Cột 4|
|Hàng 2| 1| 2| 3|
|Hàng 3| 3| 2| 1|



