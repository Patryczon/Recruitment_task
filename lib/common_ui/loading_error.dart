import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({super.key, required this.onRetry});

  final Function(BuildContext) onRetry;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.loading_error_message),
          ElevatedButton(
            onPressed: () => onRetry(context),
            child: Text(
              AppLocalizations.of(context)!.retry,
            ),
          ),
        ],
      );
}
