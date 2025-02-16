import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repository/github_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/search_cubit.dart';

part 'repositories_list_bloc.freezed.dart';

part 'repositories_list_event.dart';

part 'repositories_list_state.dart';

@injectable
class RepositoriesListBloc
    extends Bloc<RepositoriesListEvent, RepositoriesListState> {
  RepositoriesListBloc(this._githubRepository, @factoryParam this.searchCubit)
      : super(
          const RepositoriesListState.initial(),
        ) {
    on<Search>(_search);
    on<FetchNextPage>(_fetchNextPage);
    _searchSubscription = searchCubit.stream.listen((query) {
      add(
        Search(query),
      );
    });
  }

  static const resultPerPage = 10;
  static const firstPage = 1;
  final GithubRepository _githubRepository;
  final SearchCubit searchCubit;
  StreamSubscription? _searchSubscription;

  @override
  Future close() {
    _searchSubscription?.cancel();
    return super.close();
  }

  Future<void> _fetchNextPage(
      FetchNextPage event, Emitter<RepositoriesListState> emit) async {
    final currentPage = state.maybeMap(
      loaded: (state) => state.page,
      orElse: () => firstPage,
    );
    emit(
      RepositoriesListState.loaded(
          page: currentPage,
          repositories: state.maybeMap(
            loaded: (state) => state.repositories,
            orElse: () => [],
          ),
          hasReachedMax: false,
          isLoadingNextPage: true),
    );
    final nextPage = currentPage + 1;
    try {
      final response = await _githubRepository.getRepositories(
        query: searchCubit.state,
        page: nextPage,
        resultsPerPage: resultPerPage,
      );
      emit(
        RepositoriesListState.loaded(
          page: nextPage,
          repositories: [
            ...state.maybeMap(
              loaded: (state) => state.repositories,
              orElse: () => [],
            ),
            ...response.items,
          ],
          hasReachedMax: _didFetchAllRepos(response),
          isLoadingNextPage: false,
        ),
      );
    } on Exception {
      emit(
        const RepositoriesListState.error(),
      );
    }
  }

  Future<void> _search(
      Search event, Emitter<RepositoriesListState> emit) async {
    emit(const RepositoriesListState.loading());
    try {
      final response = await _githubRepository.getRepositories(
        query: event.query,
        page: firstPage,
        resultsPerPage: resultPerPage,
      );
      emit(
        RepositoriesListState.loaded(
          page: firstPage,
          repositories: response.items,
          hasReachedMax: _didFetchAllRepos(response),
          isLoadingNextPage: false,
        ),
      );
    } on Exception {
      emit(
        const RepositoriesListState.error(),
      );
    }
  }

  bool _didFetchAllRepos(RepositoriesResponse response) {
    final fetchedItems =
        (state.mapOrNull(loaded: (state) => state.page) ?? firstPage) *
            resultPerPage;
    final hasReachedMax = response.totalCount > fetchedItems;
    return hasReachedMax;
  }
}
