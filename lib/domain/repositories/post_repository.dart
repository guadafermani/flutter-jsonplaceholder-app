import 'package:flutter_placeholder_app/domain/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}
