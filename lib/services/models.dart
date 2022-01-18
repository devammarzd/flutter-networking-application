class UserModel {
  String title, firstName, lastName, id, picture;

  UserModel(
      {this.title = "",
      this.firstName = "",
      this.lastName = "",
      this.id = "",
      this.picture = ""});

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
      lastName: data["lastName"].toString(),
      id: data["id"].toString(),
      firstName: data["firstName"],
      title: data["title"],
      picture: data["picture"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": firstName,
        "userId": lastName,
      };
}

class UserDetailModel {
  String title, firstName, lastName, id, picture, gender, email, phone;
  DateTime? dateOfBirth;
  UserDetailModel(
      {this.title = "",
      this.firstName = "",
      this.lastName = "",
      this.id = "",
      this.picture = "",
      this.gender = "",
      this.email = "",
      this.phone = "",
      this.dateOfBirth});

  factory UserDetailModel.fromMap(Map<String, dynamic> data) => UserDetailModel(
      lastName: data["lastName"].toString(),
      id: data["id"].toString(),
      firstName: data["firstName"],
      title: data["title"],
      picture: data["picture"],
      gender: data["gender"],
      email: data["email"],
      phone: data["phone"],
      dateOfBirth: DateTime.parse(data["dateOfBirth"]));

  ///This function is only for the purpose of creating user.
  ///This function converts the model's data into Map<String,dynamic> and returns it.
  ///it is mainly used to pass as the body of any API request
  Map<String, dynamic> toMapForCreatingUser() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}
