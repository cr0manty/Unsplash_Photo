import 'package:flutter/cupertino.dart';
import 'package:unsplash_photo/models/post.dart';

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
        backgroundColor: CupertinoColors.darkBackgroundGray,
        child: StreamBuilder<List<Post>>(
        stream: _model.onLoad,
        initialData: _model.posts,
        builder: (context, snapshot) {
          return ListView();
        }
      ),
    );
  }

  @override
  void dispose() {
    _model?.dispose();
    super.dispose();
  }
}
