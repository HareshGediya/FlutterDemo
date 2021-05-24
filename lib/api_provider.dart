import 'package:flutter_demo/models/post.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();

  Future<List<Post>> fetchPosts() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
