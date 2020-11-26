import 'package:chatting_messenger/profile.dart';
import 'package:chatting_messenger/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics() ,
        child: Column(
          children: <Widget>[
            //title
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0,),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Divider(height: 1.0,color: Colors.grey[400],),
            //profile
            SizedBox(height: 15.0,),
            Divider(height: 1,color: Colors.grey[300],),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context)=>Profile(FirebaseAuth.instance.currentUser.uid),
                ));
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.0,),
                          Text(
                            'Status',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 1,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 16.0,
                        backgroundColor: Colors.grey[100],
                        child: Icon(
                          Icons.scanner,
                          color: Colors.blue[400],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                  ],
                ),
              ),
            ),
            Divider(height: 1,color: Colors.grey[300],),
            SizedBox(height: 15.0,),
            //starred
            Divider(height: 1,color: Colors.grey[400],),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.stars,
                      color: Colors.yellow,
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Starred Messages',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1,color: Colors.grey[400],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //web
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0,right: 8.0,left: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.laptop,
                      color: Colors.green,
                      size: 28,
                    ),
                    SizedBox(width: 5.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                ' WhatsApp Web/Desktop',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1,color: Colors.grey[400],),
            SizedBox(height: 15.0,),
            //acc,chats,not and data
            Divider(height: 1,color: Colors.grey[400],),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.vpn_key,
                      color: Colors.blue[800],
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Account',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1,color: Colors.grey[400],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble,
                      color: Colors.green,
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Chats',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1,color: Colors.grey[400],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.notifications,
                      color: Colors.red,
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Notification',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1,color: Colors.grey[400],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.compare_arrows,
                      color: Colors.green,
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Data and Storage Usage',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1,color: Colors.grey[400],),
            SizedBox(height: 15.0,),
            //help and tell
            Divider(height: 1,color: Colors.grey[400],),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.info,
                      color: Colors.blue[800],
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Help',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1,color: Colors.grey[400],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 28,
                    ),
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Tell a Friend',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.grey[400],
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(height: 1,color: Colors.grey[400],),
            SizedBox(height: 30.0,),
            Text(
              'from',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 3,),
            Text(
              'Facebook',
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.0,),
            //sign out
            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>Register(),
                  ));
                }).catchError((e){print('errorrr!!!!!');});
              },
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.info,
                        color: Colors.blue[800],
                        size: 28,
                      ),
                      SizedBox(width: 8.0,),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  'sign out',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(flex: 1,),
                                Icon(
                                  Icons.logout,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Divider(height: 1,color: Colors.grey[400],),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
