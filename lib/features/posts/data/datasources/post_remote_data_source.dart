import 'dart:convert';
import 'package:clean_architecture_project/core/errors/exceptions.dart';
import 'package:clean_architecture_project/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/post.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addPost(PostModel post);
  Future<Unit> updatePost(PostModel post);
  Future<Unit> deletePost(int postId);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl extends PostRemoteDataSource {
  final http.Client client;
  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(Uri.parse(BASE_URL + '/posts'),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = jsonDecode(response.body);
      List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(Post post) async {
    final body = {"title": post.title, "body": post.body};
    final response =
        await client.post(Uri.parse(BASE_URL + '/posts'), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client
        .delete(Uri.parse(BASE_URL + "/posts/${postId.toString()}"));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(Post post) async {
    final postId = post.id.toString();
    final body = {"title": post.title, "body": post.body};
    final response = await client
        .patch(Uri.parse(BASE_URL + '/posts/${postId}'), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
