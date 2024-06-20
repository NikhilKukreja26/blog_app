// Package imports:
import 'package:blog_app/core/network/connection_checker.dart';
import 'package:blog_app/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Project imports:
import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/features/blog/data/repositories/blog_repository_impl.dart';
import 'package:blog_app/features/blog/domain/repositories/blog_repository.dart';
import 'package:blog_app/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';
import 'package:blog_app/features/blog/presentation/bloc/blog_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBlog();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  serviceLocator.registerLazySingleton<Box>(() => Hive.box(name: 'blogs'));

  serviceLocator.registerLazySingleton<SupabaseClient>(() => supabase.client);

  // core
  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator
      .registerFactory<InternetConnection>(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      internetConnection: serviceLocator<InternetConnection>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>(),
      connectionChecker: serviceLocator<ConnectionChecker>(),
    ),
  );

  serviceLocator.registerFactory<UserSignUp>(
    () => UserSignUp(authRepository: serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerFactory<UserSignIn>(
    () => UserSignIn(authRepository: serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerFactory<CurrentUser>(
    () => CurrentUser(authRepository: serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      userSignIn: serviceLocator<UserSignIn>(),
      userSignUp: serviceLocator<UserSignUp>(),
      currentUser: serviceLocator<CurrentUser>(),
      appUserCubit: serviceLocator<AppUserCubit>(),
    ),
  );
}

void _initBlog() {
  // DataSource
  serviceLocator.registerFactory<BlogRemoteDataSource>(
    () => BlogRemoteDataSourceImpl(
      supabaseClient: serviceLocator<SupabaseClient>(),
    ),
  );

  // Local DataSource
  serviceLocator.registerFactory<BlogLocalDataSource>(
    () => BlogLocalDataSourceImpl(
      box: serviceLocator<Box>(),
    ),
  );

  // Repository
  serviceLocator.registerFactory<BlogRepository>(
    () => BlogRepositoryImpl(
      blogRemoteDataSource: serviceLocator<BlogRemoteDataSource>(),
      blogLocalDataSource: serviceLocator<BlogLocalDataSource>(),
      connectionChecker: serviceLocator<ConnectionChecker>(),
    ),
  );

  // UseCases
  serviceLocator.registerFactory<UploadBlog>(
    () => UploadBlog(blogRepository: serviceLocator<BlogRepository>()),
  );

  serviceLocator.registerFactory<GetAllBlogs>(
    () => GetAllBlogs(blogRepository: serviceLocator<BlogRepository>()),
  );

  // Bloc/Cubit
  serviceLocator.registerLazySingleton<BlogBloc>(
    () => BlogBloc(
      uploadBlog: serviceLocator<UploadBlog>(),
      getAllBlogs: serviceLocator<GetAllBlogs>(),
    ),
  );
}
