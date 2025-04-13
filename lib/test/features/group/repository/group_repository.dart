import 'dart:io';

import 'package:chat_system/test/common/repositories/common_firebase_storage_repository.dart';
import 'package:chat_system/test/common/utils/utils.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final groupRepositoryProvider = Provider(
  (ref) => GroupRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
    ref: ref,
  ),
);

class GroupRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final ProviderRef ref;
  GroupRepository({
    required this.firestore,
    required this.auth,
    required this.ref,
  });

  void createGroup(BuildContext context, String name, File profilePic,
      List<String> selectedContact) async {
    try {
      List<String> uids = [];
      for (int i = 0; i < selectedContact.length; i++) {
        var userCollection = await firestore
            .collection('users')
            .where('email', isEqualTo: selectedContact[i])
            .get();

        if (userCollection.docs.isNotEmpty && userCollection.docs[0].exists) {
          uids.add(userCollection.docs[0].data()['uid']);
        }
      }
      var groupId = const Uuid().v1();

      String profileUrl = await ref
          .read(commonFirebaseStorageRepositoryProvider)
          .storeFileToFirebase(
            'group/$groupId',
            profilePic,
          );
      Group group = Group(
        senderId: auth.currentUser!.uid,
        name: name,
        groupId: groupId,
        lastMessage: '',
        groupPic: profileUrl,
        membersUid: [auth.currentUser!.uid, ...uids],
        timeSent: DateTime.now().millisecondsSinceEpoch,
      );

      await firestore.collection('groups').doc(groupId).set(group.toJson());
    } catch (e) {
      if (!context.mounted) return;
      showSnackBar(context: context, content: e.toString());
    }
  }
}
