part of 'add_update_delete_posts_bloc.dart';

abstract class AddUpdateDeletePostsState extends Equatable {
  const AddUpdateDeletePostsState();
  @override
  List<Object> get props => [];
}

class AddUpdateDeletePostsInitial extends AddUpdateDeletePostsState {}

class LoadingAddUpdateDeletePostsState extends AddUpdateDeletePostsState {}

class MessageAddUpdateDeletePostsState extends AddUpdateDeletePostsState {
  final String Message;
  MessageAddUpdateDeletePostsState({required this.Message});
  @override
  List<Object> get props => [Message];
}

class ErrorAddUpdateDeletePostsState extends AddUpdateDeletePostsState {
  final String Message;
  ErrorAddUpdateDeletePostsState({required this.Message});
  @override
  List<Object> get props => [Message];
}
