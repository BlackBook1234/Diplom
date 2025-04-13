import 'package:chat_system/test/common/widgets/loader.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/auth/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loader());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        }
        if (user == null) {
          return const LoginScreen();
        } else {
          context.read<AuthCubit>().loadUser(context, user.uid);
          return Loader();
        }
      },
    );
  }
}
