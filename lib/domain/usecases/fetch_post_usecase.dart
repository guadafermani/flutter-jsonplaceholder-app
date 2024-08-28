import 'package:flutter_placeholder_app/domain/repositories/post_repository.dart';

import '../models/post.dart';

class FetchPostsUseCase {
  final PostRepository _postRepository;

  FetchPostsUseCase(this._postRepository);

  Future<List<Post>> execute() async {
    return await _postRepository.fetchPosts();
  }
}
