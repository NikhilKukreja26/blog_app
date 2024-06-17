// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blog_app/features/blog/domain/entities/blog.dart';

part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

@freezed
class BlogModel with _$BlogModel implements Blog {
  const factory BlogModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'poster_id') required String posterId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'topics') required List<String> topics,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _BlogModel;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);
}
