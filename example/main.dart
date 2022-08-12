import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: ImageSlideshow(
          indicatorColor: Colors.blue,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Image.asset(
              'images/sample_image_1.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/sample_image_2.jpg',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'images/sample_image_3.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
