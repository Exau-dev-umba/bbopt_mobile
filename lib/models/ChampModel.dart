// To parse this JSON data, do
//
//     final champModel = champModelFromJson(jsonString);

import 'dart:convert';

ChampModel champModelFromJson(String str) => ChampModel.fromJson(json.decode(str));

String champModelToJson(ChampModel data) => json.encode(data.toJson());

class ChampModel {
  int? id;
  String? nom;
  int? temperature;
  String? location;
  String? humidite;
  int? tauxPhosphore;
  int? tauxAzote;
  int? ph;
  int? conductivite;
  String? typeSol;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ChampModel({
    this.id,
    this.nom,
    this.temperature,
    this.location,
    this.humidite,
    this.tauxPhosphore,
    this.tauxAzote,
    this.ph,
    this.conductivite,
    this.typeSol,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ChampModel.fromJson(Map<String, dynamic> json) => ChampModel(
    id: json["id"],
    nom: json["nom"],
    temperature: json["temperature"],
    location: json["location"],
    humidite: json["humidite"],
    tauxPhosphore: json["taux_phosphore"],
    tauxAzote: json["taux_azote"],
    ph: json["ph"],
    conductivite: json["conductivite"],
    typeSol: json["type_sol"],
    userId: json["user_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "temperature": temperature,
    "location": location,
    "humidite": humidite,
    "taux_phosphore": tauxPhosphore,
    "taux_azote": tauxAzote,
    "ph": ph,
    "conductivite": conductivite,
    "type_sol": typeSol,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
