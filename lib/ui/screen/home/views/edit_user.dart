import 'package:chat_system/constants.dart';
import 'package:chat_system/main_scaffold.dart';
import 'package:chat_system/test/models/responses/_responses.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:chat_system/ui/widget/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.groupData,
      required this.isGroupChat,
      required this.userData});
  final bool isGroupChat;
  final Group groupData;
  final UserModel userData;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    setState(() {
      if (widget.isGroupChat) {
        nameController.text = widget.groupData.name;
      } else {
        nameController.text = widget.userData.name;
        emailController.text = widget.userData.email;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        setState(() {});
      },
      child: ScaffoldMonpay(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Text(
                "Хэрэглэгчийн мэдээлэл",
                style: TextStyle(
                  color: kTextDark,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextfield(
                  hintText: widget.isGroupChat ? "Нэр" : "Код",
                  controller: nameController),
              const SizedBox(height: 20),
              if (widget.isGroupChat)
                CustomTextfield(hintText: "Емэйл", controller: emailController),
              Expanded(child: SizedBox.shrink()),
              PrimaryButton(
                color: primaryColor,
                width: double.infinity,
                onPressed: () async {
                  // context.read<AuthCubit>().signup(
                  //       context,
                  //       emailController.text,
                  //       passwordController.text,
                  //       nameController.text,
                  //       nameController.text.startsWith("B")
                  //           ? selectedMenuStudent
                  //           : selectedMenuTeacher,
                  //     );
                },
                child: const Text(
                  "Засах",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
