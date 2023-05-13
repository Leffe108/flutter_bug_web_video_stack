import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String url;

  const MyVideoPlayer({required this.url, super.key});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initController() async {
    _controller = VideoPlayerController.network(widget.url);
    await _controller.initialize();
    if (!mounted) return;
    _controller.setVolume(0);
    _controller.play();
    setState(() {
      _loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loaded) {
      return VideoPlayer(_controller);
    }
    return const Center(child: CircularProgressIndicator());
  }
}
