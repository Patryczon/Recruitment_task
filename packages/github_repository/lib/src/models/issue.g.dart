// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IssueImpl _$$IssueImplFromJson(Map<String, dynamic> json) => _$IssueImpl(
      body: json['body'] as String?,
      htmlUrl: json['html_url'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      number: (json['number'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$IssueImplToJson(_$IssueImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'html_url': instance.htmlUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'title': instance.title,
      'number': instance.number,
      'user': instance.user,
    };
