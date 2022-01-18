import 'package:flutter/material.dart';
import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:flutter_networking_app/services/services.dart';
import 'package:flutter_networking_app/shared/shared_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateUserScreen extends StatefulWidget {
  static String id = "create";

  @override
  _CreateUserScreenState createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  _createUser() async {
    if (_formKey.currentState!.validate()) {
      UserDetailModel userDetailModel = UserDetailModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
      );
      try {
        await ApiServices().createUser(userDetailModel);
        Fluttertoast.showToast(
            msg: "User Created!",
            textColor: Colors.white,
            backgroundColor: Colors.green[700]);
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
      } catch (e) {
        displayErrorDialog(context, content: e.toString());
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Create A User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 15, 11, 8),
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "First Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: firstNameController,
                                validator: (val) {
                                  return val!.isEmpty
                                      ? "Please Enter First Name"
                                      : null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter First Name",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Last Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              TextFormField(
                                controller: lastNameController,
                                validator: (val) {
                                  return val!.isEmpty
                                      ? "Please Enter Last Name"
                                      : null;
                                },
                                decoration: InputDecoration(
                                    hintText: "Enter Last Name",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Email Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (val) {
                            return val!.isEmpty ? "Please Enter Email" : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Enter Email Address",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 60),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          _createUser();
                        },
                        child: Text(
                          "CREATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
