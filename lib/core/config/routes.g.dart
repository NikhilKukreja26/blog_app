// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signInPageData,
      $signUpPageData,
      $homePageData,
    ];

RouteBase get $signInPageData => GoRouteData.$route(
      path: '/signIn',
      name: 'signIn',
      factory: $SignInPageDataExtension._fromState,
    );

extension $SignInPageDataExtension on SignInPageData {
  static SignInPageData _fromState(GoRouterState state) =>
      const SignInPageData();

  String get location => GoRouteData.$location(
        '/signIn',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpPageData => GoRouteData.$route(
      path: '/signUp',
      name: 'signUp',
      factory: $SignUpPageDataExtension._fromState,
    );

extension $SignUpPageDataExtension on SignUpPageData {
  static SignUpPageData _fromState(GoRouterState state) =>
      const SignUpPageData();

  String get location => GoRouteData.$location(
        '/signUp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageData => GoRouteData.$route(
      path: '/home',
      name: 'home',
      factory: $HomePageDataExtension._fromState,
    );

extension $HomePageDataExtension on HomePageData {
  static HomePageData _fromState(GoRouterState state) => const HomePageData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
