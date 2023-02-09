import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final videos = [
  "assets/videos/Aurora916.mp4",
  "assets/videos/Qualle916.mp4",
  "assets/videos/Sonneruntergang916.mp4",
];


class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              controller: _pageController,
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return VideoCard(assetPath: videos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoCardPlaceHolder extends StatelessWidget {
  final int index;
  const VideoCardPlaceHolder({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        color: Colors.red,
        child: Center(
          child: Text("Page $index"),
        ));
  }
}

class StandardVideoCard extends StatelessWidget {
  final String assetPath;
  const StandardVideoCard({Key? key, required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card();
  }
}

class VideoCard extends StatefulWidget {
  final String assetPath;
  const VideoCard({Key? key, required this.assetPath}) : super(key: key);

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath);

    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    }).catchError((error) {
      print(error);
    });
    _controller.setLooping(true);
    _controller.setVolume(0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(0, 6),
              blurRadius: 8,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller)),
      ),
    );
  }
}
