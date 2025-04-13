import 'package:chat_system/constants.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          width: 30,
          height: 30,
          child:
              CircularProgressIndicator(color: primaryColor, strokeWidth: 2)),
    );
  }
}
