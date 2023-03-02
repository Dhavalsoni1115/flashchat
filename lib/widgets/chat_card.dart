import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  // final now = DateTime.now();
  //String currenttime = DateFormat('hh:mm a').format(DateTime.now());
  double topRight, topLeft, bottomLeft, bottomRight;
  dynamic message;
  dynamic messageTime;
  //Timestamp currenttime;
  // DateTime currenttime;
  ChatCard({
    Key? key,
    required this.bottomLeft,
    required this.bottomRight,
    required this.topLeft,
    required this.topRight,
    this.messageTime,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight),
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
          borderSide: BorderSide.none),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        height: 30,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(message.toString()),
            // Text(
            //   messageTime,
            //   style: TextStyle(color: Colors.grey.shade500),
            // ),
          ],
        ),
      ),
    );
  }
}
