import 'package:dartz/dartz.dart';
import '../../domain/entities/post.dart';
import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> cachedPosts(List<PostModel> posts);

}

class PostLocalDataSourceImpl extends PostLocalDataSource{
  @override
  Future<Unit> cachedPosts(List<PostModel>  posts) {
    // TODO: implement addPost
    throw UnimplementedError();
  }


  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

}