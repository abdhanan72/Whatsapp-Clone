import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat/models/chat_model.dart';
import 'package:whatsapp_clone/chat/pages/chat_detailed_screen.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.userData}) : super(key: key);
  User userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetail(userDetails: userData),)),
      leading: CircleAvatar(
          backgroundImage: (userData.image == '')
              ? AssetImage(userData.isGroup!
                  ? 'assets/images/Group_icon.png'
                  : 'assets/images/default_dp.jpg') as ImageProvider<Object>?
              : NetworkImage(userData.image!)),
      title: Text(userData.name!),
      subtitle: Text(userData.message!),
      trailing: Text(userData.updatedAt!),
    );
  }
}
