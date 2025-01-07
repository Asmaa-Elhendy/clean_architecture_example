import 'package:clean_architecture_project/core/errors/failures.dart';
import 'package:clean_architecture_project/core/strings/failures.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/get_all_posts.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/post.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  GetAllPostsUseCase getAllPostsUseCase;
  PostsBloc({required this.getAllPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent || event is RefreshPostsEvent) {
        emit(PostsFetchingState());
        final failureOrPosts = await getAllPostsUseCase();
        failureOrPosts.fold((failure) {
          emit(PostsFetchingFailureState(
              message: _mapFailureToMessage(failure)));
        }, (posts) {
          emit(PostsFetchingSuccessState(posts: posts));
        });
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHED_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "UnexpectedError , please try again later.";
    }
  }
}
