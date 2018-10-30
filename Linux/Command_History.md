## Lưu các lệnh lặp liên tiếp

Để lệnh `history` có thể lưu các lệnh lặp lại liên tiếp thì ta thay đổi giá trị của biến môi trường $HISTCONTROL

Xem giá trị biến HISTCONTROL:

```
echo $HISTCONTROL
```

nếu thấy giá trị `ignoredups:ignorespace` thì nghĩa là lệnh `history` không lưu lại lệnh lặp liên tiếp và dấu cách ( nghĩa là không gõ lệnh gì chỉ ấn dấu cách xong enter). Ta chỉ cần bỏ giá trị `ignoredups` đi là được

```
unset export HISTCONTROL
```

## Hiển thị kèm theo thời gian

Để lệnh `history` hiển thị lại các câu lệnh và có kèm theo thời gian sử dụng câu lệnh đó, ta chỉ cần thêm giá trị cho biến $HISTTIMEFORMAT như sau:

```
export HISTTIMEFORMAT="%c "
```
