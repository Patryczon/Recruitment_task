import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sofomo_task/common_ui/loading_error.dart';
import 'package:sofomo_task/dependencies/dependencies_config.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/repositories_list_bloc.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/search_cubit.dart';
import 'package:sofomo_task/modules/repositories_list/ui/repo_search_bar.dart';
import 'package:sofomo_task/modules/repositories_list/ui/repository_tile.dart';
import 'package:sofomo_task/navigation/app_router.gr.dart';

@RoutePage()
class RepositoryListPage extends StatefulWidget {
  const RepositoryListPage({super.key});

  @override
  State<RepositoryListPage> createState() => _RepositoryListPageState();
}

class _RepositoryListPageState extends State<RepositoryListPage> {
  static const scrollThreshold = 50.0;
  final ScrollController _scrollController = ScrollController();
  final SearchCubit _searchCubit = getIt<SearchCubit>();
  late final RepositoriesListBloc _repositoriesListBloc =
      getIt<RepositoriesListBloc>(
    param1: _searchCubit,
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreItems);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMoreItems);
    _scrollController.dispose();
    _searchCubit.close();
    _repositoriesListBloc.close();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - scrollThreshold) {
      _repositoriesListBloc.add(
        const RepositoriesListEvent.fetchNextPage(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _searchCubit,
        ),
        BlocProvider.value(
          value: _repositoriesListBloc,
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              Builder(builder: (context) {
                return RepoSearchBar(
                  onSearch: (query) => context.read<SearchCubit>().search(
                        query,
                      ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<RepositoriesListBloc, RepositoriesListState>(
                builder: (context, state) => state.map(
                  initial: (_) => _InitialListWidget(),
                  loading: (_) => _LoadingStateWidget(),
                  empty: (_) => _EmptyListWidget(),
                  error: (_) => LoadingError(
                    onRetry: (context) {},
                  ),
                  loaded: (loaded) => Expanded(
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemCount: loaded.repositories.length,
                      itemBuilder: (context, index) {
                        final item = loaded.repositories[index];
                        return RepositoryTile(
                          stars: item.watchersCount,
                          title: loaded.repositories[index].name,
                          description: loaded.repositories[index].description,
                          language: loaded.repositories[index].language,
                          onIssuesTap: (context) => context.router.push(
                            IssuesRoute(
                              repositoryOwner: item.owner.login,
                              repositoryName: item.name,
                            ),
                          ),
                          onPullRequestsTap: (context) => context.router.push(
                            PullRequestsRoute(
                              repositoryOwner: item.owner.login,
                              repositoryName: item.name,
                            ),
                          ),
                          owner: item.owner.login,
                          ownerAvatarUrl: item.owner.avatarUrl,
                        );
                      },
                    ),
                  ),
                ),
              ),
              BlocBuilder<RepositoriesListBloc, RepositoriesListState>(
                builder: (context, state) => state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loaded: (loaded) => loaded.isLoadingNextPage
                      ? const Padding(
                          padding: EdgeInsets.only(
                            top: 16.0,
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InitialListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        ClipOval(
          child: Container(
            padding: const EdgeInsets.all(
              16,
            ),
            color: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.search,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppLocalizations.of(context)!.repository_list_initial,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _EmptyListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.repository_list_empty,
      ),
    );
  }
}

class _LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
