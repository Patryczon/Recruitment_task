// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/src/models/user.dart';

part 'pull_request.freezed.dart';

part 'pull_request.g.dart';

@freezed
class PullRequest with _$PullRequest {
  const factory PullRequest({
    String? body,
    @JsonKey(name: 'html_url') required String htmlUrl,
    @JsonKey(name: 'diff_url') required String diffUrl,
    @JsonKey(name: 'patch_url') required String patchUrl,
    @JsonKey(name: 'issue_url') required String issueUrl,
    DateTime? createdAt,
    required String title,
    required int number,
    required User user,
  }) = _PullRequest;

  factory PullRequest.fromJson(Map<String, dynamic> json) => _$PullRequestFromJson(json);
}
