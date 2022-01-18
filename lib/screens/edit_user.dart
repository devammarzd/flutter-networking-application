import 'package:flutter/material.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:flutter_networking_app/services/services.dart';
import 'package:flutter_networking_app/shared/shared_functions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditUserScreen extends StatefulWidget {
  static String id = "edit";

  ///We need userdetailmodel from in this screen so that we can assignthe values to the text editing controllers.
  final UserDetailModel userDetailModelToEdit;
  const EditUserScreen({required this.userDetailModelToEdit});

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String firstName = "", lastName = "", phone = "", gender = "";

  editUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        Map<String, dynamic> updateBody = {};

        ///If the following strings has any value, then we will add the key value pair to the updateBody
        if (firstName.isNotEmpty) {
          updateBody["firstName"] = firstName;
        }
        if (lastName.isNotEmpty) {
          updateBody["lastName"] = lastName;
        }
        if (phone.isNotEmpty) {
          updateBody["phone"] = phone;
        }
        if (gender.isNotEmpty) {
          updateBody["gender"] = gender;
        }
        print("Final Update Body for PUT Request is $updateBody");
        if (updateBody.isNotEmpty) {
          await ApiServices().updateUser(
              body: updateBody, id: widget.userDetailModelToEdit.id);
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "User Updated!",
              textColor: Colors.white,
              backgroundColor: Colors.green[700]);
        } else {
          print("Nothing to edit");
        }
      } catch (e) {
        displayErrorDialog(context, content: e.toString());
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text = widget.userDetailModelToEdit.firstName;
    lastNameController.text = widget.userDetailModelToEdit.lastName;
    phoneController.text = widget.userDetailModelToEdit.phone;
    genderController.text = widget.userDetailModelToEdit.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Edit A User"),
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
                                onChanged: (val) {
                                  firstName = val;
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
                                onChanged: (val) {
                                  lastName = val;
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
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        TextFormField(
                          controller: phoneController,
                          validator: (val) {
                            return val!.isEmpty ? "Please Enter Phone" : null;
                          },
                          onChanged: (val) {
                            phone = val;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter Phone Number",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      TextFormField(
                        controller: genderController,
                        validator: (val) {
                          return val!.isEmpty ? "Please Enter Gender" : null;
                        },
                        onChanged: (val) {
                          gender = val;
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: "Enter Gender",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ))),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 60),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () async {
                          await editUser();
                        },
                        child: Text(
                          "EDIT",
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
