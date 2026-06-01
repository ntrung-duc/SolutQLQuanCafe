# Phần mềm Quản lý Cửa hàng Cafe

Ứng dụng quản lý cửa hàng café được xây dựng bằng Windows Forms với C# và SQL Server.

## Mô tả

Đây là một giải pháp toàn diện để quản lý hoạt động kinh doanh của cửa hàng cafe, bao gồm:
- Quản lý menu, danh mục sản phẩm
- Quản lý bàn và hoá đơn
- Quản lý khách hàng
- Quản lý nhân viên
- Báo cáo doanh thu
- Quản lý kho

## Công nghệ sử dụng

- Frontend: Windows Forms (C#) - 85.4%
- Backend: C# - 85.4%
- Database: SQL Server, T-SQL - 14.6%
- IDE: Visual Studio

## Yêu cầu hệ thống

- Windows 7 trở lên
- Visual Studio 2019 hoặc cao hơn
- SQL Server 2016 hoặc cao hơn
- .NET Framework 4.7.2+

## Hướng dẫn cài đặt

### 1. Chuẩn bị môi trường

Cài đặt Visual Studio (Community Edition là đủ), SQL Server và SQL Server Management Studio (SSMS)

### 2. Thiết lập dự án

Giải nén source code vào:
```
C:\Users\Admin\source\repos
```

Hoặc bạn có thể chọn đường dẫn khác tùy thích

### 3. Tạo cơ sở dữ liệu

- Mở SQL Server Management Studio
- Chạy file script: QuanLyQuanCafe.sql
- Điều này sẽ tạo database và dữ liệu mẫu

### 4. Mở dự án

- Mở Visual Studio
- Tải file: SolutQLQuanCafe.sln

### 5. Cấu hình kết nối Database

Mở file: CShapQuanLyQuanCafe\ProjectQLQuanCafe\DAL\DataProvider.cs

Cập nhật Connection String để kết nối với SQL Server của bạn:

```
connectionString = "Server=YOUR_SERVER_NAME;Database=QuanLyQuanCafe;User Id=sa;Password=YOUR_PASSWORD;";
```

Ghi chú: File sẽ có hướng dẫn chi tiết bên trong code comment

### 6. Chạy ứng dụng

Nhấn F5 hoặc click nút Start trong Visual Studio. Ứng dụng sẽ khởi động

## Cấu trúc dự án

```
SolutQLQuanCafe/
├── CShapQuanLyQuanCafe/
│   ├── ProjectQLQuanCafe/
│   │   ├── DAL/              (Data Access Layer)
│   │   ├── BUS/              (Business Logic Layer)
│   │   ├── GUI/              (User Interface - Windows Forms)
│   │   └── ...
│   └── ...
├── QuanLyQuanCafe.sql        (Database Script)
└── README.md
```

## Các tính năng chính

- Quản lý danh mục sản phẩm
- Quản lý bàn phục vụ
- Tạo và quản lý hoá đơn
- Quản lý nhân viên
- Báo cáo doanh thu
- Giao diện thân thiện, dễ sử dụng

## Bảo mật

- Xác thực người dùng
- Quản lý quyền truy cập
- Bảo vệ dữ liệu nhạy cảm

## Đóng góp

Nếu bạn muốn đóng góp hoặc báo cáo vấn đề, vui lòng tạo Issue hoặc Pull Request.

## Ghi chú

Đây là dự án học tập cho môn Lập trình Windows Forms. Mã nguồn và báo cáo chi tiết đã được bao gồm.

## Liên hệ

Nếu có câu hỏi, vui lòng liên hệ qua GitHub hoặc email.

---

Cảm ơn đã sử dụng phần mềm quản lý cửa hàng Cafe
