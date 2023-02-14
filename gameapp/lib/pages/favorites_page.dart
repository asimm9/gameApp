import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/providers/all_providers.dart';

import '../models/game_model.dart';
import '../widgets/favıorite_games_list.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GameModel> favoriteList = ref.read(favoritesProvider).favoriteList;
    int favoriteListLenght = favoriteList.length;
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              'Favorites${favoriteListLenght == 0 ? '' : '($favoriteListLenght)'}',
              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 3,
          ),
          const Expanded(child: FavoriteGamesList()),
        ],
      ),
    );
  }
}
