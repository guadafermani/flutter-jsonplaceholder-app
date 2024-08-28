import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_placeholder_app/domain/models/post.dart';
import 'package:flutter_placeholder_app/data/cache/cache_helper.dart';

import '../../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';
  final String _cacheKey = 'cachedPosts';

  @override
  Future<List<Post>> fetchPosts() async {
    try {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

      if (response.statusCode == 200) {
        CacheHelper.saveData(_cacheKey, response.body);
        return parsePosts(response.body);
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      final cachedData = await CacheHelper.getData(_cacheKey);
      if (cachedData != null) {
        return parsePosts(cachedData);
      } else {
        throw Exception('No cached data available');
      }
    }
  }

  List<Post> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  // TODO: implement createPost
  }

