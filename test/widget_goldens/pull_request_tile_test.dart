import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/modules/pull_requests_list/ui/pull_request_tile.dart';

import 'flutter_test_config.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Pull reqest tile light theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        PullRequestTile(
          title: 'Title',
          onViewTap: (_) {},
          description: 'Description',
        ),
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'pull_request_tile_light');
    });
    testGoldens('Pull reqest tile dark theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        PullRequestTile(
          title: 'Title',
          onViewTap: (_) {},
          description: 'Description',
        ),
        themeMode: ThemeMode.dark,
        surfaceSize: const Size(400, 150),
      );
      await screenMatchesGolden(tester, 'pull_request_tile_dark');
    });
  });
}
