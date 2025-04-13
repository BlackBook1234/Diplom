// import 'dart:io';

import 'package:chat_system/test/common/widgets/error.dart';
import 'package:chat_system/test/features/auth/screens/user_information_screen.dart';
// import 'package:chat_system/test/features/status/screens/confirm_status_screen.dart';
import 'package:chat_system/ui/screen/auth/views/login.dart';
import 'package:chat_system/ui/screen/auth/views/register.dart';
import 'package:chat_system/ui/screen/chat/views/group_chat.dart';
import 'package:chat_system/ui/screen/group/views/create_group.dart';
import 'package:chat_system/ui/screen/home/views/all_list.dart';
import 'package:chat_system/ui/screen/home/views/settings.dart';
import 'package:flutter/material.dart';

import 'ui/screen/chat/views/private_chat.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case SignupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => SignupScreen(),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );
    case SearchAllScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SearchAllScreen(),
      );

    case GroupChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        builder: (context) => GroupChatScreen(
          name: name,
          uid: uid,
          profilePic: profilePic,
        ),
      );
    case PrivateChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final profilePic = arguments['profilePic'];
      return MaterialPageRoute(
        builder: (context) => PrivateChatScreen(
          name: name,
          uid: uid,
          profilePic: profilePic,
        ),
      );
    // case ConfirmStatusScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmStatusScreen(
    //       file: file,
    //     ),
    //   );
    // case StatusScreen.routeName:
    //   final status = settings.arguments as Status;
    //   return MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       status: status,
    //     ),
    //   );
    case CreateGroupScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateGroupScreen(),
      );
    case SettingsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
