// To parse this JSON data, do
//
//     final champModel = champModelFromJson(jsonString);

import 'dart:convert';

ChampModel champModelFromJson(String str) => ChampModel.fromJson(json.decode(str));

String champModelToJson(ChampModel data) => json.encode(data.toJson());

class ChampModel {
  int? id;
  String? nom;
  String? location;
  String? typeSol;
  int? userId;
  List<String>? cultures;

  ChampModel({
    this.id,
    this.nom,
    this.location,
    this.typeSol,
    this.userId,
    this.cultures,
  });

  factory ChampModel.fromJson(Map<String, dynamic> json) => ChampModel(
    id: json["id"],
    nom: json["nom"],
    location: json["location"],
    typeSol: json["type_sol"],
    userId: json["user_id"],
    cultures: json["cultures"] == null ? [] : List<String>.from(json["cultures"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "location": location,
    "type_sol": typeSol,
    "user_id": userId,
    "cultures": cultures == null ? [] : List<dynamic>.from(cultures!.map((x) => x)),
  };
}
