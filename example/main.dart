import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final appGlobalKey = GlobalKey<ImageSlideshowState>(); 
  bool isPaused = false;
  String pauseResume = 'Pause';

  void doPauseResume () {
    final state = appGlobalKey.currentState;
    if (isPaused) {
      state!.resumeAutoPlay();
      isPaused = false;
    } else {
      state!.stopAutoPlay();
      isPaused = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: Column(
          children: [
            ImageSlideshow(
              key: appGlobalKey,
              indicatorColor: Colors.blue,
              onPageChanged: (value) {
                debugPrint('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
              children: [

// TODO:  Find better publically available images
                  Image.network ('https://a4.pbase.com/g10/30/3430/2/167112793.ytdYuYRK.jpg',
//                Image.asset('',
                  fit: BoxFit.cover,
                ),
                Image.network ('https://a4.pbase.com/g10/30/3430/2/167112843.czYUDbz3.jpg',
//                Image.asset('',
                  fit: BoxFit.cover,
                ),
                Image.network ('https://a4.pbase.com/g10/30/3430/2/167113073.UdJk2RLI.jpg',
//                Image.asset('',
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox (height: 30,),

            // ignore: lines_longer_than_80_chars
            ElevatedButton (
              style: ElevatedButton.
                styleFrom(minimumSize: const Size (80, 44),), 
              onPressed: doPauseResume, 
              child: Text (pauseResume, style: const TextStyle (fontSize: 16)),
            ),

          ],
        ),
      ),
    );
  }
}
