import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";
  late YoutubePlayerController _controller;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () => print("Ready"),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
              ),
              IconButton(
                icon: const Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FullscreenRoute(controller: _controller),
                  ),
                ),
              ),
            ],
          ),
          builder: (context, player) {
            return Column(
              children: [player],
            );
          }),
    );
  }
}

class FullscreenRoute extends StatefulWidget {
  const FullscreenRoute({Key? key, required this.controller}) : super(key: key);

  final YoutubePlayerController controller;

  @override
  State<FullscreenRoute> createState() => _FullscreenRouteState();
}

class _FullscreenRouteState extends State<FullscreenRoute> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    return Scaffold(
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: widget.controller,
          showVideoProgressIndicator: true,
          onReady: () => print("Ready"),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
            ),
            IconButton(
              icon: const Icon(
                Icons.fullscreen,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        builder: (context, player) => Container(
          width: double.infinity,
          height: double.infinity,
          child: player,
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }
}