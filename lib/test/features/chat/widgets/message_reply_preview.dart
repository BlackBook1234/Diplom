import 'package:chat_system/test/common/providers/message_reply_provider.dart';
import 'package:chat_system/test/features/chat/widgets/display_text_image_gif.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageReplyPreview extends ConsumerWidget {
  const MessageReplyPreview({super.key});

  void cancelReply(WidgetRef ref) {
    ref.read(messageReplyProvider.notifier).update((state) => null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageReply = ref.watch(messageReplyProvider);

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 60, 0),
      width: 330,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: DisplayTextImageGIF(
                  message: messageReply!.message,
                  type: messageReply.messageEnum,
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
                onTap: () => cancelReply(ref),
              ),
            ],
          ),
          Text(
            messageReply.isMe ? 'Би' : 'Бусад',
            style: const TextStyle(
                fontWeight: FontWeight.w400, fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
