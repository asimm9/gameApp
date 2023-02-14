import 'package:flutter/material.dart';
import 'package:gameapp/models/game_model.dart';

class FavoritesNotifer extends ChangeNotifier {
  List<GameModel> favoriteList = [];

  void addGame(GameModel currentGame) {
    favoriteList.add(currentGame);
    notifyListeners();
  }

  void removeGame(GameModel currentGame) {
    favoriteList.remove(currentGame);
    notifyListeners();
  }
}
