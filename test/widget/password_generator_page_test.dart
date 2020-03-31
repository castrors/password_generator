import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_generator/widgets/custom_button.dart';

void main() {
  testWidgets('CustomButton widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
            body: CustomButton(
          buttonKey: Key('generate'),
          text: 'GENERATE PASSWORD',
          isEnabled: true,
          onTap: () {},
        )),
      ),
    );

    final customButton = find.byType(CustomButton);
    expect(customButton, findsOneWidget);

    final buttonFinder = find.byKey(Key('generate'));
    expect(buttonFinder, findsOneWidget);

    final titleFinder = find.text('GENERATE PASSWORD');
    expect(titleFinder, findsOneWidget);

    var buttonFound = buttonFinder.evaluate().single.widget as RaisedButton;
    expect(buttonFound.enabled, true);
  });
}
