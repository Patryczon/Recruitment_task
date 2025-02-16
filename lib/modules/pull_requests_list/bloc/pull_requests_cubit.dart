import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_state.dart';

@injectable
class PullRequestsCubit extends Cubit<PullRequestsState> {

  PullRequestsCubit(
    @factoryParam this.repositoryOwner,
    @factoryParam this.repositoryName,
    this._githubRepository,
  ) : super(
          const PullRequestsState.loading(),
        );
  static const resultPerPage = 10;

  static const firstPage = 1;
  final GithubRepository _githubRepository;
  final String repositoryOwner, repositoryName;

  Future<void> fetchData() async {
    emit(const PullRequestsState.loading());
    try {
      final response = await _githubRepository.getPullRequests(
        resultsPerPage: resultPerPage,
        page: firstPage,
        owner: repositoryOwner,
        repository: repositoryName,
      );
      emit(
        PullRequestsState.loaded(
          pullRequests: response,
          page: firstPage,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
      );
    } catch (e) {
      emit(
        const PullRequestsState.error(),
      );
    }
  }

  Future<void> loadNextPage() async {
    final currentPage = state.maybeMap(
      loaded: (state) => state.page,
      orElse: () => firstPage,
    );
    emit(
      PullRequestsState.loaded(
          page: currentPage,
          pullRequests: state.maybeMap(
            loaded: (state) => state.pullRequests,
            orElse: () => [],
          ),
          hasReachedMax: false,
          isLoadingNextPage: true),
    );
    final nextPage = currentPage + 1;
    try {
      final response = await _githubRepository.getPullRequests(
        resultsPerPage: resultPerPage,
        page: nextPage,
        repository: repositoryName,
        owner: repositoryOwner,
      );
      emit(
        PullRequestsState.loaded(
          page: nextPage,
          pullRequests: [
            ...state.maybeMap(
              loaded: (state) => state.pullRequests,
              orElse: () => [],
            ),
            ...response,
          ],
          hasReachedMax: response.isEmpty,
          isLoadingNextPage: false,
        ),
      );
    } catch (e) {
      emit(
        const PullRequestsState.error(),
      );
    }
  }
}
