import 'package:clean_architecture_project/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/post.dart';

class GetAllPostsUseCase {
  final PostRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    //call to make class callable as function
    return await repository.getAllPosts();
  }
}
