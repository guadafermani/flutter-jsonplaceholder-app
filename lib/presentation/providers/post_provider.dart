import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/domain/models/post.dart';
import 'package:flutter_placeholder_app/domain/usecases/fetch_post_usecase.dart';
import 'package:flutter_placeholder_app/domain/usecases/fetch_user_usecase.dart';

class PostProvider with ChangeNotifier {
  final FetchPostsUseCase _fetchPostsUseCase;
  final FetchUsersUseCase _fetchUsersUseCase;

  List<Post> _posts = [];
  final List<Post> _filteredPosts = [];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PostProvider(this._fetchPostsUseCase, this._fetchUsersUseCase);

  List<Post> get posts => _filteredPosts.isNotEmpty ? _filteredPosts : _posts;

  Future<void> fetchPostsAndUsers() async {
    _isLoading = true;
    Future.microtask(() => notifyListeners());

    try {
      final posts = await _fetchPostsUseCase.execute();
      final users = await _fetchUsersUseCase.execute();

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
