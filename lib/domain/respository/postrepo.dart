import 'package:blocapihandling/domain/entities/post_entites.dart';

abstract class PostRepo {
  Future<List<PostEntities>> getPostFromDataSource();
}
