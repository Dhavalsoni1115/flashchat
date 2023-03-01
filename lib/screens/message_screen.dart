import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/contact_screen.dart';
import 'package:flashchat/screens/firestoredata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageScreen extends StatefulWidget {
  dynamic loginEmail, userId, userName;
  MessageScreen({
    Key? key,
    this.loginEmail,
    this.userId,
    this.userName,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<dynamic> data = [];
  Future<dynamic> getChat() async {
    List<dynamic> data1 = await getMessage();
    setState(() {
      data = data1;
    });
    print(data);
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            widget.userName.toString(),
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
                  loginEmail: widget.loginEmail,
                  userId: widget.userId,
                  userName: widget.userName,
                ),
              ),
            );
          },
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => Column(
            children: [
              data[index]["participant1Name"] == widget.userName
                  ? GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            userId: data[index]['participant1Id'],
                            userName: data[index]['participant1Name'],
                            personId: data[index]['participant2Id'],
                            personName: data[index]['participant2Name'],
                          ),
                        ),
                      ),
                      child: Container(
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
                              data[index]['participant2Name'],
                              style: TextStyle(fontSize: 17),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
