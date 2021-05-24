part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;

  PostLoaded(this.posts);
}

class PostLoadingFailed extends PostState {}
