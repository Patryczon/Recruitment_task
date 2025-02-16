part of 'repositories_list_bloc.dart';

@freezed
class RepositoriesListEvent with _$RepositoriesListEvent {
  const factory RepositoriesListEvent.fetchRepositories() = FetchRepositories;

  const factory RepositoriesListEvent.fetchNextPage() = FetchNextPage;

  const factory RepositoriesListEvent.refresh() = Refresh;

  const factory RepositoriesListEvent.search(String query) = Search;
}
