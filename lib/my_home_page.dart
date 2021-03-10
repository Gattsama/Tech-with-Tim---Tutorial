import 'package:flutter/material.dart';
import 'package:tech_with_tim_tutorial/text_input.dart';
import 'package:tech_with_tim_tutorial/post_list.dart';
import 'package:tech_with_tim_tutorial/post.dart';

class MyHomePage extends StatefulWidget {
  final String userName;
  MyHomePage(this.userName);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = []; //Empty list of new posts (name and author)

  void newPost(String newText) {
    //newText == _controller.text from TextInput
    //posts list updated here
    setState(() {
      posts.add(Post(newText, widget.userName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hello Syd!'),
      ),
      body: Column(
        children: [
          Expanded(child: PostList(posts)),
          TextInput(
            callBack: newPost,
          ),
        ],
      ),
    );
  }
}
