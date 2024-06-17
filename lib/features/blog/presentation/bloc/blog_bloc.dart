// Dart imports:
import 'dart:io';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blog_app/features/blog/domain/usecases/upload_blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  BlogBloc({
    required UploadBlog uploadBlog,
  })  : _uploadBlog = uploadBlog,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(const BlogLoading()));
    on<BlogUploadBlogToDatabase>(_onBlogUpload);
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
        const BlogSuccess(),
      ),
    );
  }
}
