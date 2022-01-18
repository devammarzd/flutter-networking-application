import 'package:flutter/material.dart';
import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/screens/all_users.dart';
import 'package:flutter_networking_app/screens/create_user.dart';
import 'package:flutter_networking_app/screens/edit_user.dart';

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
        primaryColor: primaryColor,
      ),
      initialRoute: AllUsersScreen.id,
      routes: {
        CreateUserScreen.id: (context) => CreateUserScreen(),
        AllUsersScreen.id: (context) => AllUsersScreen(),
      },
    );
  }
}
