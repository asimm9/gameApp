import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/providers/all_providers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/game_model.dart';

class GameDetail extends ConsumerWidget {
  final GameModel? currentGame;
  const GameDetail({
    this.currentGame,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Map<String, dynamic>?> map =
        ref.watch(gameDetailProvider(currentGame));
    return map.when(
      data: (data) {
        var currentGame = data;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(currentGame?['backgroundImage']),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      currentGame?['name'],
                      style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListTile(
                        title: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 8, 5),
                          child: Text(
                            'Game Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        subtitle: Text(currentGame?['description'],
                            style: const TextStyle(fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 15,
              thickness: 2,
              color: Colors.grey.shade200,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                  onTap: () {
                    final Uri url = Uri.parse(currentGame?['reddit_url']);
                    launchUrl(url);
                  },
                  child: const Text('Visit Reddit',
                      style: TextStyle(fontSize: 18))),
            ),
            Divider(
              indent: 15,
              thickness: 2,
              color: Colors.grey.shade200,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                  onTap: () {
                    final Uri url = Uri.parse(currentGame?['website']);
                    launchUrl(url);
                  },
                  child: const Text('Visit Website',
                      style: TextStyle(fontSize: 18))),
            ),
            Divider(
              indent: 15,
              thickness: 2,
              color: Colors.grey.shade200,
            )
          ],
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      skipError: true,
    );
  }
}
