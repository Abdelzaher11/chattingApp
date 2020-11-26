import 'package:chatting_messenger/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.teal,width: 1.0,style: BorderStyle.solid,),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding:  EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    FlatButton(
                      color: Colors.teal,
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        LogInUser(emailController.text, passwordController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void LogInUser(email,password){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('userId', value.user.uid).then((value) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Home(),
        ));
      }).catchError((e){
        print('$e');
        print('shared failed');
      });
    }).catchError((e){
      print('$e');
      print('LogIn failed');
    });
  }
}
