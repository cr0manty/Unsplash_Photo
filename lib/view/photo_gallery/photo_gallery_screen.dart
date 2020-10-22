import 'package:flutter/cupertino.dart';
import 'package:unsplash_photo/models/post.dart';
import 'package:unsplash_photo/utils/hex_color.dart';
import 'package:unsplash_photo/view/photo_gallery/photo_gallery_element.dart';

import 'photo_gallery_model.dart';

class PhotoGallery extends StatefulWidget {
  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  final ScrollController _scrollController = ScrollController();
  PhotoGalleryModel _model;

  @override
  void initState() {
    super.initState();
    _model = PhotoGalleryModel(_scrollController);
    _model.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: HexColor.scaffoldBackground,
      child: StreamBuilder<List<Post>>(
          stream: _model.onLoad,
          initialData: _model.posts,
          builder: (context, snapshot) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => PhotoGalleryElement(
                post: snapshot.data[index],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _model?.dispose();
    super.dispose();
  }
}
