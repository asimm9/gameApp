import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/providers/all_providers.dart';

import '../models/game_model.dart';
import 'custom_serach_delegate.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var liste = ref.watch(gameListProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showSearchPage(liste);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  (Icons.search),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Search for the games',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showSearchPage(AsyncValue<List<GameModel>> liste) {
    showSearch(
        context: context, delegate: CustomSearchDelegate(allGames: liste));
  }
}
