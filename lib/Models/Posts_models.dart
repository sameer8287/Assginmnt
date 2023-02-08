class PostsModels {
  PostsModels({

    required this.title,
    required this.body,});

  PostsModels.fromJson(dynamic json) {

    title = json['title'];
    body = json['body'];
  }

  late String title;
  late String body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}