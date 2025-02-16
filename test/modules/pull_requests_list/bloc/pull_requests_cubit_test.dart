import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_cubit.dart';
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_state.dart';

import 'pull_requests_cubit_test.mocks.dart';

@GenerateMocks([GithubRepository])
void main() {
    group('PullRequestsCubit', () {
        late PullRequestsCubit pullRequestsCubit;
        late MockGithubRepository mockGithubRepository;

        setUp(() {
            mockGithubRepository = MockGithubRepository();
            pullRequestsCubit = PullRequestsCubit(
                'owner',
                'repo',
                mockGithubRepository,
            );
        });

        tearDown(() {
            pullRequestsCubit.close();
        });

        test('initial state is PullRequestsState.loading()', () {
            expect(pullRequestsCubit.state, const PullRequestsState.loading());
        });

        test('emits [loading, loaded] when fetchData is successful', () async {
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage,
                owner: 'owner',
                repository: 'repo',
            )).thenAnswer((_) async => []);

            final expectedStates = [
                const PullRequestsState.loading(),
                const PullRequestsState.loaded(
                    pullRequests: [],
                    page: PullRequestsCubit.firstPage,
                    hasReachedMax: false,
                    isLoadingNextPage: false,
                ),
            ];

            expectLater(pullRequestsCubit.stream, emitsInOrder(expectedStates));

            await pullRequestsCubit.fetchData();
        });

        test('emits [loading, error] when fetchData fails', () async {
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage,
                owner: 'owner',
                repository: 'repo',
            )).thenThrow(Exception('error'));

            final expectedStates = [
                const PullRequestsState.loading(),
                const PullRequestsState.error(),
            ];

            expectLater(pullRequestsCubit.stream, emitsInOrder(expectedStates));

            await pullRequestsCubit.fetchData();
        });

        test('emits [loaded, loaded] when loadNextPage is successful', () async {
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage,
                owner: 'owner',
                repository: 'repo',
            )).thenAnswer((_) async => []);
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage + 1,
                owner: 'owner',
                repository: 'repo',
            )).thenAnswer((_) async => []);

            final expectedStates = [
                const PullRequestsState.loading(),
                const PullRequestsState.loaded(
                    pullRequests: [],
                    page: PullRequestsCubit.firstPage,
                    hasReachedMax: false,
                    isLoadingNextPage: false,
                ),
                const PullRequestsState.loaded(
                    pullRequests: [],
                    page: PullRequestsCubit.firstPage,
                    hasReachedMax: false,
                    isLoadingNextPage: true,
                ),
            ];

            expectLater(pullRequestsCubit.stream, emitsInOrder(expectedStates));

            await pullRequestsCubit.fetchData();
            await pullRequestsCubit.loadNextPage();
        });

        test('emits [loaded, error] when loadNextPage fails', () async {
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage,
                owner: 'owner',
                repository: 'repo',
            )).thenAnswer((_) async => []);
            when(mockGithubRepository.getPullRequests(
                resultsPerPage: PullRequestsCubit.resultPerPage,
                page: PullRequestsCubit.firstPage + 1,
                owner: 'owner',
                repository: 'repo',
            )).thenThrow(Exception('error'));

            final expectedStates = [
                const PullRequestsState.loading(),
                const PullRequestsState.loaded(
                    pullRequests: [],
                    page: PullRequestsCubit.firstPage,
                    hasReachedMax: false,
                    isLoadingNextPage: false,
                ),
                const PullRequestsState.loaded(
                    pullRequests: [],
                    page: PullRequestsCubit.firstPage,
                    hasReachedMax: false,
                    isLoadingNextPage: true,
                ),
                const PullRequestsState.error(),
            ];

            expectLater(pullRequestsCubit.stream, emitsInOrder(expectedStates));

            await pullRequestsCubit.fetchData();
            await pullRequestsCubit.loadNextPage();
        });
    });
}
