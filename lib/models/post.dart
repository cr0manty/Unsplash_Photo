import 'package:unsplash_photo/models/author.dart';

class Post {
  String name;
  Author author;
  String miniUrl;
  String fullUrl;

  Post({
    this.author,
    this.fullUrl,
    this.miniUrl,
    this.name,
  });

  factory Post.fromJson(Map<String, dynamic> data) => Post(
        name: data['alt_description'],
        author: Author.fromJson(data['user']),
        miniUrl: data['urls']['thumb'],
        fullUrl: data['urls']['full'],
      );
}
