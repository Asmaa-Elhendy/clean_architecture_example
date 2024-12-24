
import 'package:clean_architecture_project/core/errors/failures.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_local-data_source.dart';
import 'package:clean_architecture_project/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_project/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository{
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;

  PostRepositoryImpl({required this.remoteDataSource,required this.localDataSource});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}