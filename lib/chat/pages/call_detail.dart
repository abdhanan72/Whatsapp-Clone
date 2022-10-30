import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/callmodel/call_model.dart';

class call_detail extends StatelessWidget {
  call_detail({super.key, required this.userdetail});

  Call userdetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: const Text('Call info'),
        actions: [
          Icon(Icons.message),
          PopupMenuButton(
            itemBuilder: (context) {
              return const [
                PopupMenuItem(child: Text('Remove from call log')),
                PopupMenuItem(child: Text('Block'))
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return  ListTile(
            leading: CircleAvatar(

              backgroundImage: NetworkImage(userdetail.image!)

            ),
              title: Text(userdetail.name.toString()),
              subtitle: Text('HI im using whatsapp'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children:const  [
                  Icon(Icons.missed_video_call),
                  Icon(Icons.call)
                ],
              ),

          ) ;
        },
      ),
      
      // body: Row(
      //   children: const [
      //      CircleAvatar(
      //       radius: 30,
      //       backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'),
      //     ),
      //     Text('ABD'),
      //   ],
      // ),


      
    );
  }
}
