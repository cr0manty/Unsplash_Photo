import 'package:unsplash_photo/models/author.dart';

class Post {
  String description;
  String altDescription;
  Author author;
  String miniUrl;
  String fullUrl;

  Post({
    this.author,
    this.fullUrl,
    this.miniUrl,
    this.description,
    this.altDescription,
  });

  factory Post.fromJson(Map<String, dynamic> data) => Post(
        altDescription: data['alt_description'],
        description: data['description'],
        author: Author.fromJson(data['user']),
        miniUrl: data['urls']['thumb'],
        fullUrl: data['urls']['full'],
      );

  String get name => description ?? altDescription ?? 'Unknown';
}
