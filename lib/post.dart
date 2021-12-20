class Post {
  String name;
  String time;
  String _imagePath = "";
  String desc;
  int likes;
  int comments;

  Post(
      {required this.name,
      required this.time,
      String imagePath = "",
      required this.desc,
      this.likes = 0,
      this.comments = 0}) {
    _imagePath = imagePath;
  }

  String get imagePath {
    return _imagePath;
  }

  set image(String newUrl) {
    if (newUrl != ""){
      _imagePath = newUrl;
    }
  }

  String setTime() => "$time ago";

  String setLikes() {
    return "$likes likes";
  }

  String setComments() {
    if (comments > 1) {
      return "$comments comments";
    } else {
      return "$comments comments";
    }
  }
}
