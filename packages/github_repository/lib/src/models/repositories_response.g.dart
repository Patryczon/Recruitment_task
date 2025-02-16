// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepositoriesResponseImpl _$$RepositoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RepositoriesResponseImpl(
      totalCount: (json['total_count'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Repository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RepositoriesResponseImplToJson(
        _$RepositoriesResponseImpl instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'items': instance.items,
    };
