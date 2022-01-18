import 'package:flutter/material.dart';
import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/screens/create_user.dart';
import 'package:flutter_networking_app/shared/custom_profile_widget.dart';

class AllUsersScreen extends StatefulWidget {
  static String id = "allUsers";

  const AllUsersScreen({Key? key}) : super(key: key);

  @override
  _AllUsersScreenState createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Users"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateUserScreen.id);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
          child: ListView.separated(
            itemCount: 20,
            itemBuilder: (_, i) {
              return CustomProfileWidget();
            },
            separatorBuilder: (_, i) {
              return Divider(color: primaryColor);
            },
          ),
        ));
  }
}
