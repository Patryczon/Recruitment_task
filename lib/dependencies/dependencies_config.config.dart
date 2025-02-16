// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:github_repository/github_repository.dart' as _i204;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sofomo_task/dependencies/github_repository_module.dart'
    as _i244;
import 'package:sofomo_task/modules/issues_list/bloc/issues_cubit.dart'
    as _i632;
import 'package:sofomo_task/modules/pull_requests_list/bloc/pull_requests_cubit.dart'
    as _i393;
import 'package:sofomo_task/modules/repositories_list/bloc/repositories_list_bloc.dart'
    as _i680;
import 'package:sofomo_task/modules/repositories_list/bloc/search_cubit.dart'
    as _i310;
import 'package:sofomo_task/modules/repositories_list/bloc/search_enable_cubit.dart'
    as _i186;
import 'package:sofomo_task/navigation/app_router.dart' as _i1055;
import 'package:sofomo_task/theme/theme_cubit.dart' as _i986;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final githubRepositoryModule = _$GithubRepositoryModule();
  gh.factory<_i186.SearchEnableCubit>(() => _i186.SearchEnableCubit());
  gh.factory<_i310.SearchCubit>(() => _i310.SearchCubit());
  gh.singleton<_i1055.AppRouter>(() => _i1055.AppRouter());
  gh.singleton<_i361.LogInterceptor>(
      () => githubRepositoryModule.logInterceptor);
  gh.singleton<_i986.ThemeCubit>(() => _i986.ThemeCubit());
  gh.singleton<String>(
    () => githubRepositoryModule.baseUrl,
    instanceName: 'baseUrl',
  );
  gh.singleton<List<_i361.Interceptor>>(
      () => githubRepositoryModule.interceptors(gh<_i361.LogInterceptor>()));
  gh.singleton<_i361.Dio>(() => githubRepositoryModule.dio(
        gh<String>(instanceName: 'baseUrl'),
        gh<List<_i361.Interceptor>>(),
      ));
  gh.singleton<_i204.GithubRepository>(
      () => githubRepositoryModule.apiGithubRepository(gh<_i361.Dio>()));
  gh.factoryParam<_i680.RepositoriesListBloc, _i310.SearchCubit, dynamic>((
    searchCubit,
    _,
  ) =>
      _i680.RepositoriesListBloc(
        gh<_i204.GithubRepository>(),
        searchCubit,
      ));
  gh.factoryParam<_i393.PullRequestsCubit, String, String>((
    repositoryOwner,
    repositoryName,
  ) =>
      _i393.PullRequestsCubit(
        repositoryOwner,
        repositoryName,
        gh<_i204.GithubRepository>(),
      ));
  gh.factoryParam<_i632.IssuesCubit, String, String>((
    repositoryOwner,
    repositoryName,
  ) =>
      _i632.IssuesCubit(
        repositoryOwner,
        repositoryName,
        gh<_i204.GithubRepository>(),
      ));
  return getIt;
}

class _$GithubRepositoryModule extends _i244.GithubRepositoryModule {}
