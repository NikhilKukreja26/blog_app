part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  const AuthSignIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSignUp({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
      ];
}
