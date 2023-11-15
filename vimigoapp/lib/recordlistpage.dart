// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vimigoapp/recordpage.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordList extends StatefulWidget {
  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  String SearchVal = "";
  bool istime = true;
  final stuff =  FirebaseFirestore.instance.collection('Users').orderBy('check-in',descending:true).snapshots();
  late ScrollController _controller ;

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      Fluttertoast.showToast(
                  msg: 'Reached the bottom!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      Fluttertoast.showToast(
                  msg: 'Reached the top!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0);
    }
 }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

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

      body: StreamBuilder(
        stream: stuff , 
        builder: (context, snapshot){
          if (snapshot.hasError){
            return const Text('connection error');
          }
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Text('loading');
          }

          var docs = snapshot.data!.docs;

          String getdate(var docs,int index){
            final DateTime currentTime = DateTime.now();
            String displayString = "";
                    
                    
            DateTime tempDate = new DateFormat('yyyy-MM-dd hh:mm:ss').parse(docs[index]['check-in']) ;
                    
            final timeDiff = currentTime.difference(tempDate);

                    

            final days = timeDiff.inDays; // find the num of days
            final hours = timeDiff.inHours % 24; // find the num of hours ago
            final minutes = timeDiff.inMinutes % 60; // find the num of mins ago
            final seconds = timeDiff.inSeconds % 60; // find the num of seconds
            displayString = (days > 0 ? days.toString() + "d " : "") +
                            (hours > 0 ? hours.toString() + "hr " : "") +
                            (minutes > 0 ? minutes.toString() + "min " : "") +
                            (seconds > 0 ? seconds.toString() + "s " : "") +
                            "ago";
            return displayString;
          }
                    
                    
                    
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              controller: _controller,
              itemCount: docs.length, 
              itemBuilder: (context,index){
                if (SearchVal.isEmpty){
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25))
                      ),
                    tileColor: Colors.blue[300],
                    title: Text(docs[index]['user']),
                    subtitle: Text(docs[index]['phone']),
                    trailing: istime ? ( Text( getdate(docs,index)) ) : Text(docs[index]['check-in']),
<<<<<<< HEAD
                    onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => TheRecord(docs[index]['user'],docs[index]['phone'],getdate(docs,index))));
                      
                    },
=======
                
>>>>>>> 241ba5ffc28252a8dcc103a8a400f694412d5345
                  );
                }
                if (docs[index]['user'].toLowerCase().startsWith(SearchVal.toLowerCase())){
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))
                        ),
                      tileColor: Colors.blue[300],
                      title: Text(docs[index]['user']),
                      subtitle: Text(docs[index]['phone']),
                      trailing: istime ? ( Text( getdate(docs,index)) ) : Text(docs[index]['check-in']),
<<<<<<< HEAD
                      onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => TheRecord(docs[index]['user'],docs[index]['phone'],getdate(docs,index))));
                      
                      },
=======
>>>>>>> 241ba5ffc28252a8dcc103a8a400f694412d5345
                  );
                
                }
                else if (docs[index]['phone'].toLowerCase().startsWith(SearchVal.toLowerCase())){
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))
                        ),
                      tileColor: Colors.blue[300],
                      title: Text(docs[index]['user']),
                      subtitle: Text(docs[index]['phone']),
                      trailing: istime ? ( Text( getdate(docs,index)) ) : Text(docs[index]['check-in']),
<<<<<<< HEAD
                      onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => TheRecord(docs[index]['user'],docs[index]['phone'],getdate(docs,index))));
                      
                      },
=======
                      
>>>>>>> 241ba5ffc28252a8dcc103a8a400f694412d5345
                  );
                }
                else{
                    return Container();
                }
                          
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
                      
                        
            ),
          );
        },
                  
      )
    );
  }
}