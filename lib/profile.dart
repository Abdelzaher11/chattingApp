import 'package:chatting_messenger/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile(this.uId);
  var uId;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState()  {
    getData();
    super.initState();
  }
  Map data;
  var id;
  var file;
  var editNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: data['user_name']!=null?Column(
          children: [
            //image&edit
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 250.0,
              child: SafeArea(
                child: Column(
                  children: [
                    //button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder:(context)=>Edit(),));
                          },
                          child: Text(
                            'Edit',
                          ),
                        ),
                      ],
                    ),
                    //image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.grey[100],
                          child: Icon(
                            Icons.person_outline_rounded,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    //name
                    Text(
                      data['user_name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: editNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 15.0,
                ),
                border: InputBorder.none,
                hintText: 'enter New Name',
              ),
            ),
            //Spacer(flex: 1,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: FlatButton(
                    color: Colors.teal,
                    onPressed: (){
                      updateInfo(editNameController.text);
                    },
                    child: Text(
                      'update',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ):Center(child: CircularProgressIndicator()),
      ),
    );
  }
  void getData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await SharedPreferences.getInstance().then((value) {
      id = value.getString('userId');
      users.doc(id).get().then((value){
        data = value.data();
        setState(() {

        });
        print('value error!!!!!!!!!!');
      }).catchError((e){
        print('$e');
        print('error found in data');
      });
    }).catchError((e){
      print('$e');
      print('error found');

    });
  }
  void updateInfo(name){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(id).update({
      'user_name': name,
    }).then((value) {
      getData();
    }).catchError((e){
      print('error!!!!!!!!!!!!!!!!!');
    });
  }
}
