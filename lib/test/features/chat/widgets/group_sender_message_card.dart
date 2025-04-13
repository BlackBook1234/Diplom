import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/enums/message_enum.dart';
import 'package:chat_system/test/features/chat/widgets/display_text_image_gif.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

class GroupSenderMessageCard extends StatelessWidget {
  const GroupSenderMessageCard({
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 4),
            Stack(
              children: [
                message.senderImage == ""
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        width: 20,
                        height: 20,
                      )
                    : ClipOval(
                        child: Image.network(
                          message.senderImage,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                      ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: kBackgroundColor,
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: message.senderIsOnline
                          ? Colors.green.shade400
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 4),
                Text(
                  textAlign: TextAlign.start,
                  message.senderName,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 45,
                    minWidth: 100,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
