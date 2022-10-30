import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key,required this.singleChat});

  SingleChat singleChat;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: singleChat.isSend!?    Alignment.centerRight:Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 150,
        ),
        child: Card(
          color: singleChat.isSend!? const Color(0XFFdcf8c6):Colors.white,
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10, top: 7, right: 60, bottom: 10),
                child: Text(singleChat.message.toString()),
              ),
              Positioned(
                top: 20,
                bottom: 3,
                right: 0,
                child: Row(
                  children:  [
                    Text(
                      singleChat.sendAt!,
                      style: const TextStyle(fontSize: 10),
                    ),
                    if(singleChat.isSend!)
                    Icon(
                      Icons.done_all,color: singleChat.isReaded!? Colors.blue:Colors.grey,
                      size: 14,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
