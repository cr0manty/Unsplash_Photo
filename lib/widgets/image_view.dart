import 'package:flutter/cupertino.dart';

class ImageView extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double height;
  final double width;
  final double indicatorSize;

  ImageView(
    this.url, {
    this.fit,
    this.padding,
    this.margin,
    this.indicatorSize = 10,
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Container(
        color: CupertinoColors.systemGrey,
      );
    }

    return Container(
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      width: width,
      height: height,
      child: Image.network(url,
          fit: fit ?? BoxFit.cover,
          errorBuilder: (context, url, error) => Container(
                color: CupertinoColors.systemGrey,
              ),
          loadingBuilder: (context, child, event) {
            if (event != null) {
              return Container(
                color: CupertinoColors.systemGrey,
                child: Center(
                  child: CupertinoActivityIndicator(
                    radius: indicatorSize,
                  ),
                ),
              );
            }
            return child;
          }),
    );
  }
}
