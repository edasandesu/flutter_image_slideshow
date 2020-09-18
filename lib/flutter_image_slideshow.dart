library flutter_image_slideshow;

import 'dart:async';

import 'package:flutter/material.dart';

class ImageSlideshow extends StatefulWidget {
  ImageSlideshow({
    @required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.indicatorColor = Colors.blue,
    this.indicatorBackgroundColor = Colors.grey,
  });

  /// The widgets to display in the [ImageSlideshow].
  final List<Widget> children;

  /// Width of the [ImageSlideshow].
  final double width;

  /// Height of the [ImageSlideshow].
  final double height;

  /// The page to show when first creating the [ImageSlideshow].
  final int initialPage;

  /// The color to paint the indicator.
  final Color indicatorColor;

  /// The color to paint behind th indicator.
  final Color indicatorBackgroundColor;

  @override
  _ImageSlideshowState createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  final StreamController<int> _onPageChanged =
      StreamController<int>.broadcast();
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _onPageChanged.close();
    super.dispose();
  }

  Widget _indicator(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      alignment: WrapAlignment.center,
      children: List<Widget>.generate(
        widget.children.length,
        (index) {
          return StreamBuilder<int>(
            initialData: _pageController.initialPage,
            stream: _onPageChanged.stream.where(
              (pageIndex) {
                return index >= pageIndex - 1 && index <= pageIndex + 1;
              },
            ),
            builder: (_, AsyncSnapshot<int> snapshot) {
              return Container(
                width: 6,
                height: 6,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: snapshot.data == index
                      ? widget.indicatorColor
                      : widget.indicatorBackgroundColor,
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: _onPageChanged.sink.add,
            itemCount: widget.children.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return widget.children[index];
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 10.0,
            child: _indicator(context),
          ),
        ],
      ),
    );
  }
}
