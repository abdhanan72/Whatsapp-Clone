import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/single_chat_model.dart';
import 'package:whatsapp_clone/chat/pages/chat_bubble.dart';

import '../models/chat_model.dart';
import 'package:intl/date_symbol_data_local.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({super.key, required this.userDetails});

  User userDetails;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  final _messageController = TextEditingController();
  FocusNode focusnode = FocusNode();
  bool showSent = false;

  bool showEmoji = false;

  List<SingleChat> bubble = [
    SingleChat(
        isReaded: true, isSend: true, message: 'hi', sendAt: '9:00  am '),
    SingleChat(
        isReaded: false, isSend: false, message: 'hello', sendAt: '10:00  am '),
    SingleChat(
        isReaded: true,
        isSend: true,
        message: 'ji ji ji',
        sendAt: '11:00  am '),
    SingleChat(
        isReaded: true, isSend: false, message: 'ok', sendAt: '12:00  am '),
    SingleChat(
        isReaded: true, isSend: true, message: 'ready', sendAt: '1:00  am '),
  ];

  var datetime = DateTime.now();

  void setbubble() {
    var time = '${datetime.hour}:${datetime.minute} am ';
    setState(() {
      bubble.add(SingleChat(
        isSend: true,
        isReaded: true,
        message: _messageController.text,
        sendAt: time,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            CircleAvatar(
                backgroundImage: widget.userDetails.image == ''
                    ? AssetImage(widget.userDetails.isGroup!
                            ? 'assets/images/Group_icon.png'
                            : 'assets/images/default_dp.jpg')
                        as ImageProvider<Object>?
                    : NetworkImage(widget.userDetails.image!)),
          ],
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.userDetails.name.toString()),
            Text(widget.userDetails.updatedAt.toString()),
          ],
        ),
        actions: [
          const Icon(Icons.call),
          const Icon(Icons.video_call),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                  child: Text(widget.userDetails.isGroup == true
                      ? 'Group info'
                      : 'View Contact')),
              PopupMenuItem(
                  child: Text(widget.userDetails.isGroup == true
                      ? 'Group media'
                      : 'Media,links,and docs')),
              const PopupMenuItem(child: Text('Search')),
              const PopupMenuItem(child: Text('Mute notification')),
              const PopupMenuItem(child: Text('Disappearing messages')),
              const PopupMenuItem(child: Text('Wallpaper')),
              const PopupMenuItem(child: Text('More')),
            ];
          })
        ],
      ),
      body: Container(
          child: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          ListView.builder(
            itemCount: bubble.length,
            itemBuilder: (BuildContext context, int index) {
              return ChatBubble(
                singleChat: bubble[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          focusNode: focusnode,
                          onTap: () {
                            setState(() {
                              showEmoji = false;
                            });
                          },
                          controller: _messageController,
                          onChanged: (value) {
                            if (value.length > 0) {
                              setState(() {
                                showSent = true;
                              });
                            } else {
                              setState(() {
                                showSent = false;
                              });
                            }

                            print(value);
                          },
                          decoration: InputDecoration(
                              hintText: 'message',
                              prefixIcon: IconButton(
                                icon: Icon(showEmoji
                                    ? Icons.keyboard_alt_outlined
                                    : Icons.emoji_emotions_outlined),
                                onPressed: () {
                                  showEmoji
                                      ? focusnode.unfocus
                                      : focusnode.requestFocus();
                                  setState(() {
                                    showEmoji = !showEmoji;
                                    showEmoji
                                        ? FocusManager.instance.primaryFocus
                                            ?.unfocus()
                                        : focusnode.requestFocus();
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) => menu(),
                                        );
                                      },
                                      icon: const Icon(Icons.attach_file)),
                                  const Icon(Icons.currency_rupee),
                                  const Icon(Icons.camera_alt),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setbubble();
                      },
                      child: Icon(showSent ? Icons.send : Icons.mic),
                    )
                  ],
                ),
                Offstage(
                  offstage: !showEmoji,
                  child: SizedBox(
                    height: 250,
                    child: EmojiPicker(
                      textEditingController: _messageController,
                    ),
                  ),
                )
                // showEmoji?selectEmoji():Container(),
              ],
            ),
          )
        ],
      )),
    );
  }

  Container menu() {
    return Container(
      height: 400,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconwidget(
                    icon: const Icon(Icons.insert_drive_file),
                    color: Colors.blue,
                    text: 'Document'),
                iconwidget(
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.redAccent,
                    text: 'Camera'),
                iconwidget(
                    icon: const Icon(Icons.insert_photo),
                    color: Colors.purple,
                    text: 'Gallery'),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconwidget(
                  icon: const Icon(Icons.headset),
                  color: Colors.orangeAccent,
                  text: 'Audio',
                ),
                iconwidget(
                    icon: const Icon(Icons.location_pin),
                    color: Colors.green,
                    text: 'Location'),
                iconwidget(
                  icon: const Icon(Icons.currency_rupee_outlined),
                  color: Colors.green,
                  text: 'Payment',
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  iconwidget(
                    icon: const Icon(Icons.contacts),
                    color: Colors.lightBlue,
                    text: 'Contact',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column iconwidget({
    String? text,
    Icon? icon,
    Color? color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: icon,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(text!)
      ],
    );
  }
}

// Widget selectEmoji() {
//   return EmojiPicker(
//     onEmojiSelected: (emoji, category) {},
//   );
// }
