part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  success,
  failure,
}

final class AuthState extends Equatable {
  final AuthStatus status;
  final String? uid;
  final String? error;

  const AuthState({
    required this.status,
    this.uid,
    this.error,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.initial,
    );
  }

  AuthState copyWith({
    AuthStatus? status,
    String? uid,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      uid: uid ?? this.uid,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'AuthState(status: $status, uid: $uid, error: $error)';

  @override
  List<Object?> get props => [
        status,
        uid,
        error,
      ];
}
