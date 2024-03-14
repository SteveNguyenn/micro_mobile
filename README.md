# Kiến trúc microservice cho mobile

## Mục tiêu

Giúp kết hợp được các framework phổ biến để phát triển cho mobile hiện nay (**Flutter**, **React Native**) vào trong 1 ứng dụng. Với mục đích:
- Tận dụng được những gì đã phát triển (dành cho các ứng dụng đã phát triển trước đó bằng ngôn ngữ khác và bây giờ muốn phát triển trên ngôn ngữ mới).
- Tận dụng được những thế mạnh của thành viên trong team hiện tại.
- Tận dụng tối đa các điểm mạnh cũng những framework phổ biến (phát triển nhanh, đồng bộ được logic, hỗ trợ hot reload, .....)

## Tổng quan về kiến trúc 
![Mobile Architecture](https://github.com/SteveNguyenn/micro_mobile/blob/d7b47364035417b4aed696dd58050b2ecd0e22f8/images/mobile_architecture.png)  

#### Chỉ tiết
Hệ thống sẽ có 4 phần chính và tách riêng biệt:
- Native core (Phân biệt với Native module): Ứng dụng chính sẽ được xây dụng/ chạy trên phần này, và việc liên kết các module lại cũng nằm trên native core (**Flutter**, **React Native**, **Native**). Thành phần **bắt buộc** phải có trong kiến trúc.</br>
![Native core](https://github.com/SteveNguyenn/micro_mobile/blob/d7b47364035417b4aed696dd58050b2ecd0e22f8/images/native_core.png)
- Flutter modules(Không bắt buộc phải có trong kiến trúc): Chịu trách nhiệm phát triển một/nhiều tính năng trong ứng dụng. Các thành phần nhỏ có thể kết hợp lại với nhau và tương tác với **Native core** để hiển thị và tương tác. Xem ví dụ về flutter tại: [Yody Login](https://github.com/SteveNguyenn/micro_mobile/tree/main/yody_login), [Yody Profile](https://github.com/SteveNguyenn/micro_mobile/tree/main/yody_profile)</br>
![Flutter modules](https://github.com/SteveNguyenn/micro_mobile/blob/d7b47364035417b4aed696dd58050b2ecd0e22f8/images/flutter_modules.png)

### Ordered

1. Item 1
2. Item 2
3. Item 3
    1. Item 3a
    2. Item 3b

## Images

![This is an alt text.](/image/sample.webp "This is a sample image.")

## Links

You may be using [Markdown Live Preview](https://markdownlivepreview.com/).

## Blockquotes

> Markdown is a lightweight markup language with plain-text-formatting syntax, created in 2004 by John Gruber with Aaron Swartz.
>
>> Markdown is often used to format readme files, for writing messages in online discussion forums, and to create rich text using a plain text editor.

## Tables

| Left columns  | Right columns |
| ------------- |:-------------:|
| left foo      | right foo     |
| left bar      | right bar     |
| left baz      | right baz     |

## Blocks of code

```
let message = 'Hello world';
alert(message);
```

## Inline code

This web site is using `markedjs/marked`.
