import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_networking_app/screens/edit_user.dart';
import 'package:flutter_networking_app/shared/custom_detail_container.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => EditUserScreen()));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.network(
                            "https://randomuser.me/api/portraits/med/women/28.jpg",
                            height: MediaQuery.of(context).size.width * 0.20,
                            width: MediaQuery.of(context).size.width * 0.20,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.20,
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: VerticalDivider(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Ms. Sara Jane",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12),
                        child: Column(
                          children: [
                            CustomDetailContainer(
                                title: "Email", detail: "sara@email.com"),
                            CustomDetailContainer(
                                title: "Date Of Birth",
                                detail: "12th Jan 1998"),
                            CustomDetailContainer(
                                title: "Gender", detail: "Female"),
                            CustomDetailContainer(
                                title: "Phone", detail: "+92309090900"),
                            CustomDetailContainer(
                              title: "Address",
                              detail:
                                  "A-1 Street, XYZ Block, ABC City, yewed,dewd, wedew",
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
