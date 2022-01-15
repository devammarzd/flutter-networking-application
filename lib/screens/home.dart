import 'package:flutter/material.dart';
import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/screens/addpost.dart';
import 'package:flutter_networking_app/shared/custom_post_widget.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Posts"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddPostScreen.id);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (_, i) {
              return CustomPostWidget();
            },
            separatorBuilder: (_, i) {
              return Divider(color: primaryColor);
            },
          ),
        ));
  }
}
