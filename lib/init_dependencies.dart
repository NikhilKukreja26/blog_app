// Package imports:
import 'package:get_it/get_it.dart';
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

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator<AuthRemoteDataSource>(),
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

  // Repository
  serviceLocator.registerFactory<BlogRepository>(
    () => BlogRepositoryImpl(
      blogRemoteDataSource: serviceLocator<BlogRemoteDataSource>(),
    ),
  );

  // UseCases
  serviceLocator.registerFactory<UploadBlog>(
    () => UploadBlog(blogRepository: serviceLocator<BlogRepository>()),
  );

  // Bloc/Cubit
  serviceLocator.registerLazySingleton<BlogBloc>(
    () => BlogBloc(
      uploadBlog: serviceLocator<UploadBlog>(),
    ),
  );
}
