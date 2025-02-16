import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/common_ui/loading_error.dart';

import 'flutter_test_config.dart';

void main() {
  group('Basic Goldens', () {
    testGoldens('Loading error light theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        LoadingError(
          onRetry: (_) {},
        ),
        surfaceSize: const Size(400, 100),
      );
      await screenMatchesGolden(tester, 'loading_error_light');
    });
    testGoldens('Loading error dark theme', (tester) async {
      pumpWidgetWithMaterial(
        tester,
        LoadingError(
          onRetry: (_) {},
        ),
        themeMode: ThemeMode.dark,
        surfaceSize: const Size(400, 100),
      );
      await screenMatchesGolden(tester, 'loading_error_dark');
    });
  });
}
