import 'package:chat_system/test/common/enums/message_enum.dart';
import 'package:chat_system/test/features/chat/widgets/display_text_image_gif.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    super.key,
    required this.message,
    required this.date,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
  });
  final Message message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;

    return SwipeTo(
      onRightSwipe: (e) {
        onRightSwipe();
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
            minWidth: 100,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 15,
                        )
                      : const EdgeInsets.only(
                          left: 5,
                          top: 5,
                          right: 5,
                          bottom: 25,
                        ),
                  child: Column(
                    children: [
                      if (isReplying) ...[
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                5,
                              ),
                            ),
                          ),
                          child: DisplayTextImageGIF(
                            message: repliedText,
                            type: repliedMessageType,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      DisplayTextImageGIF(
                        message: message.text,
                        type: type,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 8,
                  child: Text(
                    date,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
