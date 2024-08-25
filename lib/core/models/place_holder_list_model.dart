// To parse this JSON data, do
//
//     final placeHolderListModel = placeHolderListModelFromJson(jsonString);

import 'dart:convert';

PlaceHolderListModel placeHolderListModelFromJson(String str) => PlaceHolderListModel.fromJson(json.decode(str));

String placeHolderListModelToJson(PlaceHolderListModel data) => json.encode(data.toJson());

class PlaceHolderListModel {
    int? postId;
    int? id;
    String? name;
    String? email;
    String? body;

    PlaceHolderListModel({
        this.postId,
        this.id,
        this.name,
        this.email,
        this.body,
    });

    factory PlaceHolderListModel.fromJson(Map<String, dynamic> json) => PlaceHolderListModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
