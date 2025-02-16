import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/modules/repositories_list/ui/repo_search_bar.dart';

import 'flutter_test_config.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Repo search bar light theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        RepoSearchBar(
          onSearch: (_) {},
        ),
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'repo_search_bar_light');
    });
    testGoldens('Issue tile dark theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        RepoSearchBar(
          onSearch: (_) {},
        ),
        themeMode: ThemeMode.dark,
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'repo_search_bar_dark');
    });
  });
}
