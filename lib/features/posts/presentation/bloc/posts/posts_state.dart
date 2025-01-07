part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class PostsFetchingFailureState extends PostsState {
  //loading
  final String message;

  PostsFetchingFailureState({required this.message}); //error
}

class PostsFetchingSuccessState extends PostsState {
  //loaded
  final List<Post> posts;
  PostsFetchingSuccessState({required this.posts});
}
