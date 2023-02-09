import 'package:flutter/material.dart';
import 'package:gameapp/widgets/search_bar_widget.dart';

import '../widgets/game_list.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.bottomLeft,
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Text(
              'Games',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey.shade100,
            thickness: 3,
          ),
          const SearchBar(),
          Divider(
            color: Colors.grey.shade100,
            thickness: 3,
          ),
          const Expanded(child: GameList()),
        ],
      ),
    );
  }
}
