import 'package:flutter/material.dart';
import 'package:password_generator/models/password_model.dart';
import 'package:password_generator/password_generator_page.dart';
import 'package:password_generator/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PasswordModel>(
      create: (BuildContext context) => PasswordModel(),
      child: MaterialApp(
        theme: appTheme,
        home: PasswordGeneratorPage(),
      ),
    );
  }
}
