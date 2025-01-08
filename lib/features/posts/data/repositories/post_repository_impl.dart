import 'package:clean_architecture_project/core/errors/failures.dart';
import 'package:clean_architecture_project/core/network/network_info.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_local-data_source.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_project/features/posts/data/models/post_model.dart';
import 'package:clean_architecture_project/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';

typedef Future<Unit> AddOrUpdateOrDelete();

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getAllPosts();
        await localDataSource.cachedPosts(remotePosts);
        return Right(remotePosts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPosts = await localDataSource.getAllPosts();
        return Right(localPosts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    //i need to save list of post model not post entity in remote data source
    final PostModel postModel =
        PostModel( title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMessage(() {
      return remoteDataSource.deletePost(postId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);
    return await _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      AddOrUpdateOrDelete addOrUpdateOrDelete) async {
    if (await networkInfo.isConnected) {
      try {
        await AddOrUpdateOrDelete;
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
