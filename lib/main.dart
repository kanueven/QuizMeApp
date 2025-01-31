import 'package:flutter/material.dart';
import 'package:quizapp/data/objectbox.dart';
import 'package:quizapp/screens/homescreen.dart';




 late final Objectbox objectbox;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  objectbox = await Objectbox.create();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}