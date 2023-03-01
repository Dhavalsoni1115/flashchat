import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/screens/commonpage.dart';
import 'package:flashchat/screens/firestoredata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chat_card.dart';

class ChatScreen extends StatefulWidget {
  final dynamic personId, personName, personEmail, userId, userName, userEmail;
  const ChatScreen({
    Key? key,
    this.personId,
    this.personName,
    this.personEmail,
    this.userId,
    this.userName,
    this.userEmail,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //String currenttime = DateFormat('hh:mm a').format(DateTime.now());
  dynamic message;

  //dynamic data = getMessage();
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
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          title: Text(
            widget.personName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade200,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6),
                          child: data[index]['participant1Id'] ==
                                  widget.personId
                              ? ChatCard(
                                  topLeft: const Radius.circular(0),
                                  topRight: const Radius.circular(20),
                                  bottomLeft: const Radius.circular(20),
                                  bottomRight: const Radius.circular(20),
                                  message: data[index]['message'][index]['chat'],
                                  currenttime: DateTime.now(),
                                )
                              : SizedBox(),
                          // SizedBox(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          data[index]['participant1Id'] == widget.userId
                              ? ChatCard(
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(0),
                                  bottomLeft: const Radius.circular(20),
                                  bottomRight: const Radius.circular(20),
                                  message: data[index]['message'][index]['chat'],
                                  currenttime: DateTime.now(),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    //padding: EdgeInsets.all(10),
                    height: 67,
                    color: Colors.grey.shade400,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          padding: const EdgeInsets.all(10),
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                CupertinoIcons.smiley,
                                size: 30,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                //height: 20,
                                width: 200,
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  //autofocus: true,
                                  onChanged: (value) {
                                    message = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () async {
                    try {
                      //dynamic id = widget.userId + widget.personId;
                      dynamic data = await getMessage();
                      print(data);
                      //print(await getMessage());
                      //dynamic messagedata = data?[0]['message'];
                      //print(data);
                      addMessage(
                        id: widget.userId.toString() +
                            widget.personId.toString(),
                        participant1Id: widget.userId.toString(),
                        participant1Name: widget.userName.toString(),
                        participant2Id: widget.personId.toString(),
                        participant2Name: widget.personName.toString(),
                        message: [
                          ...data?[0]['message'],
                          {
                            'senderId': widget.userId.toString(),
                            'dateTime': DateTime.now(),
                            'chat': message.toString(),
                          }
                        ],
                      );
                    } catch (e) {
                      print('Error');
                    }
                  },
                  backgroundColor: Colors.orangeAccent.shade200,
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.paperplane_fill,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
