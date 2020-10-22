import 'package:flutter/cupertino.dart';
import 'package:unsplash_photo/view/detail_page/detail_photo_model.dart';
import 'package:unsplash_photo/widgets/image_view.dart';

class DetailPhotoView extends StatefulWidget {
  final String imageUrl;

  DetailPhotoView(this.imageUrl);

  @override
  _DetailPhotoViewState createState() => _DetailPhotoViewState();
}

class _DetailPhotoViewState extends State<DetailPhotoView>
    with TickerProviderStateMixin {
  DetailPhotoModel _model;
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    super.initState();
    _model = DetailPhotoModel();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTapDown: (_) => _model.startTimer(),
        child: Stack(
          children: [
            ImageView(
              widget.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            FadeTransition(
              opacity: _fadeInFadeOut,
              child: StreamBuilder<bool>(
                stream: _model.enabledCloseButtonStream,
                initialData: false,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data) {
                    return Positioned(
                        top: 16,
                        left: 16,
                        child: CupertinoButton(
                          onPressed: Navigator.of(context).pop,
                          child: Icon(
                            CupertinoIcons.xmark,
                            size: 25,
                            color: CupertinoColors.white,
                          ),
                        ));
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
