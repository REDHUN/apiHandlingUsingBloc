import 'package:blocapihandling/domain/entities/post_entites.dart';

class PostDataModel extends PostEntities {
  const PostDataModel(
      {required super.title,
      required super.body,
      required super.id,
      required super.userId});

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
        title: json['title'],
        body: json['body'],
        id: json['id'],
        userId: json['userId']);
  }
}
