import 'package:flutter/material.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:flutter_networking_app/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPostScreen extends StatefulWidget {
  static String id = "editpost";
  final PostModel? postToUpdate;
  const EditPostScreen({required this.postToUpdate});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  TextEditingController idController = TextEditingController();

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _updatePost() async {
    if (_formKey.currentState!.validate()) {
      PostModel postModel = PostModel(
          body: bodyController.text,
          id: idController.text,
          title: titleController.text,
          userId: widget.postToUpdate!.userId);
      try {
        await ApiServices().updatePost(postModel);
        Fluttertoast.showToast(
            msg: "Post Updated!",
            textColor: Colors.white,
            backgroundColor: Colors.green[700]);
        bodyController.clear();
        idController.clear();
        titleController.clear();
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
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    idController.text = widget.postToUpdate!.id;
    titleController.text = widget.postToUpdate!.title;
    bodyController.text = widget.postToUpdate!.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Edit A Post"),
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
                      controller: idController,
                      validator: (val) {
                        return val!.isEmpty ? "Please enter ID" : null;
                      },
                      keyboardType: TextInputType.number,
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
                        return val!.isEmpty ? "Please enter title" : null;
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
                      return val!.isEmpty ? "Please enter body" : null;
                    },
                    maxLines: 5,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Enter Body",
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
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          _updatePost();
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
