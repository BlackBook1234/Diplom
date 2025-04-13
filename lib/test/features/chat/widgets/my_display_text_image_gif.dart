import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_system/test/common/enums/message_enum.dart';
import 'package:chat_system/test/features/chat/widgets/video_player_item.dart';
import 'package:flutter/material.dart';

class MyDisplayTextImageGIF extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const MyDisplayTextImageGIF({
    super.key,
    required this.message,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer audioPlayer = AudioPlayer();

    return type == MessageEnum.text
        ? Text(
            message,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          )
        : type == MessageEnum.audio
            ? StatefulBuilder(builder: (context, setState) {
                return IconButton(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                  ),
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      await audioPlayer.play(UrlSource(message));
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                  ),
                );
              })
            : type == MessageEnum.video
                ? VideoPlayerItem(
                    videoUrl: message,
                  )
                : type == MessageEnum.gif
                    ? CachedNetworkImage(
                        height: 150,
                        width: 150,
                        imageUrl: message,
                      )
                    : CachedNetworkImage(
                      height: 300,
                        imageUrl: message,
                      );
  }
}
