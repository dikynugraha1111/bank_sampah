import 'dart:convert';

class UserProfile {
  UserProfile({
    required this.success,
    required this.user,
    required this.token,
  });

  final bool success;
  final User user;
  final String token;

  factory UserProfile.fromJson(String str) =>
      UserProfile.fromMap(json.decode(str));

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
        success: json["success"],
        user: User.fromMap(json["user"]),
        token: json["token"],
      );
}

class User {
  User({
    required this.id,
    required this.username,
    required this.rt,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String username;
  final String rt;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        rt: json["rt"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
