import 'dart:convert';

import 'package:blocapihandling/data/models/post_models.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostDataModel>> getDataFromApi();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final client = http.Client();
  @override
  Future<List<PostDataModel>> getDataFromApi() async {
    try {
      final response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final List<dynamic> responseBody = jsonDecode(response.body);
        final List<PostDataModel> posts =
            responseBody.map((e) => PostDataModel.fromJson(e)).toList();
        return posts;
      } else {
        throw Exception('Some Error Occured');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
