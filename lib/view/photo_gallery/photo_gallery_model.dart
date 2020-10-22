import 'dart:async';

import 'package:unsplash_photo/models/post.dart';
import 'package:unsplash_photo/network/api_client.dart';
import 'package:unsplash_photo/network/result.dart';

class PhotoGalleryModel {
  final _scrollController;
  final StreamController<List<Post>> _onLoad =
      StreamController<List<Post>>.broadcast();
  int _page = 1;
  List<Post> _posts = [];

  PhotoGalleryModel(this._scrollController) {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset - 100) {
        fetchData();
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
