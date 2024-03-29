# Kiến trúc microservice cho mobile

## Mục tiêu

Giúp kết hợp được các framework phổ biến để phát triển cho mobile hiện nay (**Flutter**, **React Native**) vào trong 1 ứng dụng. Với mục đích:
- Tận dụng được những gì đã phát triển (dành cho các ứng dụng đã phát triển trước đó bằng ngôn ngữ khác và bây giờ muốn phát triển trên ngôn ngữ mới).
- Tận dụng được những thế mạnh của thành viên trong team hiện tại.
- Tận dụng tối đa các điểm mạnh cũng những framework phổ biến (phát triển nhanh, đồng bộ được logic, hỗ trợ hot reload, .....)

## Tổng quan về kiến trúc 
![Mobile Architecture](./images/mobile_architecture.png)  

#### Chi tiết
Hệ thống sẽ có 4 phần chính và tách riêng biệt:
- Native core (Phân biệt với Native module): Ứng dụng chính sẽ được xây dụng/ chạy trên phần này, và việc liên kết các module lại cũng nằm trên native core (**Flutter**, **React Native**, **Native**). **Native core** là thành phần **bắt buộc** phải có trong kiến trúc.</br>
![Native core](./images/native_core.png)
- Flutter modules (Không bắt buộc phải có trong kiến trúc): Chịu trách nhiệm phát triển một/nhiều tính năng trong ứng dụng. Các thành phần nhỏ có thể kết hợp lại với nhau và tương tác với **Native core** để hiển thị và tương tác. Xem ví dụ về flutter tại: [Yody Login](./yody_login), [Yody Profile](./yody_profile)</br>
![Flutter modules](./images/flutter_modules.png)</br>
- React native modules (Không bắt buộc phải có trong kiến trúc): Tương tự với **Flutter modules**. Xem ví dụ về **React Native** tại: [Yody Food](./yody_food), [Yody Employee](./yody_employee)</br>
![React Native modules](./images/rn_modules.png)</br>
- Native modules (Không bắt buộc phải có trong kiến trúc): Tương tự với **Flutter modules** và **React Native**.</br>
#### Tương tác
1. Giữa các module với nhau:
- **Native Core** sẽ chịu trách nhiệm làm cầu nối để nối giữa các module khác nhau lại. Ví dụ để có tương tác từ **Flutter** và **React Native** thì chúng ta sẽ đi theo tuần tự: 
  - **Flutter** tương tác với **Native core**
  - **Native Core** tương tác với **React Native**</br>
![Modules](./images/modules.png)
2. Trong một module (tương tự giữa Flutter/React Native/Native)</br>
![module flow](./images/flutter_modules.png)
- Tính năng (Features): Nơi phát triển các tính năng của module và là nơi sẽ tương tác với **Native Core** </br>
![Feature module](./images/feature_module.png)
- Core: Nơi cung cấp các API để cho **Features** gọi xuống các thư viện, bộ UI đã làm sẵn, .....
- Library: Nơi viết sẵn các thư viện như UI, Local Storage, Network với mục đích để tận dụng được lại ở nhiều **Features** tránh lặp lại code và đồng nhất code giữa các modules. **Core** cũng với mục đích khi developer muốn thay đổi 1 bộ UI nào đó trên ứng dụng chỉ cần cập nhật ở tầng này thì các module sẽ đổi. Điều này tránh rủi cho cho việc cần phải sửa lại trên từng module khi cần cập nhật 1 vấn đề nào đó.
#### Truyền và nhận dữ liệu giữa
1. Giữa các module với nhau: Có 2 cách để truyền và nhận dữ liệu giữa các module</br></br>
![Passing data](./images/passing_data.png)
- Thông qua tầng **Native Core**: Tương tự như phần tương tác thì **Native Core** cũng sẽ chịu trách nhiệm truyền và nhận dữ liệu giữa các modules với nhau. **Native Core** sẽ là cầu nối để dữ liệu chạy qua.
- Thông qua **Local Storage**: Thay vì đi qua **Native Core** thì khi cần truyền và nhận dữ liệu thì sẽ đưa xuống **Local Storage** từ đó có thể lấy ra sử dụng ở nơi cần dữ liệu.
2. Trong từng module với nhau: 
- Trong 1 module thì sẽ tận dụng truyền/nhận như cách thông thường mà các framework (Flutter/React Native) hay sử dụng: truyền dữ liệu, redux,....
#### Ưu và nhược điểm của kiến trúc
1. Ưu điểm:
- Tận dụng được hết toàn bộ nguồn lực của thành viên trong team và từ đó giảm thời gian để phát triển ứng dụng.
- Có thể tận dụng được những dự án hiện có mà không cần phải chuyển đổi qua 1 ngôn ngữ khác để phát triển.
- Các module được phát triển độc lập sẽ tránh gây ảnh hưởng tới nhau, logic chia ra rõ ràng và không cần phải chờ trong lúc đợi nhau trong lúc phát triển.
- Có thể cập nhật được 1 số tính năng đặc thù của từng framework: Code push cho React Native module, nếu tính năng cần nhiều hiệu năng hoặc tùy biến sâu thì có thể viết bằng native giúp tối ưu tốt nhất cho trải nghiệm,....
- Dễ dàng phát triển thêm tính năng cho tương lai.
- Không bị phụ thuộc vào Framework.
2. Nhược điểm:
- Ứng dụng có thể nặng hơn so với bình thường vì phải tích hợp nhiều framework vào.
- Cần hiểu rõ nền tảng phát triển của ứng dụng: Vì cần làm nhiều với tầng native.
- Giao tiếp qua lại giữa các module sẽ gây khó hiểu.
- Sẽ chậm thời gian đầu do mất thời gian chờ các engine tải dữ liệu từ các module lên.
- Cần phải thường xuyên kiểm tra code vì chỉ cần xảy ra vấn đề ở tầng core có thể gây ra ảnh hưởng đến toàn bộ ứng dụng.
- Các bộ UI có thể khác nhau giữa các mini app. Do các framework có cách triển khai UI khác nhau.
- Các phiên bản React Native/ Flutter phải đồng bộ vì tránh trường hợp hợp compile ra native sẽ conflict những thư viện ở tầng core.
## Kĩ thuật
1. Ý tưởng [Chi tiết](./content.md)
2. Tài liệu triển khai cho [iOS](./iOS.md)
3. Tài liệu trển khai cho [Android](./Android.md)