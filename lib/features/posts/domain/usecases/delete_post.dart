import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

class DeletePostsUseCase {
  final PostRepository repository;

  DeletePostsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    //call to make class callable as function
    return await repository.deletePost(postId);
  }
}
