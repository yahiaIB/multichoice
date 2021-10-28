class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

//  static final RegExp _passwordRegExp = RegExp(
//    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
//  );
  static final RegExp _passwordRegExp = RegExp(
    r'^[A-Za-z\d]{8,}$',
  );

  static final RegExp _amountRegExp = RegExp(
    r'^(\d*\.)?\d+$',
  );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidUserName(String userName) {
    return userName.length >= 10;
  }

  static isValidAmount(String amount) {
    return _amountRegExp.hasMatch(amount);
  }

  static isValidString(String value) {
    bool s = value.length >= 2;
    return s;
  }

  static  validString(String value) {
    if (value.length >= 2) {
      return null;
    }
    return "غير صالح";
  }

  static validPassword(String value) {
    if (value.length >= 8) {
      return null;
    }
    return "كلمة المرور غير صالحه";
  }

  static validEmail(String value) {
    if (_emailRegExp.hasMatch(value)) {
      return null;
    }
    return "البريد الألكتروني غير صالح";
  }

  static isValidMobile(String value) {
    bool s = value.length >= 6;
    return s;
  }

//  static isValidPassword(String password) {
//    return _passwordRegExp.hasMatch(password);
//  }
  static isValidPassword(String password) {
    return password.length >= 8;
  }
}
