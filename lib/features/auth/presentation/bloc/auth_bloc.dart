// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/entities/user.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn _userSignIn;
  final UserSignUp _userSignUp;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthState.initial()) {
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  Future<void> _isUserLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser.call(const NoParams());

    res.fold(
      (l) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: l.message,
        ),
      ),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _onAuthSignIn(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final res = await _userSignIn(
        UserSignInParams(
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
        (user) => _emitAuthSuccess(user, emit),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    try {
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
        (user) => _emitAuthSuccess(user, emit),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  void _emitAuthSuccess(
    User user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user);
    emit(
      state.copyWith(
        status: AuthStatus.success,
        user: user,
      ),
    );
  }
}
