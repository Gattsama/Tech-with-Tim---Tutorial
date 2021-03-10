import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syds App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = []; //Empty list of new posts (name and author)

  void newPost(String newText) {
    //posts list updated here
    setState(() {
      posts.add(Post(newText, 'Lord Cousin'));
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
          Expanded(
            child: PostList(
                posts), //Takes updated posts list and sends to PostList class
          ),
          Expanded(
            child: TextInput(
              callBack: newPost,
            ),
          ),
        ],
      ),
    );
  }
}

//Text input class
//
class TextInput extends StatefulWidget {
  final Function(String textData) callBack;

  TextInput({@required this.callBack});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        labelText: 'Type a message',
        suffixIcon: IconButton(
            splashColor: Colors.purple,
            splashRadius: 30,
            tooltip: 'Post Message',
            icon: Icon(Icons.send),
            onPressed: () {
              widget.callBack(_controller.text);
              _controller.clear();
            }),
      ),
    );
  }
}

//Post class
//
class Post {
  String body;
  String author;
  int likesCounter = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !userLiked;
    if (userLiked) {
      likesCounter += 1;
    } else {
      likesCounter -= 1;
    }
  }
}

class PostList extends StatefulWidget {
  //Will create new ListView Post
  final List<Post> listItems;

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
          var post = widget.listItems[index]; //TODO video 6
        });
  }
}
