import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///A Custon Detail Container for display title and its detail
class CustomDetailContainer extends StatelessWidget {
  final String title, detail;
  CustomDetailContainer({required this.title, required this.detail});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 10),
              child: Text(
                detail,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
