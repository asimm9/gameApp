import 'package:dio/dio.dart';
import '../models/game_model.dart';

class ApiService {
  Future<List<GameModel>> getGameList() async {
    var response = await Dio().get(
        'https://api.rawg.io/api/games?page_size=20&page=1&key=84de93aefcde40d383b7d4f9a31a58aa');
    List<GameModel> gameList = [];
    if (response.statusCode == 200) {
      gameList = (response.data['results'] as List)
          .map((e) => GameModel.fromMap(e))
          .toList();
    }
    return gameList;
  }
}

class GameDetailaapi {
  Future<Map<String?, dynamic>?> getGameList(int? anlikGameId) async {
    Response<dynamic>? response = await Dio().get(
        'https://api.rawg.io/api/games/$anlikGameId?key=84de93aefcde40d383b7d4f9a31a58aa');
    Map<String?, dynamic>? game = response.data;
    return game;
  }
}
