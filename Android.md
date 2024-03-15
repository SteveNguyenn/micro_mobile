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

### Cấu hình
#### Flutter
1. <b>Lưu ý</b>
- Hiện tại Flutter đang gặp vấn đề với nhiều module khi cấu hình ở setting.gradle. Xem thêm lỗi tại [Github](https://github.com/flutter/flutter/issues/39707).
- Để khắc phục vấn đề này chúng ta sẽ tạo thêm 1 module với mục đích gom nhóm các module lại và module này sẽ tương tác với **Native Core**.
- Chúng ta cần tùy chỉnh router ở module gom nhóm để điều hướng tới các module mình mong muốn.
- Việc tạo Engine sẽ không ảnh hưởng.
- Chi tiết xem tại [Yody Umbrella](./yody_umbrella).
2. Tạo modules: Xem tại đây [Flutter](./flutter.md)
3. Tạo Engine cho các modules:
- <b>Ý tưởng</b>: Chúng ta sẽ tạo 1 class kế thừa FlutterActivity với mục đích sẽ xử lý các vấn đề liên quan tới giao tiếp, engine ngay tại class này.
```
//Tạo class kế FlutterActivity
class LoginActivity : FlutterActivity() {
    companion object {

        //nếu muốn cache engine thì viết hàm này
        fun withCachedEngine(cachedEngineId: String): CachedEngineIntentBuilder {
            return CachedEngineIntentBuilder(LoginActivity::class.java, cachedEngineId)
        }
        
        //nếu dùng engine bình thường thì viết hàm này
        fun withNewEngine(): NewEngineIntentBuilder {
            return NewEngineIntentBuilder(LoginActivity::class.java)
        }
    }
}

//Sửa lại ở AndroidManifest.xml
//Thêm dòng sau nếu AndroidManifest của bạn chưa có
<activity
android:name=".FoodActivity"
android:exported="false" />

Lưu ý:
- Cần viết lại hàm tạo Engine để lúc tạo class có thể gọi tới
- Thay LoginActivity bằng tên Activity mà bạn mong muốn
```
3. Gắn các modules vào Native:
- Cấu hình ở setting.gradle
```
//Thêm dòng này vào pluginManagement, dependencyResolutionManagement
maven {
    url 'https://storage.googleapis.com/download.flutter.io'
}
```
```
//Sửa dependencyResolutionManagement từ RepositoriesMode.FAIL.... thành dòng dưới
repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
```
```
//Chỉ trỏ vào thư mục gom nhóm
setBinding(new Binding([gradle: this]))                                // new
evaluate(new File(                                                     // new
        settingsDir.parentFile,                                            // new
        '#{Tên thư mục gom nhóm Flutter module}/.android/include_flutter.groovy'                   // new
))
```