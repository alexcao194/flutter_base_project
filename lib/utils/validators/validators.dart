class Validators {
  const Validators._();

  static String? pinValidator(String value) {
    if (value.length != 6) {
      return 'PIN phải có 6 ký tự';
    }
    return null;
  }

  static String? emailValidator(String value) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$");
    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  static String? nameValidator(String value) {
    if (value.isEmpty) {
      return 'Tên không được để trống';
    }
    return null;
  }
}