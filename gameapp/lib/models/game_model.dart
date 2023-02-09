import 'dart:convert';

class GameModel {
  GameModel({
    this.id,
    this.name,
    this.backgroundImage,
    this.metacritic,
    this.genres,
  });

  final int? id;
  final String? name;
  final String? backgroundImage;
  final int? metacritic;
  final List<Genre>? genres;

  factory GameModel.fromJson(String str) => GameModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameModel.fromMap(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        name: json["name"],
        backgroundImage: json["background_image"],
        metacritic: json["metacritic"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "background_image": backgroundImage,
        "metacritic": metacritic,
        "genres": List<dynamic>.from(genres!.map((x) => x.toMap())),
      };
}

class Genre {
  Genre({
    required this.name,
  });
  @override
  String toString() {
    return name;
  }

  final String name;

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
      };
}
