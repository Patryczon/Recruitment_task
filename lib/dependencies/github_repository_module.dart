import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_repository/github_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GithubRepositoryModule {
  @singleton
  @Named('baseUrl')
  String get baseUrl => 'https://api.github.com';

  @singleton
  LogInterceptor get logInterceptor => LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
      );

  @singleton
  List<Interceptor> interceptors(
    LogInterceptor logInterceptor,
  ) =>
      [
        if (kDebugMode) logInterceptor,
      ];

  @singleton
  Dio dio(@Named('baseUrl') String url, List<Interceptor> interceptors) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      )..interceptors.addAll(
          interceptors,
        );

  @Singleton(as: GithubRepository)
  ApiGithubRepository apiGithubRepository(Dio dio) => ApiGithubRepository(dio);
}
