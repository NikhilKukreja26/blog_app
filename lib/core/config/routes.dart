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
import 'package:blog_app/features/blog/presentation/pages/add_new_blog_page.dart';
import 'package:blog_app/features/blog/presentation/pages/blog_page.dart';
import 'package:blog_app/init_dependencies.dart';

part 'routes.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: rootNavigatorKey,
  refreshListenable:
      GoRouterRefreshStream(serviceLocator<AppUserCubit>().stream),
  initialLocation: const SignInPageData().location,
  routes: $appRoutes,
  redirect: (context, goRouterState) {
    final state = context.read<AppUserCubit>().state;
    final location = goRouterState.fullPath;

    if (location == null) {
      return const SignInPageData().location;
    }

    final isGoingToSignIn = location == const SignInPageData().location;
    final isGoingToSignUp = location == const SignUpPageData().location;

    if (state is AppUserLoggedIn) {
      if (isGoingToSignIn || isGoingToSignUp) {
        return const BlogPageData().location;
      }
      return null;
    }

    if (state is AppUserInitial) {
      if (!isGoingToSignIn && !isGoingToSignUp) {
        return const SignInPageData().location;
      }
    }
    return null;
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

@TypedGoRoute<BlogPageData>(
  path: '/blog',
  name: 'blog',
  routes: [
    TypedGoRoute<AddNewBlogPageData>(
      path: 'add-new-blog',
      name: 'addNewBlog',
    ),
  ],
)
class BlogPageData extends GoRouteData {
  const BlogPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BlogPage();
  }
}

class AddNewBlogPageData extends GoRouteData {
  const AddNewBlogPageData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddNewBlogPage();
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
