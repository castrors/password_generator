part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class PerformGeneration extends PasswordEvent {
  final PasswordInputData input;

  const PerformGeneration({@required this.input}) : assert(input != null);

  @override
  List<Object> get props => [input];
}
