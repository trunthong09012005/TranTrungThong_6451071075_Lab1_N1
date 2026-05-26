/// Lỗi nghiệp vụ trả về từ tầng domain/data (không phụ thuộc Firebase).
class Failure {
  const Failure({required this.message, this.code});

  final String message;
  final String? code;
}
