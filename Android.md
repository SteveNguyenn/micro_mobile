# Triển khai cho Android

Cách để triển khai 1 dự án Android có dạng Microservice.

#### Kiến trúc xây dựng dựa trên

- Android Studio: 2023.2.1
- Java: 11
- Gradle: 7.5
- Node >= 20
- React Native: 0.69.4
- Flutter: 3.19.3

#### Native Core:
- Tạo như cách tạo 1 dự án Android bình thường: Ở kiến trúc này hiện áp dụng cho XML, Jetpack Compose tương tự.
- Để tạo dự án:
  - `Android Studio` -> `New Project` -> `Empty Activity` -> `Next` -> Điền thông tin, ở dòng Build Configuration language chọn Groovy DSL -> `finish`
  - Sau khi hoàn thành các bước trên sẽ có cấu trúc tương tự: [Android](./yody_micro_android)