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

These are The ImageSlideshow properties.

```dart
/// The widgets to display in the [ImageSlideshow].
///
/// Mainly intended for image widget, but other widgets can also be used.
final List<Widget> children,

/// Width of the [ImageSlideshow].
final double width,

/// Height of the [ImageSlideshow].
final double height,

/// The page to show when first creating the [ImageSlideshow].
final int initialPage,

/// The color to paint the indicator.
final Color indicatorColor,

/// The color to paint behind th indicator.
final Color indicatorBackgroundColor,
```

## Example

Create the ImageSlideshow widget.
And pass the parameters.

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

          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 200,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: Colors.blue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.grey,

          /// The widgets to display in the [ImageSlideshow].
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
