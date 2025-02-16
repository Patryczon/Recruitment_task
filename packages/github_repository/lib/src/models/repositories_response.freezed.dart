// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repositories_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepositoriesResponse _$RepositoriesResponseFromJson(Map<String, dynamic> json) {
  return _RepositoriesResponse.fromJson(json);
}

/// @nodoc
mixin _$RepositoriesResponse {
  @JsonKey(name: 'total_count')
  int get totalCount => throw _privateConstructorUsedError;
  List<Repository> get items => throw _privateConstructorUsedError;

  /// Serializes this RepositoriesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepositoriesResponseCopyWith<RepositoriesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepositoriesResponseCopyWith<$Res> {
  factory $RepositoriesResponseCopyWith(RepositoriesResponse value,
          $Res Function(RepositoriesResponse) then) =
      _$RepositoriesResponseCopyWithImpl<$Res, RepositoriesResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount, List<Repository> items});
}

/// @nodoc
class _$RepositoriesResponseCopyWithImpl<$Res,
        $Val extends RepositoriesResponse>
    implements $RepositoriesResponseCopyWith<$Res> {
  _$RepositoriesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepositoriesResponseImplCopyWith<$Res>
    implements $RepositoriesResponseCopyWith<$Res> {
  factory _$$RepositoriesResponseImplCopyWith(_$RepositoriesResponseImpl value,
          $Res Function(_$RepositoriesResponseImpl) then) =
      __$$RepositoriesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_count') int totalCount, List<Repository> items});
}

/// @nodoc
class __$$RepositoriesResponseImplCopyWithImpl<$Res>
    extends _$RepositoriesResponseCopyWithImpl<$Res, _$RepositoriesResponseImpl>
    implements _$$RepositoriesResponseImplCopyWith<$Res> {
  __$$RepositoriesResponseImplCopyWithImpl(_$RepositoriesResponseImpl _value,
      $Res Function(_$RepositoriesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? items = null,
  }) {
    return _then(_$RepositoriesResponseImpl(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Repository>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepositoriesResponseImpl implements _RepositoriesResponse {
  const _$RepositoriesResponseImpl(
      {@JsonKey(name: 'total_count') required this.totalCount,
      required final List<Repository> items})
      : _items = items;

  factory _$RepositoriesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepositoriesResponseImplFromJson(json);

  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  final List<Repository> _items;
  @override
  List<Repository> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'RepositoriesResponse(totalCount: $totalCount, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepositoriesResponseImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalCount, const DeepCollectionEquality().hash(_items));

  /// Create a copy of RepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepositoriesResponseImplCopyWith<_$RepositoriesResponseImpl>
      get copyWith =>
          __$$RepositoriesResponseImplCopyWithImpl<_$RepositoriesResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepositoriesResponseImplToJson(
      this,
    );
  }
}

abstract class _RepositoriesResponse implements RepositoriesResponse {
  const factory _RepositoriesResponse(
      {@JsonKey(name: 'total_count') required final int totalCount,
      required final List<Repository> items}) = _$RepositoriesResponseImpl;

  factory _RepositoriesResponse.fromJson(Map<String, dynamic> json) =
      _$RepositoriesResponseImpl.fromJson;

  @override
  @JsonKey(name: 'total_count')
  int get totalCount;
  @override
  List<Repository> get items;

  /// Create a copy of RepositoriesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepositoriesResponseImplCopyWith<_$RepositoriesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
