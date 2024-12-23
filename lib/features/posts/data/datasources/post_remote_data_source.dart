import 'package:dartz/dartz.dart';

import '../../domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<List<Post>> getAllPosts();
  Future<Unit> addPost(Post post);
  Future<Unit> updatePost(Post post);
  Future<Unit> deletePost(int postId);
}

class PostRemoteDataSourceImpl extends PostRemoteDataSource{
  @override
  Future<Unit> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
}