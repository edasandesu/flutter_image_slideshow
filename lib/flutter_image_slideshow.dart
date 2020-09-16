library flutter_image_slideshow;

import 'package:flutter/material.dart';

class FlutterImageSlideshow extends StatelessWidget {
  FlutterImageSlideshow({this.images});
  final List<Image> images;

  final PageController _pageController = PageController(
    viewportFraction: 1.0,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: images.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          return Container(
            child: images[index],
          );
        },
      ),
    );
  }
}
