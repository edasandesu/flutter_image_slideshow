import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/indicator.dart';

class ImageSlideshow extends StatefulWidget {
  const ImageSlideshow({
    Key? key,
    required this.children,
    this.width = double.infinity,
    this.height = 200,
    this.initialPage = 0,
    this.indicatorColor,
    this.indicatorBackgroundColor = Colors.grey,
    this.onPageChanged,
    this.autoPlayInterval,
  }) : super(key: key);

  /// The widgets to display in the [ImageSlideshow].
  ///
  /// Mainly intended for image widget, but other widgets can also be used.
  final List<Widget> children;

  /// Width of the [ImageSlideshow].
  final double width;

  /// Height of the [ImageSlideshow].
  final double height;

  /// The page to show when first creating the [ImageSlideshow].
  final int initialPage;

  /// The color to paint the indicator.
  final Color? indicatorColor;

  /// The color to paint behind th indicator.
  final Color? indicatorBackgroundColor;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  /// Auto scroll interval.
  ///
  /// Do not auto scroll when you enter null or 0.
  final int? autoPlayInterval;

  @override
  _ImageSlideshowState createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  final _currentPageNotifier = ValueNotifier(0);
  late PageController _pageController;

  int get currentPage => _currentPageNotifier.value;

  void _onPageChanged(int value) {
    _currentPageNotifier.value = value;
    if (widget.onPageChanged != null) {
      widget.onPageChanged!(value);
    }
  }

  void _autoPlay() {
    Timer.periodic(
      Duration(milliseconds: widget.autoPlayInterval!),
      (timer) {
        if (currentPage < widget.children.length - 1) {
          _currentPageNotifier.value++;
        } else {
          _currentPageNotifier.value = 0;
        }

        if (_pageController.hasClients) {
          _pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      },
    );
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.initialPage,
    );
    _currentPageNotifier.value = widget.initialPage;

    if (widget.autoPlayInterval != null && widget.autoPlayInterval != 0) {
      _autoPlay();
    }
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: _onPageChanged,
            itemCount: widget.children.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return widget.children[index];
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, value, child) {
                return Indicator(
                  count: widget.children.length,
                  currentIndex: value,
                  activeColor: widget.indicatorColor,
                  backgroundColor: widget.indicatorBackgroundColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
