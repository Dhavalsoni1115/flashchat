import 'package:flashchat/screens/chat_screen.dart';
import 'package:flashchat/screens/commonpage.dart';
import 'package:flashchat/screens/message_screen.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      //initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        'login_screen': (context) =>
            const CommonPage(event: false, buttonName: 'Login'),
        'register_screen': (context) =>
            const CommonPage(event: true, buttonName: 'Register'),
        // 'chat_screen': (context) => ChatScreen(loginEmail: ,),
      },
    );
  }
}
