class Character {
  int? charId;
  String? name;
  String? gender;
  String? image;
  String? status;
  String? originUrl;
  List<dynamic>? appearanceOfEpisodes;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['id'];
    name = json['name'];
    gender = json['gender'];
    image = json['image'];
    status = json['status'];
    originUrl = json['origin']['url'];
    appearanceOfEpisodes = json['episode'];
  }
}
