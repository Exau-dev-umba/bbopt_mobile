// To parse this JSON data, do
//
//     final authenticationModel = authenticationModelFromJson(jsonString);

import 'dart:convert';

AuthenticationModel authenticationModelFromJson(String str) => AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) => json.encode(data.toJson());

class AuthenticationModel {
  User? user;
  String? token;

  AuthenticationModel({
    this.user,
    this.token,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => AuthenticationModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  int? id;
  String? name;
  String? firstname;
  String? username;
  String? about;
  String? country;
  String? phone;
  String? email;
  String? emailVerifiedAt;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.firstname,
    this.username,
    this.about,
    this.country,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    firstname: json["firstname"],
    username: json["username"],
    about: json["about"],
    country: json["country"],
    phone: json["phone"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    photo: json["photo"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "firstname": firstname,
    "username": username,
    "about": about,
    "country": country,
    "phone": phone,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "photo": photo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
