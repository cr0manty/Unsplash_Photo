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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => DetailPhotoView(
                  post.fullUrl,
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
                Container(
                  padding: EdgeInsets.all(8),
                  child: ClipOval(
                    child: ImageView(
                      post.miniUrl,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(post.name ?? 'Unknown'),
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
                          Text(post.name ?? 'Unknown')
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
