import 'package:fpdart/fpdart.dart';

import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/core/entities/user.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  const CurrentUser({
    required this.authRepository,
  });

  @override
  Future<Either<Failure, User>> call(NoParams noParams) async {
    return await authRepository.getCurrentUser();
  }
}
