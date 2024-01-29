import 'package:blocapihandling/data/respository/post_repo_impl.dart';
import 'package:blocapihandling/domain/entities/post_entites.dart';
import 'package:blocapihandling/domain/respository/postrepo.dart';

class PostUseCases {
  PostRepo postRepo = PostRepoImpl();
  Future<List<PostEntities>> getPostFromDataSource() {
    final post = postRepo.getPostFromDataSource();
    return post;
  }
}
