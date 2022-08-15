# flutter_image_slideshow

A simple image slideshow widget.
Mainly intended for image widget, but other widgets can also be used.

<image src="https://raw.github.com/wiki/edasandesu/flutter_image_slideshow/images/slideshow.gif" width=270>

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  flutter:
    sdk:
  flutter_image_slideshow: any
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
List<Widget> children

/// Width of the [ImageSlideshow].
double width

/// Height of the [ImageSlideshow].
double height

/// The page to show when first creating the [ImageSlideshow].
int initialPage

/// The color to paint the indicator.
Color indicatorColor

/// The color to paint behind th indicator.
Color indicatorBackgroundColor

/// Called whenever the page in the center of the viewport changes.
ValueChanged<int> onPageChanged

/// Auto scroll interval.
///
/// Do not auto scroll with null or 0.
int autoPlayInterval

/// Loops back to first slide.
bool isLoop

/// Radius of circle indicator.
double indicatorRadius
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
          /// Add the sample image file into the images folder
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

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {
            print('Page changed: $value');
          },

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,

          /// Loops back to first slide.
          isLoop: true,
        ),
      ),
    );
  }
}
```
