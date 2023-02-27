import 'package:flashchat/screens/contact_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageScreen extends StatelessWidget {
  dynamic loginEmail, userId, userName;
  MessageScreen({
    Key? key,
    this.loginEmail,
    this.userId,
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            userName.toString(),
            //"Flash Chat",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade200,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent.shade200,
          child: Icon(
            CupertinoIcons.person_badge_plus,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactScreen(
                  loginEmail: loginEmail,
                  userId: userId,
                ),
              ),
            );
          },
        ),
        body: Container(),
      ),
    );
  }
}
