import 'dart:developer';
import 'dart:io';

import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/home/entry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_system/test/common/repositories/common_firebase_storage_repository.dart';
import 'package:chat_system/test/common/utils/utils.dart';
import 'package:chat_system/test/features/auth/screens/user_information_screen.dart';
// import 'package:chat_system/mobile_layout_screen.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
  });

  Future<UserModel?> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromJson(userData.data()!);
    }
    return user;
  }

  void signInWithPhone(
      BuildContext context, String email, String password) async {
    // print(phoneNumber);
    try {
      final authCredential = await auth.createUserWithEmailAndPassword(
  email: "testuser@exampl.com",
  password: "testpassword123",
);

      if (authCredential.user != null) {
        log("User loggedin successfully");
        print(authCredential.user);
        // return authCredential.user!;
        Navigator.pushNamedAndRemoveUntil(
          context,
          UserInformationScreen.routeName,
          (route) => false,
        );
      } else {
        print("nulle---");
      }
      // if (authCredential.user != null) {
      //   log("User loggedin successfully");
      //   return authCredential.user!;
      // }
      // await auth.login(
      //   phoneNumber: phoneNumber,
      //   verificationCompleted: (PhoneAuthCredential credential) async {
      // await auth.signInWithCredential(credential);
      //   },
      //   verificationFailed: (e) {
      //     print(e.message);
      //     throw Exception(e.message);
      //   },
      //   codeSent: ((String verificationId, int? resendToken) async {
      //     Navigator.pushNamed(
      //       context,
      // OTPScreen.routeName,
      //       arguments: verificationId,
      //     );
      //   }),
      //   codeAutoRetrievalTimeout: (String verificationId) {
      //     print("e.message");
      //   },
      // );
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      print(e.message);
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context: context, content: e.message!);
    }
  }

  void saveUserDataToFirebase({
    required String name,
    required File? profilePic,
    required ProviderRef ref,
    required BuildContext context,
  }) async {
    try {
      String uid = auth.currentUser!.uid;
      String photoUrl =
          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png';

      if (profilePic != null) {
        photoUrl = await ref
            .read(commonFirebaseStorageRepositoryProvider)
            .storeFileToFirebase(
              'profilePic/$uid',
              profilePic,
            );
      }

      // var user = UserModel(
      //   name: name,
      //   uid: uid,
      //   profilePic: photoUrl,
      //   isOnline: true,
      //   phoneNumber: auth.currentUser!.phoneNumber!,
      //   groupId: [],
      // );

      // await firestore.collection('users').doc(uid).set(user.toJson());

      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const EntryPoint(),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }

  Stream<UserModel> userData(String userId) {
    return firestore.collection('users').doc(userId).snapshots().map(
          (event) => UserModel.fromJson(
            event.data()!,
          ),
        );
  }

  void setUserState(bool isOnline) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'isOnline': isOnline,
    });
  }
}
