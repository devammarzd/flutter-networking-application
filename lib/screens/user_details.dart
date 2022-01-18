import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_networking_app/screens/edit_user.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:flutter_networking_app/services/services.dart';
import 'package:flutter_networking_app/shared/custom_detail_container.dart';
import 'package:flutter_networking_app/shared/shared_functions.dart';
import 'package:intl/intl.dart';

class UserDetailsScreen extends StatefulWidget {
  ///we only need user ID from the previous screen because
  ///this user ID will be used in the API URL to fetch the details of the user associated with the user id
  final String userId;
  const UserDetailsScreen({required this.userId});

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  UserDetailModel? userDetailModel;
  getUserDetails() async {
    try {
      UserDetailModel _userDetail =
          await ApiServices().getUserDetailsById(widget.userId);

      setState(() {
        userDetailModel = _userDetail;
      });
    } catch (e) {
      ///Display any error dialog/toast/snackbar of your choice.
      displayErrorDialog(context, content: e.toString());
    }
  }

  String formatDateOfBirth(DateTime dob) {
    final customFormat = DateFormat('MMM d, yyyy');

    return customFormat.format(dob);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditUserScreen(
                          userDetailModelToEdit: userDetailModel!,
                        )));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: userDetailModel != null
          ? SingleChildScrollView(
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
                                  userDetailModel!.picture,
                                  height:
                                      MediaQuery.of(context).size.width * 0.20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.20,
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: VerticalDivider(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "${userDetailModel!.title}. ${userDetailModel!.firstName} ${userDetailModel!.lastName}",
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
                                      title: "Email",
                                      detail: userDetailModel!.email),
                                  CustomDetailContainer(
                                      title: "Date Of Birth",
                                      detail: formatDateOfBirth(
                                          userDetailModel!.dateOfBirth!)),
                                  CustomDetailContainer(
                                      title: "Gender",
                                      detail: userDetailModel!.gender),
                                  CustomDetailContainer(
                                      title: "Phone",
                                      detail: userDetailModel!.phone),
                                  // CustomDetailContainer(
                                  //   title: "Address",
                                  //   detail:
                                  //       "A-1 Street, XYZ Block, ABC City, yewed,dewd, wedew",
                                  // ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
