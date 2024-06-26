// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:blog_app/core/entities/user.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;

  const UserSignIn({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });

  @override
  String toString() => 'UserSignInParams(email: $email, password: $password)';
}
