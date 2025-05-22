class Validators {
  static final emailRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  static final uppercaseRegex = RegExp(r'[A-Z]');
  static final lowercaseRegex = RegExp(r'[a-z]');
  static final digitsRegex = RegExp(r'[0-9]');
  static final phoneNumberRegex = RegExp(r"^(0[3|5|7|8|9])\d{8}$");

  static String? checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Không được bỏ trống";
    }
    return null;
  }

  static String? validEmail(email) {
    if (checkNullOrEmpty(email) != null) {
      return "Không được để trống";
    }

    if (emailRegex.hasMatch(email.trim())) {
      return null;
    }
    return "Không đúng định dạng email";
  }

  static String? validPassword(password) {
    if (checkNullOrEmpty(password) != null) {
      return "Không được để trống";
    }

    if (password.length < 8) {
      return "Mật khẩu phải có ít nhất 8 ký tự!";
    }

    if (!uppercaseRegex.hasMatch(password)) {
      return "Mật khẩu phải chứa ít nhất 1 chữ cái viết hoa!";
    }

    if (!lowercaseRegex.hasMatch(password)) {
      return "Mật khẩu phải chứa ít nhất 1 chữ cái viết thường!";
    }

    if (!digitsRegex.hasMatch(password)) {
      return "Mật khẩu phải chứa ít nhất 1 chữ số!";
    }

    return null;
  }

  static String? validPhoneNumber(phoneNumber) {
    if (checkNullOrEmpty(phoneNumber) != null) {
      return "Không được để trống";
    }

    if (!phoneNumberRegex.hasMatch(phoneNumber)) {
      return "Số điện thoại không đúng định dạng";
    }

    return null;
  }

  static String? validRePassword(rePassword, password) {
    if (checkNullOrEmpty(rePassword) != null) {
      return "Không được để trống";
    }

    if (rePassword != password) {
      return "Mật khẩu không khớp!";
    }

    return null;
  }
}
