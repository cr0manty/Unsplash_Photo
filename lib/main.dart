import 'package:flutter/cupertino.dart';
import 'package:unsplash_photo/utils/hex_color.dart';
import 'package:unsplash_photo/view/photo_gallery/photo_gallery_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: HexColor.scaffoldBackground
      ),
      home: PhotoGallery(),
    );
  }
}
