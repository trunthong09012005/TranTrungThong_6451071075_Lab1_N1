class InputValidator {
  InputValidator._();

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Vui lòng nhập email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) return 'Email không hợp lệ';
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    final password = value ?? '';
    if (password.isEmpty) return 'Vui lòng nhập mật khẩu';
    if (password.length < minLength) {
      return 'Mật khẩu tối thiểu $minLength ký tự';
    }
    return null;
  }

  static String? name(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) return 'Vui lòng nhập họ tên';
    if (name.length < 2) return 'Họ tên quá ngắn';
    return null;
  }
}
