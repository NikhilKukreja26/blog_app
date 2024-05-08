// Package imports:
import 'package:fpdart/fpdart.dart';

// Project imports:
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
