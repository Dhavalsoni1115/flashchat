import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/screens/commonpage.dart';
import 'package:flashchat/data/firestoredata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chat_card.dart';

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
  List<dynamic> chatData = [];
  Future<dynamic> getChat() async {
    List<dynamic> chatData1 = await getMessage();
    // List<dynamic> oldData = data1[0]['message'];
    setState(() {
      chatData = chatData1;
    });

    print(chatData);
    // print(chatData);
    return chatData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChat();
  }

  @override
  Widget build(BuildContext context) {
    dynamic getPersonId = widget.personId + widget.userId;
    dynamic getUserId = widget.userId + widget.personId;

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
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: chatData.length,
                itemBuilder: (context, index) => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: chatData[index]['message'].length,
                    itemBuilder: (context, messageIndex) => Column(
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            chatData[index]['id'] == getPersonId
                                ? ChatCard(
                                    topLeft: 0,
                                    topRight: 20,
                                    bottomLeft: 20,
                                    bottomRight: 20,
                                    message: chatData[index]['message']
                                        [messageIndex]['chat'],
                                    //  messageTime: ""
                                    // DateTime(chatData[index]['message']
                                    //     [messageIndex]['dateTime']),
                                    // messageTime: chatData[index]['message']
                                    //         [messageIndex]['dateTime']
                                    //     .toString(),
                                  )
                                : chatData[index]['id'] == getUserId
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 80),
                                        child: ChatCard(
                                          topLeft: 20,
                                          topRight: 0,
                                          bottomLeft: 20,
                                          bottomRight: 20,
                                          message: chatData[index]['message']
                                              [messageIndex]['chat'],
                                          // messageTime: chatData[index]['message']
                                          //         [messageIndex]['dateTime']
                                          //     .toString(),
                                        ),
                                      )
                                    : SizedBox()
                          ],
                        ),
                      ],
                    ),
                  ),
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
                      dynamic id = widget.userId + widget.personId;
                      //dynamic chatData = await getMessage();
                      print(chatData);
                      //print(await getMessage());
                      //dynamic messagechatData = chatData?[0]['message'];
                      //print(chatData);

                      addMessage(
                        id: widget.userId.toString() +
                            widget.personId.toString(),
                        participant1Id: widget.userId.toString(),
                        participant1Name: widget.userName.toString(),
                        participant2Id: widget.personId.toString(),
                        participant2Name: widget.personName.toString(),
                        message: [
                          ...chatData[0]['message'],
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
