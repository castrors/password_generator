import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:password_generator/models/password_generator.dart';
import 'package:password_generator/models/password_input_data.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  @override
  PasswordState get initialState => PasswordInitial();

  @override
  Stream<PasswordState> mapEventToState(
    PasswordEvent event,
  ) async* {
    if (event is PerformGeneration) {
      var input = event.input;
      var password = PasswordGenerator.generate(
          input.length,
          input.includeLowercaseLetters,
          input.includeUppercaseLetters,
          input.includeNumbers,
          input.includeSymbols);
      yield PasswordGenerated(password: password);
    }
  }
}
