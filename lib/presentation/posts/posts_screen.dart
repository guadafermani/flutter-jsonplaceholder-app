import 'package:flutter/material.dart';
import 'package:flutter_placeholder_app/presentation/posts/post_list_item.dart';
import 'package:flutter_placeholder_app/presentation/posts/post_search_delegate.dart';
import 'package:provider/provider.dart';
import '../../domain/providers/post_provider.dart';
import 'package:flutter_placeholder_app/domain/models/post.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final postProvider = Provider.of<PostProvider>(context);

  if (postProvider.posts.isEmpty && !postProvider.isLoading) {
    postProvider.fetchPostsAndUsers();
  }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PostSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, postProvider, child) {
          if (postProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (postProvider.posts.isEmpty) {
            return const Center(
              child: Text(
                'No posts available.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return PostList(posts: postProvider.posts);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new post
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final Post post = posts[index];
        return PostListItem(post: post);
      },
    );
  }
}
