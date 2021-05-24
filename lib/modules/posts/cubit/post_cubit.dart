import 'package:bloc/bloc.dart';
import 'package:flutter_demo/models/post.dart';
import 'package:flutter_demo/modules/posts/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository repository;

  // PostCubit(this.repository) : super(PostInitial());

  PostCubit(this.repository) : super(PostInitial()) {
    getPosts();
  }

  void getPosts() async {
    try {
      emit(PostLoading());

      final posts = await repository.fetchPosts();
      emit(PostLoaded(posts));
    } catch (e) {
      emit(PostLoadingFailed());
    }
  }
}
