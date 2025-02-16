import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sofomo_task/dependencies/dependencies_config.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/search_enable_cubit.dart';
class RepoSearchBar extends StatefulWidget {

  const RepoSearchBar({
    super.key,
    required this.onSearch,
  });
  final Function(String) onSearch;

  @override
  State<RepoSearchBar> createState() => _RepoSearchBarState();
}

class _RepoSearchBarState extends State<RepoSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<SearchEnableCubit>(),
        child: Row(
          children: [
            Builder(builder: (context) {
              return Flexible(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) => widget.onSearch(value),
                  onChanged: (value) =>
                      context.read<SearchEnableCubit>().enableSearch(value),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: AppLocalizations.of(context)!.search_hint,
                  ),
                ),
              );
            }),
            const SizedBox(
              width: 8,
            ),
            BlocBuilder<SearchEnableCubit, bool>(builder: (context, isEnabled) {
              return ElevatedButton(
                onPressed:
                    isEnabled ? () => widget.onSearch(_controller.text) : null,
                child: Text(
                  AppLocalizations.of(context)!.search_button,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }),
          ],
        ),
      );
}
