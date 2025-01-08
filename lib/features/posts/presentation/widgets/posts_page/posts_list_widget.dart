import 'package:flutter/material.dart';
import '../../../domain/entities/post.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostsListWidget({required this.posts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(posts[index].id.toString()),
            title: Text(
              posts[index].body,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              posts[index].body,
              style: TextStyle(fontSize: 13),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) => Divider(
              thickness: 1,
            ),
        itemCount: posts.length);
  }
}
