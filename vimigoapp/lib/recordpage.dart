import 'package:flutter/material.dart';


class TheRecord extends StatelessWidget {
  final String itemUser;
  final String itemPhone;
  final String itemCheck;

                    

  TheRecord(this.itemUser,this.itemPhone,this.itemCheck);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Selected Record'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/Thorfinn.jpg'),
                  radius: 50.0,
                ),
              ),
              Divider(
              height: 60.0,
              color: Colors.amber[800],
              ),
              Text(
                 'User',
                 style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  )
                 ),
              SizedBox(height:10.0),
              Text(
                 '$itemUser',
                 style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  )
                 ),
                 SizedBox(height:30.0),
                 Text(
                 'Phone Number',
                 style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  )
                 ),
                SizedBox(height:10.0),
                Text(
                 '$itemPhone',
                 style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  )
                 ),
                 SizedBox(height:30.0),
                
                Text(
                 'Check-in',
                 style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                  )
                 ),
              SizedBox(height:10.0),
              Text(
                 '$itemCheck',
                 style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  )
                 ),
                 SizedBox(height:30.0),
            ]
        ),
      ),
    );
  }
}