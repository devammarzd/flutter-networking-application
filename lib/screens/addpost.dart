import 'package:flutter/material.dart';
import 'package:flutter_networking_app/constants.dart';

class AddPostScreen extends StatefulWidget {
  static String id = "addPost";

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController idController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create A Post"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 8, 11, 8),
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      obscureText: false,
                      controller: idController,
                      validator: (val) {
                        return val!.isEmpty ? "Please Enter ID" : null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          labelText: "Enter ID",
                          prefixIcon: Icon(Icons.confirmation_number_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: titleController,
                      validator: (val) {
                        return val!.isEmpty ? "Please Enter Title" : null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Enter Title",
                          prefixIcon: Icon(Icons.post_add),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                    ),
                  ),
                  TextFormField(
                    controller: bodyController,
                    validator: (val) {
                      return val!.isEmpty ? "Please Enter Body" : null;
                    },
                    keyboardType: TextInputType.name,
                    maxLines: 5,
                    decoration: InputDecoration(
                        labelText: "Enter Body",
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ))),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
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
                  Expanded(
                    flex: 5,
                    child: Container(),
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
