import 'dart:convert';

class UserModel {
  final String name;
  final String profilePicUrl;
  final int score;

  UserModel({
    required this.name,
    required this.profilePicUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'profilePicUrl': profilePicUrl,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      profilePicUrl: map['profilePicUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
