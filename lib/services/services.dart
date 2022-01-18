import 'dart:convert';

import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:http/http.dart' as http;

///API Services class contains all the functions related to API calls
class ApiServices {
  ///This api call fetches single user from the server and returns a UserModel.
  Future<UserDetailModel> getUserDetailsById(String id) async {
    String apiEndPoint = baseUrl + "/user/$id";
    try {
      //Get Request execution with app-id in headers
      http.Response response =
          await http.get(Uri.parse(apiEndPoint), headers: {"app-id": appId});
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200) {
        //converts json string i.e response.body into dynamic object
        dynamic dynamicObject = JsonDecoder().convert(response.body);
        print(dynamicObject);
        //converting data into model
        UserDetailModel userDetailModel =
            UserDetailModel.fromMap(dynamicObject);

        return userDetailModel;
      } else
        throw Exception(["Error: ${response.statusCode} status code."]);
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call fetches all the users from the server and returns a list of UserModel.
  Future<List<UserModel>> getAllUsers() async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/user";
    try {
      //Get Request execution
      http.Response response =
          await http.get(Uri.parse(apiEndPoint), headers: {"app-id": appId});
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200) {
        //converts json string i.e response.body into dynamic object
        dynamic dynamicObject = JsonDecoder().convert(response.body);
        dynamic allData = dynamicObject["data"];
        List<UserModel> allUsers = [];
        for (var data in allData) {
          //converting api response data into models
          UserModel userMode = UserModel.fromMap(data);
          allUsers.add(userMode);
        }
        return allUsers;
      } else
        throw Exception(["Error: ${response.statusCode} status code."]);
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call creates a user
  Future createUser(UserDetailModel userModel) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/user/create";

    try {
      Map<String, dynamic> mapbody = userModel.toMapForCreatingUser();
      //POST Request execution
      http.Response response = await http.post(Uri.parse(apiEndPoint),
          body: mapbody, headers: {"app-id": appId});

      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("New User Created!");
        print(response.body);
      } else {
        throw Exception(["Error: ${response.statusCode} status code."]);
      }
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call updates the User
  Future updateUser(
      {required Map<String, dynamic> body, required String id}) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/user/$id";

    try {
      //PUT Request execution
      http.Response response = await http
          .put(Uri.parse(apiEndPoint), body: body, headers: {"app-id": appId});
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("User Updated!");
        print(response.body);
      } else {
        throw Exception(["Error: ${response.statusCode} status code."]);
      }
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call Deletes the user by the given id
  Future deleteUser(String id) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/user/$id";

    try {
      //DELETE Request execution
      http.Response response =
          await http.delete(Uri.parse(apiEndPoint), headers: {"app-id": appId});
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("User Deleted!");
        print(response.body);
      } else {
        throw Exception(["Error: ${response.statusCode} status code."]);
      }
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }
}
