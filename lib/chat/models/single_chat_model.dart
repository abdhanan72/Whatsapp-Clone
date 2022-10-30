// To parse this JSON data, do
//
//     final singleChat = singleChatFromJson(jsonString);

import 'dart:convert';

SingleChat singleChatFromJson(String str) => SingleChat.fromJson(json.decode(str));

String singleChatToJson(SingleChat data) => json.encode(data.toJson());

class SingleChat {
    SingleChat({
        this.isSend,
        this.isReaded,
        this.message,
        this.sendAt,
    });

    bool? isSend;
    bool? isReaded;
    String? message;
    String? sendAt;

    factory SingleChat.fromJson(Map<String, dynamic> json) => SingleChat(
        isSend: json["is_send"],
        isReaded: json["is_readed"],
        message: json["message"],
        sendAt: json["send_at"],
    );

    Map<String, dynamic> toJson() => {
        "is_send": isSend,
        "is_readed": isReaded,
        "message": message,
        "send_at": sendAt,
    };
}
