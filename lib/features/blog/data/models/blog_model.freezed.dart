// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) {
  return _BlogModel.fromJson(json);
}

/// @nodoc
mixin _$BlogModel {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_id')
  String get posterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'topics')
  List<String> get topics => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get posterName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogModelCopyWith<BlogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogModelCopyWith<$Res> {
  factory $BlogModelCopyWith(BlogModel value, $Res Function(BlogModel) then) =
      _$BlogModelCopyWithImpl<$Res, BlogModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'poster_id') String posterId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'topics') List<String> topics,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? posterName});
}

/// @nodoc
class _$BlogModelCopyWithImpl<$Res, $Val extends BlogModel>
    implements $BlogModelCopyWith<$Res> {
  _$BlogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posterId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? topics = null,
    Object? updatedAt = null,
    Object? posterName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterName: freezed == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogModelImplCopyWith<$Res>
    implements $BlogModelCopyWith<$Res> {
  factory _$$BlogModelImplCopyWith(
          _$BlogModelImpl value, $Res Function(_$BlogModelImpl) then) =
      __$$BlogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'poster_id') String posterId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'image_url') String imageUrl,
      @JsonKey(name: 'topics') List<String> topics,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? posterName});
}

/// @nodoc
class __$$BlogModelImplCopyWithImpl<$Res>
    extends _$BlogModelCopyWithImpl<$Res, _$BlogModelImpl>
    implements _$$BlogModelImplCopyWith<$Res> {
  __$$BlogModelImplCopyWithImpl(
      _$BlogModelImpl _value, $Res Function(_$BlogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posterId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? topics = null,
    Object? updatedAt = null,
    Object? posterName = freezed,
  }) {
    return _then(_$BlogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterName: freezed == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogModelImpl implements _BlogModel {
  const _$BlogModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'poster_id') required this.posterId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'image_url') required this.imageUrl,
      @JsonKey(name: 'topics') required final List<String> topics,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.posterName})
      : _topics = topics;

  factory _$BlogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'poster_id')
  final String posterId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final List<String> _topics;
  @override
  @JsonKey(name: 'topics')
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? posterName;

  @override
  String toString() {
    return 'BlogModel(id: $id, posterId: $posterId, title: $title, content: $content, imageUrl: $imageUrl, topics: $topics, updatedAt: $updatedAt, posterName: $posterName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.posterName, posterName) ||
                other.posterName == posterName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      posterId,
      title,
      content,
      imageUrl,
      const DeepCollectionEquality().hash(_topics),
      updatedAt,
      posterName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      __$$BlogModelImplCopyWithImpl<_$BlogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogModelImplToJson(
      this,
    );
  }
}

abstract class _BlogModel implements BlogModel {
  const factory _BlogModel(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'poster_id') required final String posterId,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'content') required final String content,
      @JsonKey(name: 'image_url') required final String imageUrl,
      @JsonKey(name: 'topics') required final List<String> topics,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final String? posterName}) = _$BlogModelImpl;

  factory _BlogModel.fromJson(Map<String, dynamic> json) =
      _$BlogModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'poster_id')
  String get posterId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(name: 'topics')
  List<String> get topics;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String? get posterName;
  @override
  @JsonKey(ignore: true)
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
