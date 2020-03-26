import 'package:flutter/material.dart';
import 'package:password_generator/models/password_generator.dart';

class PasswordModel extends ChangeNotifier {
  String _generatedPassword = '';
  int _length = 16;
  bool _includeUppercaseLetters = true;
  bool _includeLowercaseLetters = true;
  bool _includeNumbers = true;
  bool _includeSymbols = true;

  String get generatedPassword => _generatedPassword;

  int get length => _length;
  set length(value) {
    _length = value;
    notifyListeners();
  }

  bool get includeUppercaseLetters => _includeUppercaseLetters;
  set includeUppercaseLetters(value) {
    _includeUppercaseLetters = value;
    notifyListeners();
  }

  bool get includeLowercaseLetters => _includeLowercaseLetters;
  set includeLowercaseLetters(value) {
    _includeLowercaseLetters = value;
    notifyListeners();
  }

  bool get includeNumbers => _includeNumbers;
  set includeNumbers(value) {
    _includeNumbers = value;
    notifyListeners();
  }

  bool get includeSymbols => _includeSymbols;
  set includeSymbols(value) {
    _includeSymbols = value;
    notifyListeners();
  }

  bool get shouldEnableButton =>
      _includeUppercaseLetters ||
      _includeLowercaseLetters ||
      _includeNumbers ||
      _includeSymbols;

  void generate() {
    _generatedPassword = PasswordGenerator.generate(
        length: _length,
        lower: _includeLowercaseLetters,
        upper: _includeUppercaseLetters,
        number: _includeNumbers,
        symbol: _includeSymbols);
    notifyListeners();
  }
}
