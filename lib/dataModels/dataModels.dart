class NewsArticle {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;
  bool isliked = false;

  NewsArticle.fromJson(Map<String, dynamic> map) {
    source = Source.fromJson(map['source']);
    author = map['author'];
    title = map['title'];
    description = map['description'];
    url = map['url'];
    urlToImage = map['urlToImage'];
    content = map['content'];
    isliked = false;
  }
}

class Source {
  String? id;
  String? name;

  Source.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
