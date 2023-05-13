import 'package:bug_web_stack/screens/game_screen/widgets/my_video_player.dart';
import 'package:flutter/material.dart';
import 'package:bug_web_stack/models/sign.dart';

class MemoryCardFrontContent extends StatelessWidget {
  final Sign sign;
  final bool completed;
  const MemoryCardFrontContent({
    required this.sign,
    required this.completed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: Key('${sign.id} video-face'),
      children: [
        Container(color: Colors.black, key: const Key('background')),
        MyVideoPlayer(
          url: sign.videoUrl,
          key: Key('${sign.id} ${sign.videoUrl}'),
        ),
        // If completed, show text overlay
        // Bug occur, both if the keyed Center widget is conditional or not.
        Center(
          key: Key('${sign.id} completed-text'),
          child: completed
              ? const Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              : Container(),
        ),
      ],
    );
  }
}
