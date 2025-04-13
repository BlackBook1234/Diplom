import 'dart:developer';
import 'dart:io';

import 'package:chat_system/core/dilaog/mixin.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/home/entry.dart';
import 'package:chat_system/ui/widget/common/interface.dart';
import 'package:chat_system/ui/widget/common/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

// Freezed part files
part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';
// My part files
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());
  final _auth = FirebaseAuth.instance;
  final _fire = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _picker = ImagePicker();
  File? image;

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      Loading.show();
      final authCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Loading.close();
      if (authCredential.user != null) {
        loadUser(context, authCredential.user!.uid);
      }
    } on FirebaseAuthException catch (e) {
      Loading.close();
      if (context.mounted) {
        await showErrorDialog(context: context, message: e.message ?? "");
      }
    } catch (e) {
      Loading.close();
      if (context.mounted) {
        showErrorDialog(context: context, message: "");
      }
    }
    Loading.close();
  }

  Future<void> pickImage() async {
    final pic = await _picker.pickImage(source: ImageSource.gallery);

    if (pic != null) {
      image = File(pic.path);
    }
  }

  Future<void> signup(BuildContext context, String email, String password,
      String name, String role) async {
    String? downloadUrl;
    try {
      Loading.show();
      final authCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authCredential.user != null) {
        if (image != null) {
          downloadUrl = await uploadImage(image!);
        }
        UserModel user = UserModel(
            uid: authCredential.user!.uid,
            name: name,
            role: role,
            email: authCredential.user!.email!,
            profilePic: downloadUrl ?? "");

        await _fire.collection("users").doc(user.uid).set(user.toJson());
        Loading.close();
        await showSuccessDialog(
            context, "Амжилттай", true, "Хэрэглэгч бүртгэгдлээ");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Loading.close();
      showErrorDialog(context: context, message: e.message ?? "");
    } catch (e) {
      Loading.close();
      showErrorDialog(context: context, message: "");
    }
  }

  Future<void> loadUser(BuildContext context, String uid) async {
    try {
      final res = await _fire.collection("users").doc(uid).get();
      if (res.data() != null) {
        emit(state.copyWith(userInfo: UserModel.fromJson(res.data()!)));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(),
          ),
          (route) => false,
        );
      }
    } catch (e) {
      // rethrow;
    }
  }

  Stream<List<UserModel>> getAllUser() {
    try {
      return _fire.collection("users").snapshots().map((event) {
        List<UserModel> models = [];
        for (var doc in event.docs) {
          var group = UserModel.fromJson(doc.data());
          models.add(group);
        }
        return models;
      });
    } catch (e) {
      log("Error fetching users: $e");
      rethrow;
    }
  }

  Future<String> uploadImage(File image) async {
    try {
      Reference ref =
          _storage.ref("images/${DateTime.now().millisecondsSinceEpoch}");

      final task = await ref.putFile(image);

      String downloadUrl = await task.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setUserState(bool isOnline) async {
    await _fire.collection('users').doc(state.userInfo.uid).update({
      'isOnline': isOnline,
    });
  }

  clearUser() {
    emit(state.copyWith(userInfo: UserModel(), userList: []));
  }
}
