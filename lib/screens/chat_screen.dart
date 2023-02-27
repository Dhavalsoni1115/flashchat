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
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    // padding: EdgeInsets.all(5),
                    height: 687,
                    width: double.infinity,
                    color: Colors.grey.shade400,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ChatCard(
                                topLeft: const Radius.circular(0),
                                topRight: const Radius.circular(15),
                                bottomLeft: const Radius.circular(15),
                                bottomRight: const Radius.circular(15),
                                message: "hiii",
                                currenttime: now.toString(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ChatCard(
                                  topLeft: const Radius.circular(15),
                                  topRight: const Radius.circular(0),
                                  bottomLeft: const Radius.circular(15),
                                  bottomRight: const Radius.circular(15),
                                  message: "hiii",
                                  currenttime: now.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 620),
                    child: Row(
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
                          onPressed: () {
                            addMessage(
                              widget.userId,
                              widget.userName,
                              widget.personId,
                              widget.personName,
                              [
                                {
                                  'senderId': widget.userId,
                                  'dateTime': now,
                                  'chat': message,
                                },
                              ],
                            );
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
