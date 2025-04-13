import 'package:chat_system/constants.dart';
import 'package:chat_system/ui/screen/auth/cubit/auth_cubit.dart';
import 'package:chat_system/ui/widget/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = '/Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController name = TextEditingController();

  @override
  void initState() {
    setState(() {
      name.text = context.read<AuthCubit>().state.userInfo.name;
      email.text = context.read<AuthCubit>().state.userInfo.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: state.userInfo.profilePic == ""
                    ? Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: primaryColor,
                            child: Icon(Icons.person,
                                color: Colors.white, size: 80),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              child: CircleAvatar(
                                backgroundColor: secondColor,
                                radius: 16,
                                child: Icon(Icons.camera_alt_outlined,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        width: 90,
                        height: 90,
                        child: ClipOval(
                          child: Image.network(
                            state.userInfo.profilePic,
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              Text(
                "Нэр",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              TextfieldWidget(controller: name),
              SizedBox(height: 24),
              Text(
                "Емэйл",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              TextfieldWidget(controller: email),
            ],
          ),
        ),
      );
    });
  }
}
