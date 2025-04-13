import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_system/test/features/call/controller/call_controller.dart';
import 'package:chat_system/test/features/call/screens/call_screen.dart';

class CallPickupScreen extends ConsumerWidget {
  final Widget scaffold;
  const CallPickupScreen({
    super.key,
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<DocumentSnapshot>(
      stream: ref.watch(callControllerProvider).callStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.data() != null) {
          Call call =
              Call.fromJson(snapshot.data!.data() as Map<String, dynamic>);

          if (!call.hasDialled) {
            return Scaffold(
              body: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.teal],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Incoming Call',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 70),
                    CircleAvatar(
                      backgroundImage: NetworkImage(call.callerPic),
                      radius: 150,
                    ),
                    const SizedBox(height: 70),
                    Text(
                      call.callerName,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 75),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.call_end,
                              color: Colors.redAccent,
                              size: 60,
                              ),

                        ),
                        const SizedBox(width: 100),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallScreen(
                                  channelId: call.callId,
                                  call: call,
                                  isGroupChat: false,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.call,
                            color: Colors.green,
                            size: 60,
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
        return scaffold;
      },
    );
  }
}
