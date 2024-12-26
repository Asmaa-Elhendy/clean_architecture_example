part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetAllPostsEvent extends PostsEvent {}

class RefreshPostsEvent extends PostsEvent {}
