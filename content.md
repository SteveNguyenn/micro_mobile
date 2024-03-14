# Ý tưởng

Để hiểu về microservice cho mobile thì đầu tiên sẽ tìm hiểu về cách 1 framework **React Native/ Flutter** hoạt động như thế nào?

#### Flutter

![Flutter Architecture](https://github.com/SteveNguyenn/micro_mobile/images/flutter_arch.png)  
Xem thêm chi tiết tại [Flutter](https://docs.flutter.dev/resources/architectural-overview)</br>

<b>Tóm tắt: </b>
- Flutter viết trên nền tảng là Dart. Mỗi lần cần vẽ UI/Logic thì bộ engine (Flutter Engine viết bằng C/C++) hoạt động và sẽ chuyển từ Dart code thành Platform Code (Có các thuật toán để vẽ và chuyển đổi logic)
- Ở iOS sẽ có FlutterViewController và Android sẽ có FlutterActivity: Chúng sẽ chịu trách nhiệm xử lý những thông tin mà Flutter gửi xuống.</br>
- Mỗi lần Flutter hoạt động sẽ hoạt động theo mô hình: 
    - Native sẽ khởi tạo và chạy. 
    - Engine Flutter sẽ được khởi tạo ở hàm chạy đầu tiên của native.
    - Khi Engine khởi tạo thì Engine sẽ gọi tới những hàm của Flutter để Flutter bắt đầu chạy và vẽ lên view của FlutterViewController/FlutterActivity tùy thuộc vào cấu hình của Engine. </br>

<b>Triển khai </b>
- Vì FlutterViewController là ViewController và FlutterActivity là Activity: là 1 dạng màn hình ở native nên chúng ta sẽ triển khai những Engine riêng biệt cho những module riêng biệt. Ví dụ muốn khởi chạy **Login module** thì chúng ta sẽ cấu hình cho Engine gọi tới module này và mở Controller/Activity tương ứng với Engine đó ở tầng Native.

<b> Làm thế nào để Native có thể biết vị trí của các module? </b>
- Khi các module tạo sẽ sẽ có những module native (.ios/.android) của những module đó. Bây giờ chỉ cần liên kết các thư mục này vào trong native thông qua pod/build.gradle thì native sẽ thấy được các module đó. Chi tiết sẽ nằm ở phần kĩ thuật.

#### React Native

![React Native Architecture](https://github.com/SteveNguyenn/micro_mobile/images/rn_arch.jpeg)  
Xem thêm chi tiết tại [React Native](https://reactnative.dev/architecture/overview)</br>
<b>Tóm tắt: </b>
- React Native viết trên nền tảng là JavaScript. Mỗi lần cần vẽ UI/Logic thì bộ engine (React Native Engine) hoạt động và sẽ gọi code của các Platform.
- Ở iOS/Android việc hiển thị UI sẽ được chịu trách nhiệm bởi 1 UI gọi là **RCTRootView**
- Mỗi lần React Native hoạt động sẽ hoạt động theo mô hình: 
    - Native sẽ khởi tạo và chạy. 
    - Native sẽ khởi tạo 1 Controller/Activity lên.
    - Thực hiện việc tải UI lên thông qua **RCTRootView** và gắn vào UI của Controller/Activity tương ứng
    - Từ đây thì các code JavaScript sẽ được khởi chạy</br>

<b>Triển khai </b>
- Vì chỉ cần ViewController/Activity là chúng ta có thể tải được JavaScript thông qua **RCTRootView** nên chỉ cần khởi tạo ViewController/Activity và thực hiện gọi đúng tên module + đường dẫn (**RCTRootView** yêu cầu) thì các module sẽ được tải lên.

<b> Làm thế nào để Native có thể biết vị trí của các module? </b>
- Khi các module tạo sẽ sẽ có những node_modules. Bây giờ chỉ cần liên kết các thư node_modules vào trong native thông qua pod/build.gradle thì native sẽ thấy được các module đó. Chi tiết sẽ nằm ở phần kĩ thuật.

## Kĩ thuật
1. Tài liệu triển khai cho [iOS](https://github.com/SteveNguyenn/micro_mobile/iOS.md)
2. Tài liệu trển khai cho [Android](https://github.com/SteveNguyenn/micro_mobile/Android.md)
