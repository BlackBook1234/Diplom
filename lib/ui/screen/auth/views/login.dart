import 'dart:developer';

import 'package:chat_system/constants.dart';
import 'package:chat_system/main_scaffold.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/auth/views/register.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:chat_system/ui/widget/common/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = '/login-screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return KeyboardDismissOnTap(
      child: ScaffoldMonpay(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image.asset(
                  "assets/logo2.png",
                  height: 80,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("SChool chat",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: primaryColor)),
                    Text("Live",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.black)),
                  ],
                ),
                SizedBox(height: 100),
                CustomTextfield(
                  hintText: "Емэйл",
                  controller: emailController,
                ),
                SizedBox(height: 18),
                CustomTextfield(
                  hintText: "Нууц үг",
                  controller: passwordController,
                  isPassword: true,
                ),
                SizedBox(height: 100),
                PrimaryButton(
                  width: double.infinity,
                  onPressed: () async {
                    try {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<AuthCubit>().login(context,
                            emailController.text, passwordController.text);
                      }
                    } on FirebaseAuthException catch (e) {
                      log(e.toString());
                      // context.showSnackbar(e.toString());
                    } catch (e) {
                      log(e.toString());
                      // context.showSnackbar(e.toString());
                    }
                  },
                  color: primaryColor,
                  child: Text("Нэвтрэх",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                        child: Text(
                          "Signup",
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
