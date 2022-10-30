import 'package:flutter/material.dart';
import 'package:whatsapp_clone/status/models/status_models.dart';
import 'package:whatsapp_clone/status/status_tile.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({super.key});
  List<UserStatus> statuses = [
    UserStatus(
      name: 'Fasalul Haque',
      image: '',
      updatedAt: '3pm',
    ),
    UserStatus(
      name: 'Arjun',
      image:
          'https://economictimes.indiatimes.com/thumb/msid-91701535,width-1200,height-900,resizemode-4,imgsize-50956/mohanlal.jpg?from=mdr',
      updatedAt: '9am',
    ),
    UserStatus(
      name: 'abd',
      image:
          'https://images.news18.com/ibnlive/uploads/2022/09/mammootty-movies-16624616864x3.jpg',
      updatedAt: '10am',
    ),
    UserStatus(
      name: 'Flutter',
      image: '',
      updatedAt: '11am',
    ),
    UserStatus(
      name: 'Arj',
      image:
          'https://st3.depositphotos.com/1037987/15097/i/600/depositphotos_150975580-stock-photo-portrait-of-businesswoman-in-office.jpg',
      updatedAt: '12am',
    ),
    UserStatus(
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
        itemCount: statuses.length,
        itemBuilder: (BuildContext context, int index) {
          return StatusTile(userDatas: statuses[index]);
        },
      ),
    );
  }
}



