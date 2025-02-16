import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/github_repository.dart';

part 'issues_state.freezed.dart';

@freezed
class IssuesState with _$IssuesState {
  const factory IssuesState.loading() = _Loading;

  const factory IssuesState.loaded({
    required List<Issue> issues,
    required int page,
    required bool hasReachedMax,
    required bool isLoadingNextPage,
  }) = _Loaded;

  const factory IssuesState.error() = _Error;
}
