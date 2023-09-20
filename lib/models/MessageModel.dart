// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  int? id;
  String? text;
  DateTime? date;
  bool? isSendByMe;

  MessageModel({
    this.id,
    this.text,
    this.date,
    this.isSendByMe,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    text: json["text"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    isSendByMe: json["isSendByMe"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "date": date?.toIso8601String(),
    "isSendByMe": isSendByMe,
  };
}
