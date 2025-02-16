import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IssueTile extends StatelessWidget {
  const IssueTile({
    super.key,
    required this.title,
    required this.description,
    required this.onViewTap,
  });

  final String title;
  final String? description;
  final Function(BuildContext) onViewTap;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(
          8,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (description != null)
                    SizedBox(
                      width: 250,
                      child: Text(
                        description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () => onViewTap(context),
                    child: Text(
                      AppLocalizations.of(context)!.view_button,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      );
}
