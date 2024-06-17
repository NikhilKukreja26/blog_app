part of 'blog_bloc.dart';

sealed class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {
  const BlogLoading();
}

final class BlogSuccess extends BlogState {
  const BlogSuccess();
}

final class BlogFailure extends BlogState {
  final String error;

  const BlogFailure({
    required this.error,
  });

  @override
  String toString() => 'BlogFailure(error: $error)';

  @override
  List<Object> get props => [error];
}
