import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/chat_tile.dart';
import 'package:whatsapp_clone/chat/models/chat_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  List<User> users = [
    User(
        name: 'Fasalul Haque',
        image: '',
        isGroup: false,
        updatedAt: '3pm',
        message: 'Hi'),
    User(
      name: 'Arjun',
      image:
          'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg',
      isGroup: false,
      updatedAt: '9am',
      message: 'Hello',
    ),
    User(
      name: 'abd',
      image:
          'https://st.depositphotos.com/1269204/1219/i/450/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg',
      isGroup: true,
      updatedAt: '10am',
      message: 'Hello',
    ),
    User(
      name: 'Flutter',
      image: '',
      isGroup: true,
      updatedAt: '11am',
      message: 'Hello',
    ),
    User(
      name: 'Arj',
      image:
          'https://st3.depositphotos.com/1037987/15097/i/600/depositphotos_150975580-stock-photo-portrait-of-businesswoman-in-office.jpg',
      isGroup: false,
      updatedAt: '12am',
      message: 'Hello',
    ),
    User(
      name: 'Arj',
      image:
          'https://thumbs.dreamstime.com/b/happy-person-portrait-smiling-woman-tanned-skin-curly-hair-happy-person-portrait-smiling-young-friendly-woman-197501184.jpg',
      isGroup: false,
      updatedAt: '12am',
      message: 'Hello',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatTile(
            userData: users[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
