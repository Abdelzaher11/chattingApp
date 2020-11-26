import 'package:chatting_messenger/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  var currentindex = 0;
  var userList=[];
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.blue[400],
              ),
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white70,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(
              Icons.sms,
              color: Colors.blue[400],
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Chats',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[300],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15.0,
                    ),
                    CircleAvatar(
                      radius: 16.0,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.restore_from_trash,
                        size: 28.0,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Archived Chats',
                      style: TextStyle(
                        color: Colors.blue[500],
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Number',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Broadcast Lists',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent[100],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Text(
                      'New Group',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent[100],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 3.0,
              ),
              ListView.builder(
                itemCount: userList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => List(context,userList[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget List(context,users) => GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=> Message(user:users),
      ));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        users['user_name'],
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.done_all,
                          color: Colors.grey[400],
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          'Message',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Divider(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  void getData(){
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.snapshots().listen((event) async {
      userList = await event.docs;
      setState(() {

      });
    });
  }
}
