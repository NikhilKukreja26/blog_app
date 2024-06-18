part of 'blog_bloc.dart';

sealed class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object?> get props => [];
}

final class BlogUploadBlogToDatabase extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  const BlogUploadBlogToDatabase({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });

  @override
  String toString() {
    return 'BlogUploadBlogToDatabase(posterId: $posterId, title: $title, content: $content, image: $image, topics: $topics)';
  }

  @override
  List<Object> get props {
    return [
      posterId,
      title,
      content,
      image,
      topics,
    ];
  }
}

final class BlogFetchAllBlogs extends BlogEvent {
  const BlogFetchAllBlogs();
}
