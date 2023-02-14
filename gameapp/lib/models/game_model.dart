import 'dart:convert';

class GameModel {
  GameModel({
    this.id,
    this.name,
    this.metacritic,
    this.genres,
    this.backgroundImage,
  });

  final int? id;
  final String? name;
  final int? metacritic;
  final List<Genre>? genres;
  final String? backgroundImage;

  factory GameModel.fromJson(String str) => GameModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameModel.fromMap(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        name: json["name"],
        metacritic: json["metacritic"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        backgroundImage: json["background_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "metacritic": metacritic,
        "genres": List<dynamic>.from(genres!.map((x) => x.toMap())),
        "background_image": backgroundImage,
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
