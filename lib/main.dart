// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:blog_app/common.dart';
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/init_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppUserCubit>(
          create: (_) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(const AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocListener<AppUserCubit, AppUserState>(
        listener: (context, state) {
          // goRouter.refresh();
          // print('Listening');
          // if (state is AppUserLoggedIn) {
          //   const BlogPageData().go(rootNavigatorKey.currentState!.context);
          // } else {
          //   const SignInPageData().go(rootNavigatorKey.currentState!.context);
          // }
        },
        child: ScreenUtilInit(
          designSize: MediaQuery.sizeOf(context),
          ensureScreenSize: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Blog App',
              theme: AppTheme.darkThemeMode,
              routerConfig: goRouter,
            );
          },
        ),
      ),
    );
  }
}
