import 'package:chatting_messenger/home.dart';
import 'package:chatting_messenger/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter username',
                      ),
                    ),
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
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: (){
                        CreateUser(userNameController.text, emailController.text, passwordController.text);
                      },
                    ),
                    SizedBox(height: 15.0,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>LogIn(),
                        ));
                      },
                      child: Text(
                        'already have an account',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
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
  void CreateUser(username,email,password){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      AddUser(username,email, value.user.uid);
      print('CreateUser done');
    }).catchError((e){
      print('createUser error');
      print('$e');
    });
  }

  void AddUser(username,email, uId) async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uId).set({
      'user_name':username,
      'email':email,
      'image':'',
    }).then((value) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('userId', uId).then((value){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>Home(),
        ));
        print('addUser done');
      }).catchError((e){
        print('addUser error');
        print('$e');
      });
    });
  }

}
