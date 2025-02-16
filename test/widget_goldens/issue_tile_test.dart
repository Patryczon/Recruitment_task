import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/modules/issues_list/ui/issue_tile.dart';

import 'flutter_test_config.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Issue tile light theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        IssueTile(
          title: 'Title',
          onViewTap: (_) {},
          description: 'Description',
        ),
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'issue_tile_light');
    });
    testGoldens('Issue tile dark theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        IssueTile(
          title: 'Title',
          onViewTap: (_) {},
          description: 'Description',
        ),
        themeMode: ThemeMode.dark,
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'issue_tile_dark');
    });
  });
}
