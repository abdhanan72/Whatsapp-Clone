// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/callmodel/call_model.dart';

import 'calltile.dart';

class CallList extends StatelessWidget {
  CallList({super.key});

  List<Call> cll = [
    Call(
      name: 'Fasalul Haque',
      image: '',
      updatedAt: '3pm',
    ),
    Call(
      name: 'Arjun',
      image:
          'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg',
      updatedAt: '9am',
    ),
    Call(
      name: 'abd',
      image:
          'https://st.depositphotos.com/1269204/1219/i/450/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg',
      updatedAt: '10am',
    ),
    Call(
      name: 'Flutter',
      image: '',
      updatedAt: '11am',
    ),
    Call(
      name: 'Arj',
      image:
          'https://st3.depositphotos.com/1037987/15097/i/600/depositphotos_150975580-stock-photo-portrait-of-businesswoman-in-office.jpg',
      updatedAt: '12am',
    ),
    Call(
      name: 'Arj',
      image:
          'https://thumbs.dreamstime.com/b/happy-person-portrait-smiling-woman-tanned-skin-curly-hair-happy-person-portrait-smiling-young-friendly-woman-197501184.jpg',
      updatedAt: '12am',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cll.length,
        itemBuilder: (BuildContext context, int index) {
          return CallTile(
            clls: cll[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      child: Icon(Icons.call),
      ),
    );
  }
}

// class CallTile extends StatelessWidget {
//   const CallTile({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const ListTile(
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage('image'),
//       ),
//       title: Text('data'),
//       subtitle: Text('wer'),
//     );
//   }
// }
