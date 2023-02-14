import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/models/game_model.dart';
import 'package:gameapp/pages/game_detail_page.dart';
import 'package:gameapp/providers/all_providers.dart';

class FavoriteGamesList extends ConsumerWidget {
  const FavoriteGamesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GameModel> favoritesList = ref.watch(favoritesProvider).favoriteList;

    return favoritesList.isEmpty
        ? const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 18),
            child: Text(
              'There is no favorites found.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ))
        : ListView.builder(
            itemBuilder: (context, index) {
              var currentGame = favoritesList[index];
              return Dismissible(
                key: Key('item ${favoritesList[index]}'),
                onDismissed: (direction) {
                  ref.read(favoritesProvider.notifier).removeGame(currentGame);
                },
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Confirmation"),
                        content: const Text(
                            "Are you sure you want to delete this item?"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete")),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Cancel"),
                          ),
                        ],
                      );
                    },
                  );
                },
                background: const Center(
                    child: Text('Game is Removing  from Favorites')),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => GameDetailPage(
                              currentGame: currentGame,
                            )),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image(
                                image:
                                    NetworkImage(currentGame.backgroundImage!),
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    currentGame.name!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    children: [
                                      const Text(
                                        'metacritic: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        currentGame.metacritic!.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  subtitle:
                                      Text(currentGame.genres!.toString()),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: favoritesList.length,
          );
  }
}
