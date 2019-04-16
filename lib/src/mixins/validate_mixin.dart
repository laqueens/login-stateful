class ValidateMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'please enter a valid email!';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'password length must be greater than 4 character\'s';
    }
    return null;
  }
}
