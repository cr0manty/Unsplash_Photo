import 'dart:async';

import 'package:unsplash_photo/models/author.dart';
import 'package:unsplash_photo/models/post.dart';
import 'package:unsplash_photo/network/api_client.dart';
import 'package:unsplash_photo/network/result.dart';

class PhotoGalleryModel {
  final _scrollController;
  final StreamController<List<Post>> _onLoad =
      StreamController<List<Post>>.broadcast();
  int _page = 1;
  List<Post> _posts = [
    Post(
        miniUrl:
            'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
        name: 'test',
        fullUrl:
            'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
        author: Author(
          firstName: 'test',
          lastName: 'asd',
          photo:
              'https://images.unsplash.com/profile-1600096866391-b09a1a53451aimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32',
        ))
  ];

  PhotoGalleryModel(this._scrollController) {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset - 100) {
        // fetchData(); // TODO
      }
    });
  }

  Stream<List<Post>> get onLoad => _onLoad.stream;

  List<Post> get posts => _posts;

  void fetchData() async {
    Result result = await ApiClient.instance.getPosts(page: _page);

    if (result.isSuccess) {
      result.data.forEach((value) => _posts.add(Post.fromJson(value)));
      _page++;
      _onLoad.add(_posts);
    }
  }

  void dispose() {
    _onLoad?.close();
  }
}
