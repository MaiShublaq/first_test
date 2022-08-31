import 'package:first_test/models/post.dart';
import 'package:first_test/models/user.dart';
import 'package:first_test/widgets/create_post.dart';
import 'package:first_test/widgets/posts_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User currentUser;
  final List <Post> post;
  const HomeScreen({
    required this.currentUser,
    required this.post,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CreatePostContainer(currentUser:widget.currentUser),
        PostContainer(post: widget.post)
      ],
    );
  }
}
