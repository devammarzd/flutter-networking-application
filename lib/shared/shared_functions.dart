import 'package:flutter/material.dart';

displayErrorDialog(BuildContext context, {required String content}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Error Occured"),
          content: Text(content),
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
