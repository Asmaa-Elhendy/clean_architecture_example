
import 'package:clean_architecture_project/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class PostRepository{
  Future<Either<Failure,List<Post>>> getAllPosts();
  Future<Either<Failure,Unit>> addPost(Post post);
  Future<Either<Failure,Unit>> updatePost(Post post);
  Future<Either<Failure,Unit>>  deletePost(int id);
}
//unit :return nothing like void