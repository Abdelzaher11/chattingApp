import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message extends StatefulWidget {
  Message({this.user});

  final QueryDocumentSnapshot user;

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  var messageController = TextEditingController();
  List messageList=[];
  CollectionReference chats;
  var id;
  @override
  void initState() {
    getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.user['user_name']),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Lists(context,messageList[index]),
              itemCount: messageList.length,
            ),
          ),
          Container(
            height: 60.0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey[200],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: 'send message',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.teal,
                    onPressed:(){
                      sendMessage(messageController.text);
                    },
                    child: Icon(
                      Icons.send,
                      color:Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Lists(context,messages) => Align(
    alignment: messages['senderId'] == id ? Alignment.centerRight : Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${messages['message']}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '12:00',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
  sendMessage(message) async {
    chats = await FirebaseFirestore.instance.collection('chats/$id/${widget.user['uId']}');
    CollectionReference chats2 =  await FirebaseFirestore.instance.collection('chats/${widget.user['uId']}/$id');
    chats.add({
      'message':message,
      'senderId':id,
    }).then((value)
    {
      chats.doc(value.id).update({
        'messageId':value.id,
      }).then((value)
      {
        chats2.add({
          'message':message,
          'senderId':id,
        }).then((value)
        {
          print('send successfully');
          messageController..text = '';
        }).catchError((e)
        {
          print(e.toString());
          print('send error+++++++++++++++++!!!!!!!!!!!!!!!!!!!!!!!!!');
        });
      });

      print('send successfully');

    }).catchError((e)
    {
      print(e.toString());
      print('send error+++++++++++++++++');
    });
  }
  void getMessages() async
  {
    await SharedPreferences.getInstance().then((value)
    async {
      id = value.getString('userID');

      chats = await FirebaseFirestore.instance.collection('chats/$id/${widget.user['uId']}');

      chats.snapshots().listen((value)
      {
        print(value.docs);
        print('!!!!!!!!!!!value error!!!!!!!!!!!!!!!');
        messageList = value.docs;

        setState(() {

        });
      });
    });
  }
}
