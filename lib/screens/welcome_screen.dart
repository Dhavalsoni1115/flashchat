import 'package:flashchat/screens/firestoredata.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'navigationbutton.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // AnimationController? controller;
  // Animation? animation;
  @override
  void initState() {
    super.initState();
   // getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade100.withOpacity(controller!.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    width: 100,
                    child: Image(
                        image: AssetImage("assets/images/flash.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('FLASH CHAT'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: NavigationButton(
                  name: 'Login',
                  onPress: () {
                    print('loginwelcome');
                    Navigator.pushNamed(context, 'login_screen');
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: NavigationButton(
                  name: 'Register',
                  onPress: () {
                    print('welcomeregister');
                    Navigator.pushNamed(context, 'register_screen');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
