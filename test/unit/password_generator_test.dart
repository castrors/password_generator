import 'package:test/test.dart';
import 'package:password_generator/models/password_generator.dart';

void main() {
  test('Password generated length should be the size of the length parameter',
      () {
    final password = PasswordGenerator.generate(
        length: 16, lower: true, upper: true, number: true, symbol: true);
    expect(password.length, 16);
  });
}
