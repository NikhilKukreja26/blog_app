// ignore_for_file: directives_ordering

// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:blog_app/init_dependencies.dart';

part 'routes.g.dart';

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  refreshListenable:
      GoRouterRefreshStream(serviceLocator<AppUserCubit>().stream),
  initialLocation: const SignInPageData().location,
  routes: $appRoutes,
  redirect: (context, goRouterState) {
    final state = context.read<AppUserCubit>().state;
    if (state is AppUserLoggedIn) {
      return const HomePageData().location;
    }
    return const SignInPageData().location;
  },
);

@TypedGoRoute<SignInPageData>(
  path: '/signIn',
  name: 'signIn',
)
class SignInPageData extends GoRouteData {
  const SignInPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInPage();
  }
}

@TypedGoRoute<SignUpPageData>(
  path: '/signUp',
  name: 'signUp',
)
class SignUpPageData extends GoRouteData {
  const SignUpPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignUpPage();
  }
}

@TypedGoRoute<HomePageData>(
  path: '/home',
  name: 'home',
)
class HomePageData extends GoRouteData {
  const HomePageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('LoggedIn'),
      ),
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
