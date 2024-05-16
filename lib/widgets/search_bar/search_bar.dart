import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/search_bloc/search_bloc.dart';
import '../../utils/message_utils.dart';

part 'history_item.dart';

class Search<T> extends StatefulWidget {
  final Widget Function(T dto) transformer;
  final void Function(T dto, String query) onTapResult;
  final Widget Function(T? prev, T curr)? separator;
  final void Function(String query)? historyAction;
  final Future<Iterable<String>> Function()? getHistory;
  late final String _type;
  final String? hint;

  Search.bar({
    required this.transformer,
    required this.onTapResult,
    this.separator,
    this.historyAction,
    this.getHistory,
    this.hint,
    super.key,
  }) {
    _type = 'bar';
  }

  Search.anchor({
    required this.transformer,
    required this.onTapResult,
    this.separator,
    this.historyAction,
    this.getHistory,
    this.hint,
    super.key,
  }) {
    _type = 'anchor';
  }

  // wierd bug in flutter 3.19.3/dart 3.3.1
  // type '(ChatDto, ChatDto) => Widget' is not a subtype of type '((dynamic, dynamic) => Widget)'
  Widget transform(T dto) => transformer(dto);

  bool get hasSeparator => separator != null;

  Widget separate(T? prev, T curr) => separator!.call(prev, curr);

  void onTap(T dto, String query) => onTapResult.call(dto, query);

  @override
  State<Search> createState() => _SearchState<T>();
}

class _SearchState<T> extends State<Search> {
  final _searchController = SearchController();

  @override
  void dispose() {
    // bug
    // I can't go to another page in same StatefulShellBranch if search is still opened
    // results: it stays open
    // so I close it in line 191: _searchController.closeView('')
    // but if I call context.go instantly - i get error, bc controller is disposed while view is still animating to close
    // so here i wait some (random) time and then dispose
    Future.delayed(const Duration(seconds: 2), _searchController.dispose);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = switch (widget._type) {
      'anchor' => SearchAnchor(
          searchController: _searchController,
          viewHintText: widget.hint ?? 'search.hint'.tr(),
          viewLeading: IconButton(
            onPressed: () => _searchController.closeView(''),
            icon: const Icon(Icons.arrow_back),
          ),
          builder: (context, controller) => const Icon(Icons.search),
          suggestionsBuilder: _suggestionsBuilder,
        ),
      'bar' => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _searchController.openView,
          child: IgnorePointer(
            child: SearchAnchor.bar(
              searchController: _searchController,
              viewHintText: widget.hint ?? 'search.hint'.tr(),
              barHintText: widget.hint ?? 'search.hint'.tr(),
              viewLeading: IconButton(
                onPressed: () => _searchController.closeView(''),
                icon: const Icon(Icons.arrow_back),
              ),
              suggestionsBuilder: _suggestionsBuilder,
            ),
          ),
        ),
      _ => throw 'no such SearchBar type'
    };

    return BlocListener<SearchBloc<T>, SearchState<T>>(
      listenWhen: (prev, curr) => curr is SearchErrorState,
      listener: (context, state) {
        if (state is! SearchErrorState<T>) return;
        MessageUtils.showTertiarySnackBar(context, state.message.tr());
      },
      child: res,
    );
  }

  FutureOr<Iterable<Widget>> _suggestionsBuilder(
      BuildContext context, SearchController controller) {
    // Show history on empty controller
    if (controller.text.isEmpty) {
      if (widget.historyAction == null || widget.getHistory == null) {
        return [];
      }

      return widget.getHistory!().then((value) {
        if (value.isEmpty) {
          return [];
        }

        return value.map((e) => _HistoryItem(
              key: ValueKey('history$e'),
              text: e,
              onTap: () {
                _searchController.closeView(e);
                _searchController.openView();
                widget.historyAction!(e);
              },
            ));
      });
    }

    return [
      FutureBuilder(
        future: _onSearch(controller.text),
        builder: (context, snapshot) {
          // Progress if data == null
          if (!snapshot.hasData) {
            return const Column(children: [LinearProgressIndicator()]);
          }

          // Placeholder if not found
          if (snapshot.data!.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'search.nothing'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          }

          // Column if data appears (there won't be > 50 anyway)
          return Column(
            children: List<Widget>.of(snapshot.data!),
          );
        },
      ),
    ];
  }

  Future<Iterable<Widget>> _onSearch(String query) async {
    if (!context.mounted) return [];
    final bloc = context.read<SearchBloc<T>>();
    bloc.add(SearchQueryEvent<T>(query));

    final searchResultState =
        await bloc.stream.firstWhere((e) => e is SearchResultState<T>);
    final searchResult =
        (searchResultState as SearchResultState<T>).result.toList();

    final res = <Widget>[];
    for (var i = 0; i < searchResult.length; i++) {
      final e = searchResult[i];

      if (widget.hasSeparator) {
        res.add(widget.separate(
          i != 0 ? searchResult[i - 1] : null,
          e,
        ));
      }

      Widget curr = widget.transform(e);

      curr = InkWell(
        onTap: () async {
          _searchController.closeView('');
          widget.onTap(e, query);
        },
        child: curr,
      );

      res.add(curr);
    }

    return res;
  }
}
