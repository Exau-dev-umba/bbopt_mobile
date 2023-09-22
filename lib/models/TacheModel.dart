// To parse this JSON data, do
//
//     final tacheModel = tacheModelFromJson(jsonString);

import 'dart:convert';

TacheModel tacheModelFromJson(String str) => TacheModel.fromJson(json.decode(str));

String tacheModelToJson(TacheModel data) => json.encode(data.toJson());

class TacheModel {
  int? id;
  int? userId;
  String? title;
  DateTime? dueDate;
  int? isCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? recurringReminderSent;

  TacheModel({
    this.id,
    this.userId,
    this.title,
    this.dueDate,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
    this.recurringReminderSent,
  });

  factory TacheModel.fromJson(Map<String, dynamic> json) => TacheModel(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    isCompleted: json["is_completed"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    recurringReminderSent: json["recurring_reminder_sent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "due_date": "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "is_completed": isCompleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "recurring_reminder_sent": recurringReminderSent,
  };
}
