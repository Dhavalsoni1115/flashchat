import 'package:flashchat/screens/firestoredata.dart';
import 'package:flashchat/screens/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    chatData();
    super.initState();
  }

  List<dynamic> data = [];
  Future<dynamic> chatData() async {
    List<dynamic> data1 = await getData();
    setState(() {
      data =data1;
    });
   
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flash Chat',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade200,
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => 
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(),
                    )),
                child: data != null
                    ? Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(15),
                        height: 70,
                        width: double.infinity,
                        color: Colors.orangeAccent.shade200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[index]['email'],
                              style: TextStyle(fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        ),
                      )
                    : SpinKitSpinningLines(
                        color: Colors.black,
                        size: 250.0,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
