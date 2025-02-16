import 'package:dio/dio.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_repository/src/repository/url_config.dart';

abstract class GithubRepository {
  Future<RepositoriesResponse> getRepositories({
    required String query,
    required int page,
    required int resultsPerPage,
  });

  Future<List<Issue>> getIssues({
    required String owner,
    required String repository,
    required int page,
    required int resultsPerPage,
  });

  Future<List<PullRequest>> getPullRequests({
    required String owner,
    required String repository,
    required int page,
    required int resultsPerPage,
  });
}

class ApiGithubRepository implements GithubRepository {

  ApiGithubRepository(this._dio);
  final Dio _dio;

  @override
  Future<List<Issue>> getIssues({
    required String owner,
    required String repository,
    required int page,
    required int resultsPerPage,
  }) async {
    final response = await _dio.get(
      UrlConfig.issuesUrl(
        owner: owner,
        repo: repository,
      ),
      queryParameters: {
        'pulls':false,
        'page': page,
        'per_page': resultsPerPage,
      },
    );
    return (response.data as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .map((e) => Issue.fromJson(e))
        .toList();
  }

  @override
  Future<List<PullRequest>> getPullRequests({
    required String owner,
    required String repository,
    required int page,
    required int resultsPerPage,
  }) async {
    final response = await _dio.get(
      UrlConfig.pullRequestsUrl(
        owner: owner,
        repo: repository,
      ),
      queryParameters: {
        'page': page,
        'per_page': resultsPerPage,
      },
    );
    return (response.data as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .map((e) => PullRequest.fromJson(e))
        .toList();
  }

  @override
  Future<RepositoriesResponse> getRepositories({
    required String query,
    required int page,
    required int resultsPerPage,
  }) async {
    final response =
        await _dio.get(UrlConfig.repositoriesUrl, queryParameters: {
      'q': query,
      'page': page,
      'per_page': resultsPerPage,
    });
    return RepositoriesResponse.fromJson(response.data);
  }
}
