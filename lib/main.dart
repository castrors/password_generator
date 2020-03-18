import 'package:flutter/material.dart';
import 'package:password_generator/password_generator_page.dart';
import 'package:password_generator/theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: PasswordGeneratorPage(),
    );
  }
}
