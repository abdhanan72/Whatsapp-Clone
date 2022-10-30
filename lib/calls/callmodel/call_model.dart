// To parse this JSON data, do
//
//     final call = callFromJson(jsonString);

import 'dart:convert';

Call callFromJson(String str) => Call.fromJson(json.decode(str));

String callToJson(Call data) => json.encode(data.toJson());

class Call {
    Call({
        this.name,
        this.image,
        this.updatedAt,
        this.icon,
    });

    String? name;
    String? image;
    String? updatedAt;
    String? icon;

    factory Call.fromJson(Map<String, dynamic> json) => Call(
        name: json["name"],
        image: json["image"],
        updatedAt: json["updatedAt"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "updatedAt": updatedAt,
        "icon": icon,
    };
}
