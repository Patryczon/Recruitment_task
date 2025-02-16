import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepositoryTile extends StatefulWidget {
  const RepositoryTile({
    super.key,
    required this.title,
    required this.description,
    required this.language,
    required this.stars,
    required this.onIssuesTap,
    required this.onPullRequestsTap,
    required this.owner,
    required this.ownerAvatarUrl,
  });

  final String title, owner, ownerAvatarUrl;
  final String? description, language;
  final int stars;
  final Function(BuildContext) onIssuesTap;
  final Function(BuildContext) onPullRequestsTap;

  @override
  State<RepositoryTile> createState() => _RepositoryTileState();
}

class _RepositoryTileState extends State<RepositoryTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        16,
      ),
      onTap: () => setState(() {
        isExpanded = !isExpanded;
      }),
      child: AnimatedContainer(
        height: isExpanded ? 216 : 120,
        duration: const Duration(
          milliseconds: 300,
        ),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => widget.onIssuesTap(context),
                            child: Text(
                              AppLocalizations.of(context)!.issues_button,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                            onPressed: () => widget.onPullRequestsTap(context),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .pull_requests_button,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              if (isExpanded)
                _RepoDetails(
                  language: widget.language,
                  ownerAvatarUrl: widget.ownerAvatarUrl,
                  owner: widget.owner,
                  stars: widget.stars,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RepoDetails extends StatelessWidget {
  const _RepoDetails({
    this.language,
    required this.owner,
    required this.ownerAvatarUrl,
    required this.stars,
  });

  final String? language;
  final String owner, ownerAvatarUrl;
  final int stars;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.created_by,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(ownerAvatarUrl),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                owner,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              if (language != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _RepoLanguage(
                    language: language!,
                  ),
                ),
              _StarsWidget(
                stars: stars,
              ),
            ],
          ),
        ],
      );
}

class _StarsWidget extends StatelessWidget {
  const _StarsWidget({
    required this.stars,
  });

  final int stars;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(
            CupertinoIcons.star_fill,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            stars.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
}

class _RepoLanguage extends StatelessWidget {
  const _RepoLanguage({
    required this.language,
  });

  final String language;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            language,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
}
