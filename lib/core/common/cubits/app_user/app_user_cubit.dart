// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/core/entities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(User? user) {
    if (user == null) {
      return emit(AppUserInitial());
    }
    return emit(AppUserLoggedIn(user: user));
  }
}
