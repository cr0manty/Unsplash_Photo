import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_photo/models/post.dart';
import 'package:unsplash_photo/utils/hex_color.dart';
import 'package:unsplash_photo/view/detail_page/detail_photo_model.dart';
import 'package:unsplash_photo/widgets/image_view.dart';

class DetailPhotoView extends StatefulWidget {
  final Post post;

  DetailPhotoView(this.post);

  @override
  _DetailPhotoViewState createState() => _DetailPhotoViewState();
}

class _DetailPhotoViewState extends State<DetailPhotoView>
    with TickerProviderStateMixin {
  DetailPhotoModel _model;

  @override
  void initState() {
    super.initState();
    _model = DetailPhotoModel(this);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTapDown: (_) => _model.startTimer(),
        child: Stack(
          children: [
            ImageView(
              widget.post.fullUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: 0,
              left: 0,
              child: FadeTransition(
                opacity: _model.fadeInFadeOut,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).padding.top + 40,
                  width: MediaQuery.of(context).size.width,
                  color: HexColor.cardBackground.withOpacity(0.65),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: CupertinoButton(
                    onPressed: Navigator.of(context).pop,
                    child: Icon(
                      CupertinoIcons.xmark,
                      size: 25,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: FadeTransition(
                opacity: _model.fadeInFadeOut,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: HexColor.cardBackground.withOpacity(0.65),
                  alignment: Alignment.center,
                  child: Text(
                    widget.post.author.fullName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _model?.dispose();
    super.dispose();
  }
}
