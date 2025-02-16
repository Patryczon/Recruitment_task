// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/src/models/user.dart';

part 'issue.freezed.dart';

part 'issue.g.dart';

@freezed
class Issue with _$Issue {
  const factory Issue({
    String? body,
    @JsonKey(name: 'html_url') required String htmlUrl,
    DateTime? createdAt,
    required String title,
    required int number,
    required User user,
  }) = _Issue;

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);
}
