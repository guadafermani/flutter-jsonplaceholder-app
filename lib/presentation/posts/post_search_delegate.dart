import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/presentation/providers/post_provider.dart';
import 'package:flutter_placeholder_app/presentation/posts/post_list_item.dart';
import 'package:provider/provider.dart';

class PostSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final filteredPosts = postProvider.posts.where((post) {
      return post.userName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredPosts.isEmpty) {
      return const Center(
        child: Text('No posts found'),
      );
    }

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return PostListItem(post: post);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
