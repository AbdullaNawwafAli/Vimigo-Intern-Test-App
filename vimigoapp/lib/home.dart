// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userVal = '';
  String phoneVal = '';
  String timez = '';

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
              
            ]
          ),
        ),

      )
    );
  }
}