import 'dart:convert';

import 'package:flutter_networking_app/constants.dart';
import 'package:flutter_networking_app/services/models.dart';
import 'package:http/http.dart' as http;

///API Services class contains all the functions related to API calls
class ApiServices {
  ///This api call fetches single post from the server and returns a PostModel.
  Future<PostModel> getSinglePost(String id) async {
    String apiEndPoint = baseUrl + "/posts/$id";
    try {
      //Get Request execution
      http.Response response = await http.get(
        Uri.parse(apiEndPoint),
      );
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200) {
        //converts json string i.e response.body into dynamic object
        dynamic jsonData = JsonDecoder().convert(response.body);
        //converting data into model
        PostModel postModel = PostModel.fromJson(jsonData);

        return postModel;
      } else
        throw Exception(["Error: ${response.statusCode} status code."]);
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call fetches all the posts from the server and returns a list of PostModel.
  Future<List<PostModel>> getAllPosts() async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/posts";
    try {
      //Get Request execution
      http.Response response = await http.get(
        Uri.parse(apiEndPoint),
      );
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200) {
        //converts json string i.e response.body into dynamic object
        dynamic jsonData = JsonDecoder().convert(response.body);

        List<PostModel> allPosts = [];
        for (var data in jsonData) {
          //converting api response data into models
          PostModel postModel = PostModel.fromJson(data);
          allPosts.add(postModel);
        }
        return allPosts;
      } else
        throw Exception(["Error: ${response.statusCode} status code."]);
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call creates a post
  Future createPost(PostModel postModel) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/posts";

    try {
      Map<String, dynamic> mapbody = postModel.toJson();
      //POST Request execution
      http.Response response = await http.post(
        Uri.parse(apiEndPoint),
        body: mapbody,
      );
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("New Post Created!");
        print(response.body);
      } else {
        throw Exception(["Error: ${response.statusCode} status code."]);
      }
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call updates the post
  Future updatePost(PostModel postModel) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/posts/${postModel.id}";

    try {
      Map<String, dynamic> mapbody = postModel.toJson();
      //PUT Request execution
      http.Response response = await http.put(
        Uri.parse(apiEndPoint),
        body: mapbody,
      );
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Post Updated!");
        print(response.body);
      } else {
        throw Exception(["Error: ${response.statusCode} status code."]);
      }
    } catch (e) {
      //Exception Thrown should be handled on the front end UI. See the code where this fucntion has been called.
      throw e;
    }
  }

  ///This api call Deletes the post
  Future deletePost(String id) async {
    ///Api To Call
    String apiEndPoint = baseUrl + "/posts/$id";

    try {
      //DELETE Request execution
      http.Response response = await http.delete(
        Uri.parse(apiEndPoint),
      );
      //if status code is 200, then and only proceed further. Else Throw an error
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Post Deleted!");
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
