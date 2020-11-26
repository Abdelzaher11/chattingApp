import 'package:chatting_messenger/home.dart';
import 'package:chatting_messenger/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
var isUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if(FirebaseAuth.instance.currentUser != null) {
    isUser = true;
  }
  runApp(MyApp(isUser));
}
class MyApp extends StatelessWidget {
  bool isUser;
  MyApp(this.isUser);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isUser ?Home():Register(),
    );
  }
}

