// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gameapp/models/game_model.dart';
import '../widgets/game_detail.dart';

class GameDetailPage extends StatelessWidget {
  final GameModel? currentGame;
  const GameDetailPage({this.currentGame, super.key});

  @override
  Widget build(BuildContext context) {
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
          leadingWidth: 30,
        ),
        body: GameDetail(
          currentGame: currentGame,
        ));
  }
}
