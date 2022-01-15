import 'package:flutter/material.dart';
import 'package:flutter_networking_app/screens/editpost.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:flutter_networking_app/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

///A Custom Post Widget to display in the UI
class CustomPostWidget extends StatelessWidget {
  final PostModel postModel;
  const CustomPostWidget({required this.postModel});
  deletePost() async {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => EditPostScreen(postToUpdate: postModel)));
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
                          TextSpan(text: "Post ID: "),
                          TextSpan(
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                              text: postModel.id)
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
                              text: "Title: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent),
                            ),
                            TextSpan(
                              text: postModel.title,
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
                              text: "Body: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: postModel.body)
                          ])),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                  onPressed: () async {
                    try {
                      await ApiServices().deletePost(postModel.id);
                      Fluttertoast.showToast(
                          msg: "Post Deleted!",
                          backgroundColor: Colors.blue,
                          textColor: Colors.white);
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Error Occured"),
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Ok"))
                              ],
                            );
                          });
                    }
                  },
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
