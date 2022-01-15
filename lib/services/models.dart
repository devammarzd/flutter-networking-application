class PostModel {
  String title, body, id, userId;

  PostModel({this.title = "", this.body = "", this.userId = "", this.id = ""});

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"].toString(),
        id: json["id"].toString(),
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
