import 'dart:convert';

class GameDetailModel {
  GameDetailModel({
    this.name,
    this.description,
    this.website,
    this.redditUrl,
    this.backgroundImage,
    this.id,
  });
  final int? id;
  final String? name;
  final String? description;
  final String? website;
  final String? redditUrl;
  final String? backgroundImage;

  factory GameDetailModel.fromJson(String str) =>
      GameDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GameDetailModel.fromMap(Map<String, dynamic> json) => GameDetailModel(
        name: json["name"],
        description: json["description"],
        website: json["website"],
        redditUrl: json["reddit_url"],
        backgroundImage: json["background_image"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "website": website,
        "reddit_url": redditUrl,
        "background_image": backgroundImage,
      };
}
