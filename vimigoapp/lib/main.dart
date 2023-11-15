import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vimigoapp/recordlistpage.dart';
import 'firebase_options.dart';
import 'package:vimigoapp/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home':(context) => Home(),
      '/recordlistpage':(context) => RecordList(),
    }
  )
  );
}

