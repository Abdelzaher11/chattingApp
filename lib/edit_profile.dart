import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  Map data;
  var id;
  var file;
  var editNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        onPressed: (){},
                        child: Text(
                          'Save',
                        ),
                      ),
                    ],
                  ),
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
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          //nameField
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
        ],
      ),
    );
  }
}
