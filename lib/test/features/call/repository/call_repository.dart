import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_system/test/common/utils/utils.dart';
import 'package:chat_system/test/features/call/screens/call_screen.dart';

final callRepositoryProvider = Provider(
  (ref) => CallRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class CallRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  CallRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<DocumentSnapshot> get callStream =>
      firestore.collection('call').doc(auth.currentUser!.uid).snapshots();

  void makeCall(
    Call senderCallData,
    BuildContext context,
    Call receiverCallData,
  ) async {
    try {
      await firestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toJson());
      await firestore
          .collection('call')
          .doc(senderCallData.receiverId)
          .set(receiverCallData.toJson());

      if (!context.mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(
            channelId: senderCallData.callId,
            call: senderCallData,
            isGroupChat: false,
          ),
        ),
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  void makeGroupCall(
    Call senderCallData,
    BuildContext context,
    Call receiverCallData,
  ) async {
    try {
      await firestore
          .collection('call')
          .doc(senderCallData.callerId)
          .set(senderCallData.toJson());

      var groupSnapshot = await firestore
          .collection('groups')
          .doc(senderCallData.receiverId)
          .get();
      // model.Group group = model.Group.fromJson(groupSnapshot.data()!);

      // for (var id in group.membersUid) {
      //   await firestore
      //       .collection('call')
      //       .doc(id)
      //       .set(receiverCallData.toJson());
      // }
      if (!context.mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(
            channelId: senderCallData.callId,
            call: senderCallData,
            isGroupChat: true,
          ),
        ),
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  void endCall(
    String callerId,
    String receiverId,
    BuildContext context,
  ) async {
    try {
      await firestore.collection('call').doc(callerId).delete();
      await firestore.collection('call').doc(receiverId).delete();
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }

  void endGroupCall(
    String callerId,
    String receiverId,
    BuildContext context,
  ) async {
    try {
      await firestore.collection('call').doc(callerId).delete();
      var groupSnapshot =
          await firestore.collection('groups').doc(receiverId).get();
      // model.Group group = model.Group.fromJson(groupSnapshot.data()!);
      // for (var id in group.membersUid) {
      //   await firestore.collection('call').doc(id).delete();
      // }
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }
}
