// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.name,
        this.message,
        this.image,
        this.isGroup,
        this.updatedAt,
    });

    String? name;
    String? message;
    String? image;
    bool? isGroup;
    String? updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        message: json["message"],
        image: json["image"],
        isGroup: json["isGroup"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "image": image,
        "isGroup": isGroup,
        "updatedAt": updatedAt,
    };
}
