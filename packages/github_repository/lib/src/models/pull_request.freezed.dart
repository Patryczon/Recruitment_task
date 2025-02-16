// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pull_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PullRequest _$PullRequestFromJson(Map<String, dynamic> json) {
  return _PullRequest.fromJson(json);
}

/// @nodoc
mixin _$PullRequest {
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url')
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'diff_url')
  String get diffUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'patch_url')
  String get patchUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_url')
  String get issueUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Serializes this PullRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PullRequestCopyWith<PullRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PullRequestCopyWith<$Res> {
  factory $PullRequestCopyWith(
          PullRequest value, $Res Function(PullRequest) then) =
      _$PullRequestCopyWithImpl<$Res, PullRequest>;
  @useResult
  $Res call(
      {String? body,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'diff_url') String diffUrl,
      @JsonKey(name: 'patch_url') String patchUrl,
      @JsonKey(name: 'issue_url') String issueUrl,
      DateTime? createdAt,
      String title,
      int number,
      User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$PullRequestCopyWithImpl<$Res, $Val extends PullRequest>
    implements $PullRequestCopyWith<$Res> {
  _$PullRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? htmlUrl = null,
    Object? diffUrl = null,
    Object? patchUrl = null,
    Object? issueUrl = null,
    Object? createdAt = freezed,
    Object? title = null,
    Object? number = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      diffUrl: null == diffUrl
          ? _value.diffUrl
          : diffUrl // ignore: cast_nullable_to_non_nullable
              as String,
      patchUrl: null == patchUrl
          ? _value.patchUrl
          : patchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      issueUrl: null == issueUrl
          ? _value.issueUrl
          : issueUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PullRequestImplCopyWith<$Res>
    implements $PullRequestCopyWith<$Res> {
  factory _$$PullRequestImplCopyWith(
          _$PullRequestImpl value, $Res Function(_$PullRequestImpl) then) =
      __$$PullRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? body,
      @JsonKey(name: 'html_url') String htmlUrl,
      @JsonKey(name: 'diff_url') String diffUrl,
      @JsonKey(name: 'patch_url') String patchUrl,
      @JsonKey(name: 'issue_url') String issueUrl,
      DateTime? createdAt,
      String title,
      int number,
      User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$PullRequestImplCopyWithImpl<$Res>
    extends _$PullRequestCopyWithImpl<$Res, _$PullRequestImpl>
    implements _$$PullRequestImplCopyWith<$Res> {
  __$$PullRequestImplCopyWithImpl(
      _$PullRequestImpl _value, $Res Function(_$PullRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? body = freezed,
    Object? htmlUrl = null,
    Object? diffUrl = null,
    Object? patchUrl = null,
    Object? issueUrl = null,
    Object? createdAt = freezed,
    Object? title = null,
    Object? number = null,
    Object? user = null,
  }) {
    return _then(_$PullRequestImpl(
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      diffUrl: null == diffUrl
          ? _value.diffUrl
          : diffUrl // ignore: cast_nullable_to_non_nullable
              as String,
      patchUrl: null == patchUrl
          ? _value.patchUrl
          : patchUrl // ignore: cast_nullable_to_non_nullable
              as String,
      issueUrl: null == issueUrl
          ? _value.issueUrl
          : issueUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PullRequestImpl implements _PullRequest {
  const _$PullRequestImpl(
      {this.body,
      @JsonKey(name: 'html_url') required this.htmlUrl,
      @JsonKey(name: 'diff_url') required this.diffUrl,
      @JsonKey(name: 'patch_url') required this.patchUrl,
      @JsonKey(name: 'issue_url') required this.issueUrl,
      this.createdAt,
      required this.title,
      required this.number,
      required this.user});

  factory _$PullRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PullRequestImplFromJson(json);

  @override
  final String? body;
  @override
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @override
  @JsonKey(name: 'diff_url')
  final String diffUrl;
  @override
  @JsonKey(name: 'patch_url')
  final String patchUrl;
  @override
  @JsonKey(name: 'issue_url')
  final String issueUrl;
  @override
  final DateTime? createdAt;
  @override
  final String title;
  @override
  final int number;
  @override
  final User user;

  @override
  String toString() {
    return 'PullRequest(body: $body, htmlUrl: $htmlUrl, diffUrl: $diffUrl, patchUrl: $patchUrl, issueUrl: $issueUrl, createdAt: $createdAt, title: $title, number: $number, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PullRequestImpl &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.diffUrl, diffUrl) || other.diffUrl == diffUrl) &&
            (identical(other.patchUrl, patchUrl) ||
                other.patchUrl == patchUrl) &&
            (identical(other.issueUrl, issueUrl) ||
                other.issueUrl == issueUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, body, htmlUrl, diffUrl, patchUrl,
      issueUrl, createdAt, title, number, user);

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      __$$PullRequestImplCopyWithImpl<_$PullRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PullRequestImplToJson(
      this,
    );
  }
}

abstract class _PullRequest implements PullRequest {
  const factory _PullRequest(
      {final String? body,
      @JsonKey(name: 'html_url') required final String htmlUrl,
      @JsonKey(name: 'diff_url') required final String diffUrl,
      @JsonKey(name: 'patch_url') required final String patchUrl,
      @JsonKey(name: 'issue_url') required final String issueUrl,
      final DateTime? createdAt,
      required final String title,
      required final int number,
      required final User user}) = _$PullRequestImpl;

  factory _PullRequest.fromJson(Map<String, dynamic> json) =
      _$PullRequestImpl.fromJson;

  @override
  String? get body;
  @override
  @JsonKey(name: 'html_url')
  String get htmlUrl;
  @override
  @JsonKey(name: 'diff_url')
  String get diffUrl;
  @override
  @JsonKey(name: 'patch_url')
  String get patchUrl;
  @override
  @JsonKey(name: 'issue_url')
  String get issueUrl;
  @override
  DateTime? get createdAt;
  @override
  String get title;
  @override
  int get number;
  @override
  User get user;

  /// Create a copy of PullRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PullRequestImplCopyWith<_$PullRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
