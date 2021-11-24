import 'dart:convert';

List<Models> getListModels(String str)=>List<Models>.from(json.decode(str).map((x)=>Models.fromJson(x)));

class Models {
  final int? userId;
  final int? id;
  final String? title;

  Models({this.userId, this.id, this.title});

  factory Models.fromJson(Map<String, dynamic> json) {
    return Models(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": userId, "id": id, "title": title
  };
}
