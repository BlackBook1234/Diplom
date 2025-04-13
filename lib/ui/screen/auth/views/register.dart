import 'package:chat_system/constants.dart';
import 'package:chat_system/main_scaffold.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/screen/auth/views/login.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:chat_system/ui/widget/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const routeName = '/signup-screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final List<String> menuItems = ["Багш", "Оюутан"];
  String selectedMenu = "Оюутан";

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        setState(() {});
      },
      child: ScaffoldMonpay(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    context.read<AuthCubit>().pickImage();
                  },
                  child: context.read<AuthCubit>().image == null
                      ? const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child:
                              Icon(Icons.person, size: 70, color: secondColor),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              FileImage(context.read<AuthCubit>().image!),
                        ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    iconEnabledColor: Colors.black,
                    dropdownColor: Colors.white,
                    value: selectedMenu,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    items: menuItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(height: 0, color: Colors.transparent),
                    onChanged: (value) {
                      setState(() {
                        selectedMenu = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextfield(hintText: "Код", controller: nameController),
                const SizedBox(height: 20),
                CustomTextfield(hintText: "Емэйл", controller: emailController),
                const SizedBox(height: 20),
                CustomTextfield(
                    hintText: "Нууц үг",
                    controller: passwordController,
                    isPassword: true),
                const SizedBox(height: 100),
                PrimaryButton(
                  color: primaryColor,
                  width: double.infinity,
                  onPressed: () async {
                    context.read<AuthCubit>().signup(
                          context,
                          emailController.text,
                          passwordController.text,
                          nameController.text,
                          selectedMenu,
                        );
                  },
                  child: const Text(
                    "Бүртгүүлэх",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: const Text("Login"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
