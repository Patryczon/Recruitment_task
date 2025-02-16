import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/repositories_list_bloc.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/search_cubit.dart';
@GenerateMocks([GithubRepository, SearchCubit])
import 'repositories_list_bloc_test.mocks.dart';

void main() {
  final MockGithubRepository mockGithubRepository = MockGithubRepository();
  final MockSearchCubit mockSearchCubit = MockSearchCubit();
  StreamController<String> _searchStream = StreamController<String>();

  setUp(() {
    when(mockSearchCubit.stream).thenAnswer((_) => _searchStream.stream);
  });

  tearDown(() {
    _searchStream.close();
    _searchStream = StreamController<String>();
  });

  test('initial state is RepositoriesListState.initial', () {
    final repositoriesListBloc = RepositoriesListBloc(
      mockGithubRepository,
      mockSearchCubit,
    );
    expect(repositoriesListBloc.state, const RepositoriesListState.initial());
  });

  group('Search', () {
    const query = 'flutter';

    test('emits [loading, loaded] when search is successful', () async {
      final repositoriesListBloc = RepositoriesListBloc(
        mockGithubRepository,
        mockSearchCubit,
      );
      const repositoriesResponse = RepositoriesResponse(
        totalCount: 1,
        items: [
          Repository(
            id: 1,
            name: 'repo',
            fullName: '',
            htmlUrl: '',
            watchersCount: 1,
            forksCount: 1,
            openIssuesCount: 1,
            owner: User(
              login: '',
              avatarUrl: '',
            ),
          ),
        ],
      );

      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenAnswer((_) async => repositoriesResponse);

      final expectedStates = [
        const RepositoriesListState.loading(),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage,
          repositories: repositoriesResponse.items,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
      ];

      expectLater(repositoriesListBloc.stream, emitsInOrder(expectedStates));

      repositoriesListBloc.add(const Search(query));
    });

    test('emits [loading, error] when search fails', () async {
      final repositoriesListBloc = RepositoriesListBloc(
        mockGithubRepository,
        mockSearchCubit,
      );
      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenThrow(Exception());

      final expectedStates = [
        const RepositoriesListState.loading(),
        const RepositoriesListState.error(),
      ];

      expectLater(repositoriesListBloc.stream, emitsInOrder(expectedStates));

      repositoriesListBloc.add(const Search(query));
    });
  });

  group('FetchNextPage', () {
    const query = 'flutter';

    test('emits [loaded, loaded] when fetch next page is successful', () async {
      final repositoriesListBloc = RepositoriesListBloc(
        mockGithubRepository,
        mockSearchCubit,
      );
      const initialRepositoriesResponse = RepositoriesResponse(
        totalCount: 1,
        items: [
          Repository(
            id: 1,
            name: 'repo',
            fullName: '',
            htmlUrl: '',
            watchersCount: 1,
            forksCount: 1,
            openIssuesCount: 1,
            owner: User(
              login: '',
              avatarUrl: '',
            ),
          ),
        ],
      );

      const nextRepositoriesResponse = RepositoriesResponse(
        totalCount: 2,
        items: [
          Repository(
            id: 2,
            name: 'repo2',
            fullName: '',
            htmlUrl: '',
            watchersCount: 1,
            forksCount: 1,
            openIssuesCount: 1,
            owner: User(
              login: '',
              avatarUrl: '',
            ),
          ),
        ],
      );

      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenAnswer((_) async => initialRepositoriesResponse);

      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage + 1,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenAnswer((_) async => nextRepositoriesResponse);
      when(mockSearchCubit.state).thenReturn(query);

      final expectedStates = [
        const RepositoriesListState.loading(),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage,
          repositories: initialRepositoriesResponse.items,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage,
          repositories: initialRepositoriesResponse.items,
          hasReachedMax: false,
          isLoadingNextPage: true,
        ),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage + 1,
          repositories: [
            ...initialRepositoriesResponse.items,
            ...nextRepositoriesResponse.items,
          ],
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
      ];

      expectLater(repositoriesListBloc.stream, emitsInOrder(expectedStates));

      repositoriesListBloc.add(const Search(query));
      repositoriesListBloc.add(const FetchNextPage());
    });

    test('emits [loaded, error] when fetch next page fails', () async {
      final repositoriesListBloc = RepositoriesListBloc(
        mockGithubRepository,
        mockSearchCubit,
      );
      const initialRepositoriesResponse = RepositoriesResponse(
        totalCount: 1,
        items: [
          Repository(
            id: 1,
            name: 'repo',
            fullName: '',
            htmlUrl: '',
            watchersCount: 1,
            forksCount: 1,
            openIssuesCount: 1,
            owner: User(
              login: '',
              avatarUrl: '',
            ),
          ),
        ],
      );

      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenAnswer((_) async => initialRepositoriesResponse);

      when(mockGithubRepository.getRepositories(
        query: query,
        page: RepositoriesListBloc.firstPage + 1,
        resultsPerPage: RepositoriesListBloc.resultPerPage,
      )).thenThrow(Exception());

      final expectedStates = [
        const RepositoriesListState.loading(),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage,
          repositories: initialRepositoriesResponse.items,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
        RepositoriesListState.loaded(
          page: RepositoriesListBloc.firstPage,
          repositories: initialRepositoriesResponse.items,
          hasReachedMax: false,
          isLoadingNextPage: true,
        ),
        const RepositoriesListState.error(),
      ];

      expectLater(repositoriesListBloc.stream, emitsInOrder(expectedStates));

      repositoriesListBloc.add(const Search(query));
      await Future.delayed(Duration.zero);
      repositoriesListBloc.add(const FetchNextPage());
    });
  });
}
