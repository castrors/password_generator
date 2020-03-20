part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();
}

class PasswordInitial extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordGenerated extends PasswordState {
  final String password;

  const PasswordGenerated({@required this.password}) : assert(password != null);

  @override
  List<Object> get props => [password];
}
