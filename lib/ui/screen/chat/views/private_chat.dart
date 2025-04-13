import 'package:chat_system/constants.dart';
import 'package:chat_system/test/common/widgets/loader.dart';
import 'package:chat_system/test/features/auth/controller/auth_controller.dart';
import 'package:chat_system/test/features/call/controller/call_controller.dart';
import 'package:chat_system/test/features/call/screens/call_pickup_screen.dart';
import 'package:chat_system/test/features/chat/widgets/chat_list.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/widget/common/chat_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrivateChatScreen extends ConsumerWidget {
  static const String routeName = '/private-chat-screen';
  final String name;
  final String uid;
  final String profilePic;
  const PrivateChatScreen({
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
          false,
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
            centerTitle: false,
            title: StreamBuilder<UserModel>(
                stream: ref.read(authControllerProvider).userDataById(uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14)),
                      Row(
                        children: [
                          Text(
                            snapshot.data!.isOnline ? '🙂' : '😴',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            snapshot.data!.isOnline ? 'online' : 'offline',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
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
                    isGroupChat: false,
                  ),
                ),
                BottomChatField(
                  recieverUserId: uid,
                  isGroupChat: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
