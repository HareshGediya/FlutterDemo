import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'package:flutter_demo/api_provider.dart';

void main() {
  test('Testing the network call', () async {
    // setup the test
    final apiProvider = ApiProvider();
    apiProvider.client = MockClient((request) async {
      final mapJson = [
        {
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false
        }
      ];
      return Response(json.encode(mapJson), 200);
    });
    final posts = await apiProvider.fetchPosts();
    expect(posts.length, 1);
    expect(posts.first.userId, 1);
  });
}
