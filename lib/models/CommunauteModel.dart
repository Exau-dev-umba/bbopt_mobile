// To parse this JSON data, do
//
//     final communauteModel = communauteModelFromJson(jsonString);

import 'dart:convert';

CommunauteModel communauteModelFromJson(String str) => CommunauteModel.fromJson(json.decode(str));

String communauteModelToJson(CommunauteModel data) => json.encode(data.toJson());

class CommunauteModel {
  int? id;
  int? userId;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;
  User? user;

  CommunauteModel({
    this.id,
    this.userId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.user,
  });

  factory CommunauteModel.fromJson(Map<String, dynamic> json) => CommunauteModel(
    id: json["id"],
    userId: json["user_id"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    image: json["image"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image": image,
    "user": user?.toJson(),
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
  int? activeStatus;
  int? darkMode;
  String? messengerColor;
  String? avatar;

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
    this.activeStatus,
    this.darkMode,
    this.messengerColor,
    this.avatar,
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
    activeStatus: json["active_status"],
    darkMode: json["dark_mode"],
    messengerColor: json["messenger_color"],
    avatar: json["avatar"],
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
    "active_status": activeStatus,
    "dark_mode": darkMode,
    "messenger_color": messengerColor,
    "avatar": avatar,
  };
}
