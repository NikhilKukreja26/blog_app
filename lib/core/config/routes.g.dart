// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signInPageData,
      $signUpPageData,
      $blogPageData,
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

RouteBase get $blogPageData => GoRouteData.$route(
      path: '/blog',
      name: 'blog',
      factory: $BlogPageDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-new-blog',
          name: 'addNewBlog',
          factory: $AddNewBlogPageDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'blog-details',
          name: 'blogDetails',
          factory: $BlogViewerDataExtension._fromState,
        ),
      ],
    );

extension $BlogPageDataExtension on BlogPageData {
  static BlogPageData _fromState(GoRouterState state) => const BlogPageData();

  String get location => GoRouteData.$location(
        '/blog',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddNewBlogPageDataExtension on AddNewBlogPageData {
  static AddNewBlogPageData _fromState(GoRouterState state) =>
      const AddNewBlogPageData();

  String get location => GoRouteData.$location(
        '/blog/add-new-blog',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BlogViewerDataExtension on BlogViewerData {
  static BlogViewerData _fromState(GoRouterState state) =>
      const BlogViewerData();

  String get location => GoRouteData.$location(
        '/blog/blog-details',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
