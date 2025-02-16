part of 'repositories_list_bloc.dart';


@freezed
class RepositoriesListState with _$RepositoriesListState {
  const factory RepositoriesListState.initial() = Initial;
  const factory RepositoriesListState.loading() = Loading;

  const factory RepositoriesListState.empty() = Empty;

  const factory RepositoriesListState.loaded({
    required List<Repository> repositories,
    required int page,
    required bool hasReachedMax,
    required bool isLoadingNextPage,
  }) = Loaded;

  const factory RepositoriesListState.error() = Error;
}
