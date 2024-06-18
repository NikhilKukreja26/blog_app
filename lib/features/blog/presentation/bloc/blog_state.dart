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

final class BlogUploadSuccess extends BlogState {
  const BlogUploadSuccess();
}

final class BlogDisplaySuccess extends BlogState {
  final List<Blog> blogs;

  const BlogDisplaySuccess({
    required this.blogs,
  });

  @override
  String toString() => 'BlogDisplaySuccess(blogs: $blogs)';

  @override
  List<Object> get props => [blogs];
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
