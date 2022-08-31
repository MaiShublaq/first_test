import 'package:first_test/models/data.dart';
import 'package:first_test/screens/home_screen.dart';
import 'package:first_test/screens/quiz.dart';
import 'package:first_test/screens/story_screen.dart';
import 'package:first_test/widgets/create_post.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizzScreen(),
      //HomeScreen(currentUser: currentUser,post: posts),
    );
  }
}
