import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordList extends StatefulWidget {
  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  String SearchVal = "";
  bool istime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Card(
          child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search....'
            ),
          onChanged:(val){
            setState(() {
                SearchVal = val;
                });
            }
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if (istime){
            istime = false;
          }
          else{
            istime = true;
          }
          });
        },
        child: Icon(Icons.hourglass_empty),
      ),

    );
  }
}