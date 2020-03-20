class PasswordInputData {
  final int length;
  final bool includeUppercaseLetters;
  final bool includeLowercaseLetters;
  final bool includeNumbers;
  final bool includeSymbols;

  PasswordInputData({
    this.length,
    this.includeUppercaseLetters,
    this.includeLowercaseLetters,
    this.includeNumbers,
    this.includeSymbols,
  });
}
