import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/providers/all_providers.dart';

import '../models/game_model.dart';
import '../pages/game_detail_page.dart';

class GameList extends ConsumerWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<GameModel>> liste = ref.watch(gameListProvider);
    return liste.when(
      data: (data) {
        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              GameModel? currentGame = data[index];
              return InkWell(
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
                              image: NetworkImage(currentGame.backgroundImage!),
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
                                subtitle: Text(currentGame.genres!.toString()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      error: ((error, stackTrace) {
        return Text(error.toString());
      }),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
