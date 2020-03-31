import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

void main() {
  final textFinder = find.byValueKey('generated_password');
  final buttonFinder = find.byValueKey('generate');
  final sliderFinder = find.byValueKey('slider');

  FlutterDriver driver;
  Ozzie ozzie;

  group('Generate Password App', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'password_generator');
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
      ozzie.generateHtmlReport();
    });

    test('starts with password text empty', () async {
      await ozzie.profilePerformance('password_generator1', () async {
        expect(await driver.getText(textFinder), '');
        await ozzie.takeScreenshot('initial_password_is_empty');
      });
    });

    test('generates a random password when taps on button', () async {
      await ozzie.profilePerformance('password_generator2', () async {
        await driver.tap(buttonFinder);

        expect(await driver.getText(textFinder), isNot(equals('')));
        await ozzie.takeScreenshot('password_is_not_empty');
      });
    });

    test('generates two random password when taps twice on button', () async {
      await ozzie.profilePerformance('password_generator3', () async {
        await driver.tap(buttonFinder);
        var firstResult = await driver.getText(textFinder);

        await driver.tap(buttonFinder);
        var lastResult = await driver.getText(textFinder);

        expect(lastResult, isNot(equals(firstResult)));
        await ozzie.takeScreenshot('password_is_not_equals_to_previous');
      });
    });

    test('increases password size when scroll on slider', () async {
      await ozzie.profilePerformance('password_generator4', () async {
        await driver.scroll(sliderFinder, 300, 0, Duration(seconds: 1));
        await driver.tap(buttonFinder);

        var result = await driver.getText(textFinder);
        expect(result, isNot(equals('')));
        expect(result, hasLength(32));

        //check the current number of the slider 
        await ozzie.takeScreenshot('password_is_greater_than_default');
      });
    });

    test('decreases password size when scroll on slider', () async {
      await ozzie.profilePerformance('password_generator5', () async {
        await driver.scroll(sliderFinder, -300, 0, Duration(seconds: 1));
        await driver.tap(buttonFinder);

        var result = await driver.getText(textFinder);
        expect(result, isNot(equals('')));
        expect(result, hasLength(4));
        await ozzie.takeScreenshot('password_is_lower_than_default');
      });
    });

    //turn off all the switches and verify the generate button is disabled
  });
}
