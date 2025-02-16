import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/modules/repositories_list/ui/repository_tile.dart';

import 'flutter_test_config.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Repository tile light theme', (tester) async {
     await pumpWidgetWithMaterial(
        tester,
        RepositoryTile(
          title: 'Title',
          description: 'Description',
          language: 'Dart',
          stars: 100,
          onIssuesTap: (_) {},
          onPullRequestsTap: (_) {},
          owner: 'Owner',
          ownerAvatarUrl: '',
        ),
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'repository_tile_light');
    });
    testGoldens('Repository tile dark theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        RepositoryTile(
          title: 'Title',
          description: 'Description',
          language: 'Dart',
          stars: 100,
          onIssuesTap: (_) {},
          onPullRequestsTap: (_) {},
          owner: 'Owner',
          ownerAvatarUrl: '',
        ),
        themeMode: ThemeMode.dark,
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'repository_tile_dark');
    });
  });
}
