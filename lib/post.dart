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
