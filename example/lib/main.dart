import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget createTextContainer(String text, Color color) {
      return Container(
        alignment: Alignment.center,
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: ImageSlideshow(
          indicatorColor: Colors.white,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          isLoop: true,
          autoPlayInterval: 3000,
          onUserStartScrolling: (pageIndex) {
            debugPrint('User started scrolling at page index: $pageIndex');
          },
          onUserEndScrolling: (pageIndex) {
            debugPrint('User ended scrolling at page index: $pageIndex');
          },
          children: [
            createTextContainer('0', Colors.red),
            createTextContainer('1', Colors.lightBlue),
            createTextContainer('2', Colors.green),
            createTextContainer('3', Colors.black38),
          ],
        ),
      ),
    );
  }
}
