import 'package:flutter/material.dart';
import 'package:tech_with_tim_tutorial/post.dart';

class PostList extends StatefulWidget {
  //Will create new ListView Post
  final List<Post>
      listItems; //will take a list of Posts, list created on MyHomePage

  PostList(this.listItems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length,
        itemBuilder: (BuildContext context, int index) {
          var post = widget.listItems[index];
          return Card(
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(post.body),
                    subtitle: Text(post.author),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        post.likesCounter.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          color:
                              post.userLiked ? Colors.redAccent : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            post.likePost();
                          });
                        })
                  ],
                )
              ],
            ),
          );
        });
  }
}
