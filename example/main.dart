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
      setState ((){
        isPaused = false;
        pauseResume = 'Pause';
      });
    } else {
      state!.stopAutoPlay();
      setState (() {
        isPaused = true;
        pauseResume = 'Resume';
      });
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

// Lorem Picsum:  https://picsum.photos/
// Royalty free placeholder photos
                Image.network ('https://picsum.photos/id/169/450/275',
                  fit: BoxFit.cover,
                ),
                Image.network ('https://picsum.photos/id/237/450/275',
                  fit: BoxFit.cover,
                ),
                Image.network ('https://picsum.photos/id/659/450/275',
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox (height: 30,),

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
