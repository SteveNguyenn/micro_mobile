# React Native

Để thực hiện triển khai 1 dự án Microservice thì sẽ bắt đầu từ việc tạo các module. 

#### Thứ tự thực hiện

- Tạo folder ứng với tên của module
```
MacOS:
- mkdir #module name
Ex: 
- mkdir yody_food
- mkdir yody_employee
- cd yody_food
```
- Tạo index.js file
- Tạo file package.json gồm những dữ liệu sau:
```
{
  "name": "#module_name",
  "version": "0.0.1",
  "private": true,
  "scripts": {
    "start": "react-native start"
  },
  "dependencies": {
    "@babel/core": "^7.24.0",
    "@babel/preset-env": "^7.24.0",
    "react": "18.0.0",
    "react-native": "0.69.4",
  }
}

Ghi chú:
- Tùy từng phiên bản có thể thay đổi các thông số trên phù hợp
- Module_name nên để giống với tên folder
```
- Chạy thư viện 
```
yarn install hoặc npm install
```
Khi tạo xong sẽ được cấu trúc theo dạng tương tự như:
- [Yody Food](./yody_food)
- [Yody Employee](./yody_employee)