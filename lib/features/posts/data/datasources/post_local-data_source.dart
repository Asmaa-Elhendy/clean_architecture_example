import 'package:dartz/dartz.dart';
import '../../domain/entities/post.dart';

abstract class PostLocalDataSource {
  Future<List<Post>> getAllPosts();
  Future<Unit> addPost(Post post);

}

class PostLocalDataSourceImpl extends PostLocalDataSource{
  @override
  Future<Unit> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }


  @override
  Future<List<Post>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

}