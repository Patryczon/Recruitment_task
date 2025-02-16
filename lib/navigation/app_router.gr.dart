// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:sofomo_task/modules/home/ui/home_page.dart' as _i1;
import 'package:sofomo_task/modules/issues_list/ui/issues_page.dart' as _i2;
import 'package:sofomo_task/modules/pull_requests_list/ui/pull_requests_page.dart'
    as _i3;
import 'package:sofomo_task/modules/repositories_list/ui/repository_list_page.dart'
    as _i4;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.IssuesPage]
class IssuesRoute extends _i5.PageRouteInfo<IssuesRouteArgs> {
  IssuesRoute({
    _i6.Key? key,
    required String repositoryOwner,
    required String repositoryName,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         IssuesRoute.name,
         args: IssuesRouteArgs(
           key: key,
           repositoryOwner: repositoryOwner,
           repositoryName: repositoryName,
         ),
         rawPathParams: {
           'repositoryOwner': repositoryOwner,
           'repositoryName': repositoryName,
         },
         initialChildren: children,
       );

  static const String name = 'IssuesRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<IssuesRouteArgs>(
        orElse:
            () => IssuesRouteArgs(
              repositoryOwner: pathParams.getString('repositoryOwner'),
              repositoryName: pathParams.getString('repositoryName'),
            ),
      );
      return _i2.IssuesPage(
        key: args.key,
        repositoryOwner: args.repositoryOwner,
        repositoryName: args.repositoryName,
      );
    },
  );
}

class IssuesRouteArgs {
  const IssuesRouteArgs({
    this.key,
    required this.repositoryOwner,
    required this.repositoryName,
  });

  final _i6.Key? key;

  final String repositoryOwner;

  final String repositoryName;

  @override
  String toString() {
    return 'IssuesRouteArgs{key: $key, repositoryOwner: $repositoryOwner, repositoryName: $repositoryName}';
  }
}

/// generated route for
/// [_i3.PullRequestsPage]
class PullRequestsRoute extends _i5.PageRouteInfo<PullRequestsRouteArgs> {
  PullRequestsRoute({
    _i6.Key? key,
    required String repositoryOwner,
    required String repositoryName,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         PullRequestsRoute.name,
         args: PullRequestsRouteArgs(
           key: key,
           repositoryOwner: repositoryOwner,
           repositoryName: repositoryName,
         ),
         rawPathParams: {
           'repositoryOwner': repositoryOwner,
           'repositoryName': repositoryName,
         },
         initialChildren: children,
       );

  static const String name = 'PullRequestsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PullRequestsRouteArgs>(
        orElse:
            () => PullRequestsRouteArgs(
              repositoryOwner: pathParams.getString('repositoryOwner'),
              repositoryName: pathParams.getString('repositoryName'),
            ),
      );
      return _i3.PullRequestsPage(
        key: args.key,
        repositoryOwner: args.repositoryOwner,
        repositoryName: args.repositoryName,
      );
    },
  );
}

class PullRequestsRouteArgs {
  const PullRequestsRouteArgs({
    this.key,
    required this.repositoryOwner,
    required this.repositoryName,
  });

  final _i6.Key? key;

  final String repositoryOwner;

  final String repositoryName;

  @override
  String toString() {
    return 'PullRequestsRouteArgs{key: $key, repositoryOwner: $repositoryOwner, repositoryName: $repositoryName}';
  }
}

/// generated route for
/// [_i4.RepositoryListPage]
class RepositoryListRoute extends _i5.PageRouteInfo<void> {
  const RepositoryListRoute({List<_i5.PageRouteInfo>? children})
    : super(RepositoryListRoute.name, initialChildren: children);

  static const String name = 'RepositoryListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.RepositoryListPage();
    },
  );
}
