import 'package:flutter_driver/driver_extension.dart';
import 'package:password_generator/main.dart' as app;


//to run integration tests run the command:
//flutter drive --target=test_driver/app.dart

//to run in a device with performance on:
//flutter drive --target=test_driver/app.dart --profile

void main() {
  enableFlutterDriverExtension();
  app.main();
}