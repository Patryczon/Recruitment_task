class UrlConfig {
  static const repositoriesUrl = '/search/repositories';

  static String issuesUrl({
    required String owner,
    required String repo,
  }) =>
      '/repos/$owner/$repo/issues';

  static String pullRequestsUrl({
    required String owner,
    required String repo,
  }) =>
      '/repos/$owner/$repo/pulls';
}
