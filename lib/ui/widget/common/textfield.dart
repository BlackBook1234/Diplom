import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.focusNode,
      this.controller,
      this.hintText,
      this.onChanged,
      this.onTap,
      this.isPassword = false,
      this.isChatText = false,
      this.isSearch = false});

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;
  final bool isSearch;
  final bool isChatText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
        controller: controller,
        onChanged: onChanged,
        focusNode: focusNode,
        obscureText: isPassword,
      ),
    );
  }
}

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget(
      {super.key,
      this.focusNode,
      this.controller,
      this.hintText,
      this.onChanged,
      this.onTap,
      this.isPassword = false,
      this.isChatText = false,
      this.isSearch = false});

  final void Function(String)? onChanged;
  final String? hintText;
  final FocusNode? focusNode;
  final bool isSearch;
  final bool isChatText;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        maxLength: 30,
        enabled: true,
        controller: controller,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(fontSize: 14),
          counterText: '',
          focusedErrorBorder: InputBorder.none,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          floatingLabelStyle: const TextStyle(
            decoration: TextDecoration.none,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorBorder: InputBorder.none,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
          ),
          alignLabelWithHint: true,
          focusColor: Colors.transparent,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
