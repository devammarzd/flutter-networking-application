import 'package:flutter/material.dart';
import 'package:flutter_networking_app/screens/home.dart';
import 'package:flutter_networking_app/screens/addpost.dart';
import 'package:flutter_networking_app/screens/editpost.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        AddPostScreen.id: (context) => AddPostScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        EditPostScreen.id: (context) => EditPostScreen(),
      },
    );
  }
}
