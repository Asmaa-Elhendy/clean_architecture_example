import 'package:clean_architecture_project/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/post_model.dart';
import 'dart:convert';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> cachedPosts(List<PostModel> posts);
}
const CACHED_POSTS="Cached-Posts";
class PostLocalDataSourceImpl extends PostLocalDataSource {
  SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachedPosts(List<PostModel> posts) {
    List postModelsToJson = posts
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      List decodedJsonData = jsonDecode(jsonString);
      List<PostModel> jsonToPostModels = decodedJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
