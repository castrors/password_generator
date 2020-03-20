import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_generator/bloc/password_bloc.dart';
import 'package:password_generator/bloc/simple_bloc_delegate.dart';
import 'package:password_generator/password_generator_page.dart';
import 'package:password_generator/theme.dart';
import 'package:provider/provider.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: BlocProvider(
        create: (context) => PasswordBloc(),
        child: PasswordGeneratorPage(),
      ),
    );
  }
}
