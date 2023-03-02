import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/contact_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/firestoredata.dart';
import 'message_screen.dart';
import '../widgets/navigationbutton.dart';

import 'package:fluttertoast/fluttertoast.dart';

dynamic name, email, password, confirmPassword;

// TextEditingController email = TextEditingController();
// TextEditingController password = TextEditingController();
// TextEditingController confirmpassword = TextEditingController();
class CommonPage extends StatefulWidget {
  final bool event;
  final String buttonName;

  const CommonPage({
    Key? key,
    required this.event,
    required this.buttonName,
  }) : super(key: key);

  @override
  State<CommonPage> createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 300,
                    width: 100,
                    child: Image(
                      image: AssetImage("assets/images/flash.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
               widget.event == true?SizedBox(
                height: 60,
                width: 300,
                child: TextFormField(
                  //controller: email,
               //   keyboardType: TextInputType.emailAddress,
                  decoration: textFieldDecorationName,
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ):Container(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    //controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: textFieldDecorationEmail,
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    decoration: textFieldDecorationPassword,
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                ),
              ),
              widget.event == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: TextFormField(
                          obscureText: true,
                          decoration: textFieldDecorationConfirmPassword,
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: NavigationButton(
                  name: widget.buttonName,
                  onPress: () async {
                    try {
                      if (widget.event == true) {
                        print('register');
                        if (password == confirmPassword) {
                          addData(name, email, password);
                          Navigator.pushNamed(context, 'login_screen');
                        } else {
                          Fluttertoast.showToast(
                              msg: "ConfirmPassword don't Match",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.orangeAccent.shade200,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      } else {
                        dynamic data = await getUserData();
                        for (var i = 0; i <= data.length; i++) {
                          if (data[i]['email'] == email &&
                              data[i]['password'] == password) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MessageScreen(loginEmail: data[i]['email'],userId: data[i]["id"],userName: data[i]['name'],),
                                  // ContactScreen(
                                  //   loginEmail: data[i]['email'],
                                  // ),
                                ));
                            break;
                          } else {
                            Fluttertoast.showToast(
                                msg: "Check Email and Password....",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                //backgroundColor: Colors.orangeAccent.shade200,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
