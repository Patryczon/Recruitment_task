import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/github_repository.dart';

part 'pull_requests_state.freezed.dart';

@freezed
class PullRequestsState with _$PullRequestsState {
  const factory PullRequestsState.loading() = _Loading;

  const factory PullRequestsState.loaded({
    required List<PullRequest> pullRequests,
    required int page,
    required bool hasReachedMax,
    required bool isLoadingNextPage,
  }) = _Loaded;

  const factory PullRequestsState.error() = _Error;
}
