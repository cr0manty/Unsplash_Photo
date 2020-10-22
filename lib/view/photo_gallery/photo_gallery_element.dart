import 'package:flutter/cupertino.dart';
import 'package:unsplash_photo/models/post.dart';
import 'package:unsplash_photo/utils/hex_color.dart';
import 'package:unsplash_photo/view/detail_page/detail_photo_view.dart';
import 'package:unsplash_photo/widgets/image_view.dart';

class PhotoGalleryElement extends StatelessWidget {
  final Post post;

  PhotoGalleryElement({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => DetailPhotoView(
                  post,
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: HexColor.cardBackground,
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: ClipOval(
                      child: ImageView(
                        post.miniUrl,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.name,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 17,
                            color: CupertinoColors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: ClipOval(
                                child: ImageView(
                                  post.author?.photo,
                                  height: 35,
                                  width: 35,
                                  indicatorSize: 7,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  post.author.fullName,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 13
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
