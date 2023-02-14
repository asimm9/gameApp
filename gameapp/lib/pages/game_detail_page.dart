// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/models/game_model.dart';
import 'package:gameapp/providers/all_providers.dart';
import '../widgets/game_detail.dart';

class GameDetailPage extends ConsumerWidget {
  final GameModel? currentGame;
  const GameDetailPage({this.currentGame, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoriteList = ref.read(favoritesProvider).favoriteList;
    bool gameControl = favoriteList.contains(currentGame);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Games", style: TextStyle(color: Colors.blue)),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    !gameControl
                        ? ref
                            .read(favoritesProvider.notifier)
                            .addGame(currentGame!)
                        : const SnackBar(
                            backgroundColor: Colors.blue,
                            content:
                                Text('Game has already added favorite list'));
                  },
                  child: gameControl
                      ? const Text(
                          'Favorited',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )
                      : const Text(
                          'Favorite',
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        )),
            )
          ],
          leadingWidth: 30,
        ),
        body: GameDetail(
          currentGame: currentGame,
        ));
  }
}
