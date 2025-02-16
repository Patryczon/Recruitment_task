# GitHub Repository

A Flutter package for fetching data from the GitHub public API. This package provides an abstraction
for handling GitHub API requests efficiently using `dio` for networking, `freezed`
and `json_serializable` for data modeling, and `build_runner` for code generation.

## Features

- Fetch GitHub repositories.
- Retrieve user details.
- Handle API responses with `dio`.
- Use `freezed` and `json_serializable` for data models.

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  github_repository:
    path: ./packages/github_repository
```

## Code Generation

Since this package relies on `freezed` and `json_serializable`, you need to run code generation
every time you modify the models from ./models folder.

Run the following command to generate code:

```sh
dart run build_runner build --delete-conflicting-outputs
```

Or use the watch mode for automatic generation during development:

```sh
dart run build_runner watch --delete-conflicting-outputs
```

## Usage

Import the package and use it in your project:

```dart
import 'package:github_repository/github_repository.dart';

void main() async {
  final repository = GitHubRepository();
  final result = await repository.fetchRepositories("flutter");
  print(result);
}
```

