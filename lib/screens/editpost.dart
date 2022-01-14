import 'package:flutter/material.dart';

class EditPostScreen extends StatefulWidget {
  static String id = "editpost";

  const EditPostScreen({Key? key}) : super(key: key);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
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
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: TextEditingController(),
                    validator: (val) {
                      return null;
                    },
                    keyboardType: TextInputType.name,
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
                    obscureText: true,
                    controller: TextEditingController(),
                    validator: (val) {
                      return null;
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
                  controller: TextEditingController(),
                  validator: (val) {
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: "Enter Body",
                      prefixIcon: Icon(Icons.dehaze_outlined),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {},
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
    );
  }
}
