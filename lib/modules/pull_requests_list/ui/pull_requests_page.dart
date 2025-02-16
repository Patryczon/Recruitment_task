import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofomo_task/common_ui/loading_error.dart';
import 'package:sofomo_task/dependencies/dependencies_config.dart';
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_cubit.dart';
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_state.dart';
import 'package:sofomo_task/modules/pull_requests_list/ui/pull_request_tile.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class PullRequestsPage extends StatefulWidget {

  const PullRequestsPage({
    super.key,
    @PathParam('repositoryOwner') required this.repositoryOwner,
    @PathParam('repositoryName') required this.repositoryName,
  });
  final String repositoryOwner, repositoryName;

  @override
  State<PullRequestsPage> createState() => _PullRequestsPageState();
}

class _PullRequestsPageState extends State<PullRequestsPage> {
  static const scrollThreshold = 50.0;
  final ScrollController _scrollController = ScrollController();
  late final _pullRequestsCubit = getIt<PullRequestsCubit>(
    param1: widget.repositoryOwner,
    param2: widget.repositoryName,
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
    _pullRequestsCubit.close();
    super.dispose();
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - scrollThreshold) {
      _pullRequestsCubit.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: _pullRequestsCubit..fetchData(),
        child: Column(
          children: [
            BlocBuilder<PullRequestsCubit, PullRequestsState>(
              builder: (context, state) => state.map(
                loading: (_) => _LoadingList(),
                loaded: (loaded) => Expanded(
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(
                      16,
                    ),
                    itemBuilder: (context, index) {
                      final item = loaded.pullRequests[index];
                      return PullRequestTile(
                        title: item.title,
                        description: item.body,
                        onViewTap: (context) => launchUrlString(item.htmlUrl),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 16,
                    ),
                    itemCount: loaded.pullRequests.length,
                  ),
                ),
                error: (_) => LoadingError(
                  onRetry: (context) =>
                      context.read<PullRequestsCubit>().fetchData(),
                ),
              ),
            ),
            BlocBuilder<PullRequestsCubit, PullRequestsState>(
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
            )
          ],
        ),
      );
}

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
