import 'package:flutter_demo/api_provider.dart';
import 'package:flutter_demo/models/post.dart';

class PostRepository {
  final ApiProvider _postProvider = ApiProvider();

  Future<List<Post>> fetchPosts() => _postProvider.fetchPosts();
}
