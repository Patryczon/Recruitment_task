import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:sofomo_task/navigation/app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              page: RepositoryListRoute.page,
              initial: true,
              path: 'repositories',
            ),
            AutoRoute(
              page: PullRequestsRoute.page,
              path: 'repositories/:repositoryOwner/:repositoryName/pull_requests',
            ),
            AutoRoute(
              page: IssuesRoute.page,
              path: 'repositories/:repositoryOwner/:repositoryName/issues',
            ),
          ],
        ),
      ];
}
