import 'package:clean_architecture_project/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/post.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
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
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
  
}