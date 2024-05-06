// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthState.initial()) {
    on<AuthSignUp>(_onAuthSignUp);
  }

  Future<void> _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final res = await _userSignUp(
        UserSignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
        ),
      );

      res.fold(
        (failure) => emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: failure.message,
          ),
        ),
        (uid) => emit(
          state.copyWith(
            status: AuthStatus.success,
            uid: uid,
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure));
    }
  }
}
