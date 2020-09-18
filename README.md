# flutter_image_slideshow

A simple image slideshow widget.
Mainly intended for image widget, but other widgets can also be used.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk:
  flutter_image_slideshow
```

In your library add the following import:

```dart
  import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
```

## Usage

```dart
ImageSlideshow(

  /// The widgets to display in the [ImageSlideshow].
  List<Widget> children,

  /// Width of the [ImageSlideshow].
  double width,

  /// Height of the [ImageSlideshow].
  double height,

  /// The page to show when first creating the [ImageSlideshow].
  int initialPage,

  /// The color to paint the indicator.
  Color indicatorColor,

  /// The color to paint behind th indicator.
  Color indicatorBackgroundColor,
)
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow_test/flutter_image_slideshow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: ImageSlideshow(
          width: double.infinity,
          height: 200,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
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
```
