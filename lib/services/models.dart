class UserModel {
  String title, firstName, lastName, id, picture;

  UserModel(
      {this.title = "",
      this.firstName = "",
      this.lastName = "",
      this.id = "",
      this.picture = ""});
//A UserModel.fromMap() constructor, for constructing a new User instance from a map structure.
  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
      lastName: data["lastName"].toString(),
      id: data["id"].toString(),
      firstName: data["firstName"],
      title: data["title"],
      picture: data["picture"]);
//A toJson() method, which converts a User instance into a map.
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
  LocationModel? location;
  UserDetailModel(
      {this.title = "",
      this.firstName = "",
      this.lastName = "",
      this.id = "",
      this.picture = "",
      this.gender = "",
      this.email = "",
      this.phone = "",
      this.dateOfBirth,
      this.location});

  factory UserDetailModel.fromMap(Map<String, dynamic> data) => UserDetailModel(
      lastName: data["lastName"].toString(),
      id: data["id"].toString(),
      firstName: data["firstName"],
      title: data["title"],
      picture: data["picture"],
      gender: data["gender"],
      email: data["email"],
      phone: data["phone"],
      dateOfBirth: DateTime.parse(data["dateOfBirth"]),
      //For location, we are going to follow nested serialization
      location: LocationModel.fromMap(data["location"]));

  ///This function is only for the purpose of creating user.
  ///This function converts the model's data into Map<String,dynamic> and returns it.
  ///it is mainly used to pass as the body of any API request
  Map<String, dynamic> toMapForCreatingUser() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };
}

class LocationModel {
  String street, city, state, country, timezone;
  LocationModel(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.timezone});

  factory LocationModel.fromMap(Map<String, dynamic> data) => LocationModel(
      street: data["street"],
      city: data["city"],
      state: data["state"],
      country: data["country"],
      timezone: data["timezone"]);
}
