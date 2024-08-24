import 'dart:convert';

PlaceHolderModel placeHolderModelFromJson(String str) =>
    PlaceHolderModel.fromJson(json.decode(str));

String placeHolderModelToJson(PlaceHolderModel data) =>
    json.encode(data.toJson());

class PlaceHolderModel {
  int? id;
  int? userId;
  String? title;
  String? body;

  PlaceHolderModel({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory PlaceHolderModel.fromJson(Map<String, dynamic> json) =>
      PlaceHolderModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
