class CustomValidator {
  static isEmail(String value) {
    if (value.isEmpty) {
      return 'Email inválido';
    }
    return null;
  }
}
