// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userVal = '';
  String phoneVal = '';
  String timez = '';

  CollectionReference db = FirebaseFirestore.instance.collection('Users');

  String formatTheTime(){
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        title: Text('Vimigo Check-In App'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Username',
                style: TextStyle(color: Colors.grey,letterSpacing: 2.0,)
              ),
              SizedBox(height:10.0),
              TextField(
                onChanged: (value){
                    userVal = value;
                    },
                decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Username',
                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                              ),
                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                              ),
                            ),
              ),
              SizedBox(height:10.0),
              Text(
                'Phone Number',
                style: TextStyle(color: Colors.grey,letterSpacing: 2.0,)
              ),
              SizedBox(height:10.0),
              TextField(
                onChanged: (value){
                    phoneVal = value;
                    },
                decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Phone Number',
                contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                              ),
                enabledBorder: UnderlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.white),
                                  borderRadius: new BorderRadius.circular(25.7),
                              ),
                            ),
              ),
              Divider(
              height: 60.0,
              color: Colors.amber[800],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async{
                        timez = formatTheTime();
                        if (userVal.length > 0 && phoneVal.length > 0){
                          Fluttertoast.showToast(
                            msg: 'User Added!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        }
                        else if(userVal.length > 0 && phoneVal.length == 0){
                          Fluttertoast.showToast(
                            msg: 'phone number is empty!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        }
                        else if(userVal.length == 0 && phoneVal.length > 0){
                          Fluttertoast.showToast(
                            msg: 'Name is empty!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        }
                        else{
                          Fluttertoast.showToast(
                          msg: 'Both fields is empty!',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0);
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.lightBlue,
                      ),
                      icon: Icon(Icons.check_box), 
                      label: Text ('Check-in')
                  ),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recordlistpage');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.lightBlue,
                      ),
                      icon: Icon(Icons.list), 
                      label: Text ('Open Record List')
                  ),
                ],
                ),
            ],
          ),
        ),

      )
    );
  }
}