import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/domain/models/post.dart';
import 'package:flutter_placeholder_app/domain/repositories/post_repository.dart';
import '../repositories/user_repositoy.dart';

class PostProvider with ChangeNotifier {
  final PostRepository _postRepository;
  final UserRepository _userRepository;

  List<Post> _posts = [];
  final List<Post> _filteredPosts = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PostProvider(this._postRepository, this._userRepository);

  List<Post> get posts => _filteredPosts.isNotEmpty ? _filteredPosts : _posts;

  Future<void> fetchPostsAndUsers() async {
    _isLoading = true;
    Future.microtask(() => notifyListeners());

    try {
      final posts = await _postRepository.fetchPosts();
      final users = await _userRepository.fetchUsers();

      // Vinculate post list with user
      _posts = posts.map((post) {
        final user = users.firstWhere((user) => user.id == post.userId);
        return post.copyWith(userName: user.name);
      }).toList();
    } catch (e) {
      _posts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
