part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
}

final class AuthState extends Equatable {
  final AuthStatus status;
  final User? user;
  final String? error;

  const AuthState({
    required this.status,
    this.user,
    this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.initial,
    );
  }

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'AuthState(status: $status, user: $user, error: $error)';

  @override
  List<Object?> get props => [
        status,
        user,
        error,
      ];
}
