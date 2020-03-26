import 'dart:math';

class PasswordGenerator {
  static String generate(
      {int length, bool lower, bool upper, bool number, bool symbol}) {
    var password = '';

    if (lower) {
      for (var i = 0; i < length; i++) {
        password += _randomLower();
      }
    }
    if (upper) {
      for (var i = 0; i < length; i++) {
        password += _randomUpper();
      }
    }

    if (number) {
      for (var i = 0; i < length; i++) {
        password += _randomNumber();
      }
    }

    if (symbol) {
      for (var i = 0; i < length; i++) {
        password += _randomSymbol();
      }
    }

    if (!(lower || upper || number || symbol)) {
      password = 'password';
    } else {
      password = (password.split('')..shuffle()).join('').substring(0, length);
    }

    return password;
  }

  static String _randomLower() {
    return String.fromCharCode(Random().nextInt(26).floor() + 97);
  }

  static String _randomUpper() {
    return String.fromCharCode(Random().nextInt(26).floor() + 65);
  }

  static String _randomNumber() {
    return String.fromCharCode(Random().nextInt(10).floor() + 48);
  }

  static String _randomSymbol() {
    const symbols = '!@#\$%^&*(){}[]=<>/,.';
    return symbols[Random().nextInt(symbols.length).floor()];
  }
}
