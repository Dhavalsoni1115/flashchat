import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/data/firestoredata.dart';
import 'package:flashchat/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactScreen extends StatefulWidget {
  dynamic loginEmail, userId, userName;
  ContactScreen({
    Key? key,
    this.loginEmail,
    this.userId,
    this.userName,
  }) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    getContact();
    super.initState();
  }

  List<dynamic> userData = [];
  Future<dynamic> getContact() async {
    List<dynamic> userData1 = await getUserData();
    setState(() {
      userData = userData1;
      print(userData);
    });

    //print(data);
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Contact",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade200,
        ),
        body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) => Column(
            children: [
              GestureDetector(
                //   onTap: Navigator.push(context,MessageScreen(loginEmail: widget.loginEmail)
                // ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        userId: widget.userId,
                        userName: widget.userName,
                        userEmail: widget.loginEmail,
                        personId: userData[index]['id'],
                        personEmail: userData[index]['email'],
                        personName: userData[index]['name'],
                      ),
                    )),
                child: userData[index]["id"] != widget.userId
                    ? Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(15),
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              userData[index]['name'],
                              style: TextStyle(fontSize: 17),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      )
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
