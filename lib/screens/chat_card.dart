import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatCard extends StatelessWidget {
  // final now = DateTime.now();
  //String currenttime = DateFormat('hh:mm a').format(DateTime.now());
  dynamic topRight, topLeft, bottomLeft, bottomRight, message, currenttime;
  //Timestamp currenttime;
  // DateTime currenttime;
  ChatCard({
    Key? key,
    this.bottomLeft,
    this.bottomRight,
    this.topLeft,
    this.topRight,
    this.currenttime,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: topRight,
            topLeft: topLeft,
            bottomLeft: bottomLeft,
            bottomRight: bottomRight,
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
            Text(message),
            // Text(
            //   currenttime,
            //   style: TextStyle(color: Colors.grey.shade500),
            // ),
          ],
        ),
      ),
    );
  }
}
