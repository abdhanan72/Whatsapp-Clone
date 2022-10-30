import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/callmodel/call_model.dart';
import 'package:whatsapp_clone/chat/pages/call_detail.dart';

class CallTile extends StatelessWidget {
  CallTile({
    Key? key, required this.clls
  }) : super(key: key);
  Call clls;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => call_detail(userdetail:clls ),)),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(clls.image!)
      ),
      title: Text(clls.name!),
      subtitle: Text(clls.updatedAt!),
      trailing: const Icon(Icons.video_call),
    );
  }
}
