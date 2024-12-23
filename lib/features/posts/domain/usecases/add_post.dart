import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';

class AddPostsUseCase {
  final PostRepository repository;

  AddPostsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    //call to make class callable as function
    return await repository.addPost(post);
  }
}