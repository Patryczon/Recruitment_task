import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:sofomo_task/modules/issues_list/bloc/issues_state.dart';

@injectable
class IssuesCubit extends Cubit<IssuesState> {

  IssuesCubit(
    @factoryParam this.repositoryOwner,
    @factoryParam this.repositoryName,
    this._githubRepository,
  ) : super(
          const IssuesState.loading(),
        );
  static const resultPerPage = 10;
  static const firstPage = 1;
  final GithubRepository _githubRepository;
  final String repositoryOwner, repositoryName;

  Future<void> fetchData() async {
    emit(const IssuesState.loading());
    try {
      final response = await _githubRepository.getIssues(
        resultsPerPage: resultPerPage,
        page: firstPage,
        owner: repositoryOwner,
        repository: repositoryName,
      );
      emit(
        IssuesState.loaded(
          issues: response,
          page: firstPage,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
      );
    } catch (e) {
      emit(
        const IssuesState.error(),
      );
    }
  }

  Future<void> loadNextPage() async {
    final currentPage = state.maybeMap(
      loaded: (state) => state.page,
      orElse: () => firstPage,
    );
    emit(
      IssuesState.loaded(
          page: currentPage,
          issues: state.maybeMap(
            loaded: (state) => state.issues,
            orElse: () => [],
          ),
          hasReachedMax: false,
          isLoadingNextPage: true),
    );
    final nextPage = currentPage + 1;
    try {
      final response = await _githubRepository.getIssues(
        resultsPerPage: resultPerPage,
        page: nextPage,
        repository: repositoryName,
        owner: repositoryOwner,
      );
      emit(
        IssuesState.loaded(
          page: nextPage,
          issues: [
            ...state.maybeMap(
              loaded: (state) => state.issues,
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
        const IssuesState.error(),
      );
    }
  }
}
