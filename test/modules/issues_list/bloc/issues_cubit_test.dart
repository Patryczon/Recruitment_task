import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sofomo_task/modules/issues_list/bloc/issues_cubit.dart';
import 'package:sofomo_task/modules/issues_list/bloc/issues_state.dart';
@GenerateMocks([GithubRepository])
import 'issues_cubit_test.mocks.dart';

void main() {
  group('IssuesCubit', () {
    late IssuesCubit issuesCubit;
    late MockGithubRepository mockGithubRepository;

    setUp(() {
      mockGithubRepository = MockGithubRepository();
      issuesCubit = IssuesCubit(
        'owner',
        'repo',
        mockGithubRepository,
      );
    });

    tearDown(() {
      issuesCubit.close();
    });

    test('initial state is IssuesState.loading()', () {
      expect(issuesCubit.state, const IssuesState.loading());
    });

    test(
        'emits [IssuesState.loading(), IssuesState.loaded()] when fetchData is successful',
        () async {
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage,
        owner: 'owner',
        repository: 'repo',
      )).thenAnswer((_) async => []);

      final expectedStates = [
        const IssuesState.loading(),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
      ];

      expectLater(issuesCubit.stream, emitsInOrder(expectedStates));

      await issuesCubit.fetchData();
    });

    test(
        'emits [IssuesState.loading(), IssuesState.error()] when fetchData fails',
        () async {
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage,
        owner: 'owner',
        repository: 'repo',
      )).thenThrow(Exception('error'));

      final expectedStates = [
        const IssuesState.loading(),
        const IssuesState.error(),
      ];

      expectLater(issuesCubit.stream, emitsInOrder(expectedStates));

      await issuesCubit.fetchData();
    });

    test(
        'emits [IssuesState.loaded(), IssuesState.loaded()] when loadNextPage is successful',
        () async {
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage,
        owner: 'owner',
        repository: 'repo',
      )).thenAnswer((_) async => []);
      final expectedStates = [
        const IssuesState.loading(),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage,
          hasReachedMax: false,
          isLoadingNextPage: true,
        ),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage + 1,
          hasReachedMax: true,
          isLoadingNextPage: false,
        ),
      ];

      expectLater(issuesCubit.stream, emitsInOrder(expectedStates));

      await issuesCubit.fetchData();
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage + 1,
        owner: 'owner',
        repository: 'repo',
      )).thenAnswer((_) async => []);
      await issuesCubit.loadNextPage();
    });

    test(
        'emits [IssuesState.loaded(), IssuesState.error()] when loadNextPage fails',
        () async {
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage,
        owner: 'owner',
        repository: 'repo',
      )).thenAnswer((_) async => []);
      when(mockGithubRepository.getIssues(
        resultsPerPage: IssuesCubit.resultPerPage,
        page: IssuesCubit.firstPage + 1,
        owner: 'owner',
        repository: 'repo',
      )).thenThrow(Exception('error'));

      final expectedStates = [
        const IssuesState.loading(),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage,
          hasReachedMax: false,
          isLoadingNextPage: false,
        ),
        const IssuesState.loaded(
          issues: [],
          page: IssuesCubit.firstPage,
          hasReachedMax: false,
          isLoadingNextPage: true,
        ),
        const IssuesState.error(),
      ];

      expectLater(issuesCubit.stream, emitsInOrder(expectedStates));

      await issuesCubit.fetchData();
      await issuesCubit.loadNextPage();
    });
  });
}
