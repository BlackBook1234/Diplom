// import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/widget/common/interface.dart';
// import 'package:chat_system/ui/widget/common/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Freezed part files
part 'home_cubit.freezed.dart';
part 'home_cubit.g.dart';
// My part files
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  // final _auth = FirebaseAuth.instance;
  final _fire = FirebaseFirestore.instance;
  // final _storage = FirebaseStorage.instance;
  // final _picker = ImagePicker();

  void addEmail(String email) {
    emit(state.copyWith(emailList: [...state.emailList, email]));
  }

  void clearEmailList() {
    emit(state.copyWith(emailList: []));
  }

  void onItemTapped(int index) {
    emit(state.copyWith(index: index));
  }

  // void getChatContacts(BuildContext context) {
  //   _fire
  //       .collection('users')
  //       .doc(context.read<AuthCubit>().state.userInfo.uid)
  //       .collection('chats')
  //       .snapshots()
  //       .asyncMap((event) async {
  //     List<ChatContact> contacts = [];
  //     for (var document in event.docs) {
  //       var chatContact = ChatContact.fromJson(document.data());
  //       var userData =
  //           await _fire.collection('users').doc(chatContact.contactId).get();
  //       var user = UserModel.fromJson(userData.data()!);

  //       contacts.add(
  //         ChatContact(
  //           name: user.name,
  //           profilePic: user.profilePic,
  //           contactId: chatContact.contactId,
  //           timeSent: chatContact.timeSent,
  //           lastMessage: chatContact.lastMessage,
  //         ),
  //       );
  //     }
  //     emit(state.copyWith(contacts: contacts));
  //   });
  // }

  // void getChatGroups(String uid) {
  //   _fire.collection('groups').snapshots().map((event) {
  //     List<Group> groups = [];
  //     for (var document in event.docs) {
  //       var group = Group.fromJson(document.data());
  //       if (group.membersUid.contains(uid)) {
  //         groups.add(group);
  //       }
  //     }
  //     emit(state.copyWith(groups: groups));
  //   });
  // }

  Stream<List<Group>> getChatGroups(String uid, bool isMy) {
    return _fire.collection('groups').snapshots().map((event) {
      List<Group> groups = [];
      for (var document in event.docs) {
        var group = Group.fromJson(document.data());
        if (isMy) {
          if (group.membersUid.contains(uid)) {
            groups.add(group);
          }
        } else {
          groups.add(group);
        }
      }
      return groups;
    });
  }

  Stream<List<ChatContact>> getChatContacts(String uid) {
    return _fire
        .collection('users')
        .doc(uid)
        .collection('chats')
        .snapshots()
        .asyncMap((event) async {
        
      List<ChatContact> contacts = [];
      for (var document in event.docs) {
        var chatContact = ChatContact.fromJson(document.data());
        var userData =
            await _fire.collection('users').doc(chatContact.contactId).get();
        var user = UserModel.fromJson(userData.data()!);

        contacts.add(
          ChatContact(
            isOnline: user.isOnline,
            name: user.name,
            profilePic: user.profilePic,
            contactId: chatContact.contactId,
            timeSent: chatContact.timeSent,
            lastMessage: chatContact.lastMessage,
          ),
        );
      }
      return contacts;
    });
  }
}
