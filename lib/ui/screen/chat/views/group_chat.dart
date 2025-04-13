import 'package:chat_system/constants.dart';
import 'package:chat_system/test/features/call/controller/call_controller.dart';
import 'package:chat_system/test/features/call/screens/call_pickup_screen.dart';
import 'package:chat_system/test/features/chat/widgets/chat_list.dart';
import 'package:chat_system/ui/widget/common/chat_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  final String profilePic;
  const GroupChatScreen({
    super.key,
    required this.name,
    required this.uid,
    required this.profilePic,
  });

  void makeCall(WidgetRef ref, BuildContext context) {
    ref.read(callControllerProvider).makeCall(
          context,
          name,
          uid,
          profilePic,
          true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeyboardDismissOnTap(
      child: CallPickupScreen(
        scaffold: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: secondColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                Text(
                  "Групп чат",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
              ],
            ),
            centerTitle: false,
            actions: [
              IconButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () => makeCall(ref, context),
                icon: const Icon(Icons.videocam),
              ),
            ],
          ),
          body: SafeArea(
            bottom: true,
            child: Column(
              children: [
                Expanded(
                  child: ChatList(
                    recieverUserId: uid,
                    isGroupChat: true,
                  ),
                ),
                BottomChatField(
                  recieverUserId: uid,
                  isGroupChat: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
