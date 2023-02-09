import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/models/game_model.dart';

import '../pages/game_detail_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  final AsyncValue<List<GameModel>> allGames;

  CustomSearchDelegate({required this.allGames});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: const Icon(Icons.arrow_back_ios, color: Colors.blue),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<GameModel>? filteredList = allGames.whenOrNull(
        data: (data) => data
            .where((element) =>
                element.name!.toLowerCase().contains(query.toLowerCase()))
            .toList());
    return filteredList!.isNotEmpty
        ? ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              var game = filteredList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const GameDetailPage()),
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
                              image: NetworkImage(game.backgroundImage!),
                              fit: BoxFit.cover),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  game.name!,
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
                                      game.metacritic.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                                  ],
                                ),
                                subtitle: Text(game.genres.toString()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
        : const Center(
            child: Text("Aradığınızı Bulamadım"),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
