import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoScreenState();
  }
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  @override
  void initState() {
    super.initState();
    //VideoPlayerController.
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
    )..initialize().then((_) {
        setState(() {});
      });
    _videoController.addListener(() {
      setState(() {
        _isPlaying = _videoController.value.isPlaying;
      });
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Images APP")),
        body: Column(children: [
          _videoController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController),
                )
              : const CircularProgressIndicator(),
          FloatingActionButton(
            onPressed: _togglePlayPause,
            child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
          )
        ]));
  }
}
