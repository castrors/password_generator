import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Generate Password App', () {
    final textFinder = find.byValueKey('generated_password');
    final buttonFinder = find.byValueKey('generate');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with password text empty', () async {
      expect(await driver.getText(textFinder), '');
    });

    test('generates a random password when taps on button', () async {
      // First, tap the button.
      await driver.tap(buttonFinder);

      expect(await driver.getText(textFinder), isNot(equals('')));
    });
  });
}
