import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sofomo_task/dependencies/dependencies_config.config.dart';
import 'package:sofomo_task/dependencies/dependencies_config.dart';
import 'package:sofomo_task/theme/dark_theme_data.dart';
import 'package:sofomo_task/theme/light_theme_data.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  $initGetIt(getIt);
  await loadAppFonts();
  await testMain();
}

Future<void> pumpWidgetWithMaterial(
  WidgetTester tester,
  Widget widget, {
  ThemeMode? themeMode = ThemeMode.light,
  Size? surfaceSize,
}) async {
  await tester.pumpWidgetBuilder(
    widget,
    wrapper: materialAppWrapper(
      localizations: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
    ),
    surfaceSize: surfaceSize ?? const Size(400, 400),
  );
}
