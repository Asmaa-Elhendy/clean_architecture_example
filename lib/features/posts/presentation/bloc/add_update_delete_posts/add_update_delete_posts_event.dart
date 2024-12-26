part of 'add_update_delete_posts_bloc.dart';

abstract class AddUpdateDeletePostsEvent extends Equatable {
  const AddUpdateDeletePostsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddPostEvent extends AddUpdateDeletePostsEvent {
  final Post post;
  AddPostEvent({required this.post});
  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

class UpdatePostEvent extends AddUpdateDeletePostsEvent {
  final Post post;
  UpdatePostEvent({required this.post});
  @override
  // TODO: implement props
  List<Object?> get props => [post];
}

class DeletePostEvent extends AddUpdateDeletePostsEvent {
  final int postId;
  DeletePostEvent({required this.postId});
  @override
  // TODO: implement props
  List<Object?> get props => [postId];
}
