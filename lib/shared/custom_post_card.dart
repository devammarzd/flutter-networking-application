import 'package:flutter/material.dart';
import 'package:flutter_networking_app/screens/editpost.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => EditPostScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                          TextSpan(text: "Post ID:"),
                          TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                              text: " 10")
                        ])),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                              children: [
                            TextSpan(
                              text: "Title:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            TextSpan(
                              text: " Post Title",
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
                              text: "Body:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text:
                                    "This is the body of the post xyz 123 xyz 123")
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
