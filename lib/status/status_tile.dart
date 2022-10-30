import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status/models/status_models.dart';

class StatusTile extends StatelessWidget {
  StatusTile({Key? key, required this.userDatas}) : super(key: key);
  UserStatus userDatas;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:NetworkImage(userDatas.image!),
        radius: 40,
        ),
        title: Text(userDatas.name!),
      subtitle: Text(userDatas.updatedAt!),

    );
    
    
  }
}
