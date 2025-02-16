// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PullRequestImpl _$$PullRequestImplFromJson(Map<String, dynamic> json) =>
    _$PullRequestImpl(
      body: json['body'] as String?,
      htmlUrl: json['html_url'] as String,
      diffUrl: json['diff_url'] as String,
      patchUrl: json['patch_url'] as String,
      issueUrl: json['issue_url'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String,
      number: (json['number'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PullRequestImplToJson(_$PullRequestImpl instance) =>
    <String, dynamic>{
      'body': instance.body,
      'html_url': instance.htmlUrl,
      'diff_url': instance.diffUrl,
      'patch_url': instance.patchUrl,
      'issue_url': instance.issueUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'title': instance.title,
      'number': instance.number,
      'user': instance.user,
    };
