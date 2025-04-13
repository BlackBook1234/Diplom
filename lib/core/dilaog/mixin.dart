import 'package:chat_system/core/dilaog/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'error_dialog.dart';
import 'success_dialog.dart';

Future<Object?> showErrorDialog(
    {required BuildContext context,
    String message = "",
    String title = ""}) async {
  return await showDialog(
    context: context,
    builder: (ctx) => ErrorDialog(
      title: 'Алдаа',
      message: message,
    ),
  );
  // }
  // return Future.value(null);
}

Future<S?> showSuccessDialog<S>(
    BuildContext context, String title, bool popup, String message) {
  if (Navigator.canPop(context)) {
    return showDialog<S>(
      useSafeArea: popup,
      context: context,
      builder: (ctx) => KSuccessDialog(
        title: title,
        message: message,
      ),
    );
  }
  return Future.value(null);
}

Future<S?> showSuccessPopDialog<S>(BuildContext context, String title,
    bool popup, bool close, String message) {
  if (Navigator.canPop(context)) {
    return showDialog<S>(
      useSafeArea: popup,
      context: context,
      builder: (ctx) => KSuccessDialog(
        button: close,
        title: title,
        message: message,
      ),
    );
  }
  return Future.value(null);
}

// Future<S?> showWarningDialog<S>(BuildContext context, String message) {
//   if (Navigator.canPop(context)) {
//     return showDialog<S>(
//       context: context,
//       builder: (ctx) => WarningDialog(
//         title: 'Анхаар',
//         message: message,
//       ),
//     );
//   }
//   return Future.value(null);
// }

mixin BaseStateMixin<T extends StatefulWidget> on State<T> {
  Future<S?> showLogOutDialog<S>(String desc, Function() onPressedSubmit) {
    if (mounted) {
      return showDialog<S>(
        context: context,
        builder: (ctx) => CustomDialog(
          title: 'Анхаар',
          desc: desc,
          onPressedSubmit: onPressedSubmit,
          type: 1,
        ),
      );
    }
    return Future.value(null);
  }
}
 