// To parse this JSON data, do
//
//     final userStatus = userStatusFromJson(jsonString);

import 'dart:convert';

UserStatus userStatusFromJson(String str) => UserStatus.fromJson(json.decode(str));

String userStatusToJson(UserStatus data) => json.encode(data.toJson());

class UserStatus {
    UserStatus({
        this.name,
        this.image,
        this.updatedAt,
    });

    String? name;
    String? image;
    String? updatedAt;

    factory UserStatus.fromJson(Map<String, dynamic> json) => UserStatus(
        name: json["name"],
        image: json["image"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "updatedAt": updatedAt,
    };
}
