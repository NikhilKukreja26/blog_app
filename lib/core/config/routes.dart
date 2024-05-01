// ignore_for_file: directives_ordering

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up_page.dart';

part 'routes.g.dart';

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: const SignInPageData().location,
  routes: $appRoutes,
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
