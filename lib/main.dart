import 'package:flutter/material.dart';
import 'package:quizapp/data/objectbox.dart';
import 'package:quizapp/screens/homescreen.dart';
import 'dart:developer' as developer;

late Objectbox objectbox;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
  objectbox = await Objectbox.create();
    developer.log("ObjectBox initialized successfully"); // Debug print
  } catch (e) {
    developer.log("Failed to initialize ObjectBox: $e"); // Debug print
  }
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