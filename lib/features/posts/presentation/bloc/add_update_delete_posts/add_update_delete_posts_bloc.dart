import 'package:bloc/bloc.dart';
import 'package:clean_architecture_project/core/errors/failures.dart';
import 'package:clean_architecture_project/core/strings/mesages.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_project/features/posts/domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/post.dart';

part 'add_update_delete_posts_event.dart';
part 'add_update_delete_posts_state.dart';

class AddUpdateDeletePostsBloc
    extends Bloc<AddUpdateDeletePostsEvent, AddUpdateDeletePostsState> {
  AddPostsUseCase addPostsUseCase;
  UpdatePostsUseCase updatePostsUseCase;
  DeletePostsUseCase deletePostsUseCase;

  AddUpdateDeletePostsBloc(
      {required this.addPostsUseCase,
      required this.updatePostsUseCase,
      required this.deletePostsUseCase})
      : super(AddUpdateDeletePostsInitial()) {
    on<AddUpdateDeletePostsEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddUpdateDeletePostsState());
        final eitherFailureOrMessage = await addPostsUseCase(event.post);
        _EitherDoneMessageOrErrorState(
            eitherFailureOrMessage, ADD_POST_MESSAGE);
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddUpdateDeletePostsState());
        final eitherFailureOrMessage = await updatePostsUseCase(event.post);
        _EitherDoneMessageOrErrorState(
            eitherFailureOrMessage, UPDATE_POST_MESSAGE);
      } else if (event is DeletePostEvent) {
        emit(LoadingAddUpdateDeletePostsState());
        final eitherFailureOrMessage = await deletePostsUseCase(event.postId);
        _EitherDoneMessageOrErrorState(
            eitherFailureOrMessage, DELETE_POST_MESSAGE);
      }
    });
  }
  AddUpdateDeletePostsState _EitherDoneMessageOrErrorState(
      Either<Failure, Unit> eitherFailureOrMessage, String message) {
    return eitherFailureOrMessage.fold((failure) {
      return ErrorAddUpdateDeletePostsState(
          Message: _FailureToMessage(failure));
    }, (_) {
      return MessageAddUpdateDeletePostsState(Message: message);
    });
  }

  String _FailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "UnexpectedError , please try again later.";
    }
  }
}
