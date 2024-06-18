// Dart imports:
import 'dart:io';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/blog/domain/entities/blog.dart';
import 'package:blog_app/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;
  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(const BlogLoading()));
    on<BlogUploadBlogToDatabase>(_onBlogUpload);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  Future<void> _onBlogUpload(
    BlogUploadBlogToDatabase event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold(
      (l) => emit(BlogFailure(error: l.message)),
      (r) => emit(
        const BlogUploadSuccess(),
      ),
    );
  }

  Future<void> _onFetchAllBlogs(
    BlogFetchAllBlogs event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _getAllBlogs(const NoParams());

    res.fold(
      (l) => emit(BlogFailure(error: l.message)),
      (blogs) => emit(
        BlogDisplaySuccess(blogs: blogs),
      ),
    );
  }
}
