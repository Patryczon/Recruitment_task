// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/src/models/repository.dart';

part 'repositories_response.freezed.dart';

part 'repositories_response.g.dart';

@freezed
class RepositoriesResponse with _$RepositoriesResponse {
  const factory RepositoriesResponse({
    @JsonKey(name: 'total_count')
    required int totalCount,
    required List<Repository> items,
  }) = _RepositoriesResponse;

  factory RepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesResponseFromJson(json);
}
