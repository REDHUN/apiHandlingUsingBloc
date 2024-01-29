import 'package:blocapihandling/data/dataSources/post_remote_datasoruce.dart';
import 'package:blocapihandling/domain/entities/post_entites.dart';
import 'package:blocapihandling/domain/respository/postrepo.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceImpl();
  @override
  Future<List<PostEntities>> getPostFromDataSource() {
    final post = postRemoteDataSource.getDataFromApi();
    return post;
  }
}
