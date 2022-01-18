import 'package:flutter/material.dart';
import 'package:flutter_networking_app/screens/edit_user.dart';
import 'package:flutter_networking_app/screens/user_details.dart';

///A Custom Profile Widget to display in the UI of all users screen
class CustomProfileWidget extends StatelessWidget {
  const CustomProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => UserDetailsScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.network(
                "https://randomuser.me/api/portraits/med/women/28.jpg",
                height: MediaQuery.of(context).size.width * .15,
                width: MediaQuery.of(context).size.width * .15,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 3, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.normal),
                            children: [
                          TextSpan(text: "ID:"),
                          TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                              text: " 60d0fe4f5311236168a109cc")
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              children: [
                            TextSpan(
                              text: "Title: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            TextSpan(
                              text: "Ms",
                            )
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              children: [
                            TextSpan(
                              text: "First Name: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Sara")
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                              children: [
                            TextSpan(
                              text: "Last Name: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "Jane")
                          ])),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.all(10),
                  splashRadius: 20,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
