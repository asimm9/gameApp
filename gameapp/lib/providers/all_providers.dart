import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gameapp/models/game_model.dart';
import 'package:gameapp/services/api_services.dart';

final gameListapiProvider = Provider((ref) => ApiService());

final gameListProvider = FutureProvider<List<GameModel>>((ref) async {
  return ref.read(gameListapiProvider).getGameList();
});

final gameDetailApiProvider = Provider((ref) => GameDetailaapi());

final gameDetailProvider =
    FutureProvider.family<Map<String, dynamic>, GameModel?>((ref, currentGame) {
  int? currentGameId = currentGame?.id;
  return ref.read(gameDetailApiProvider).getGameList(currentGameId);
});
