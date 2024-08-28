import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_placeholder_app/domain/models/post.dart';

import '../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> postJson = json.decode(response.body);
      return postJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // TODO: implement createPost
}
