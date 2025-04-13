import 'package:chat_system/constants.dart';
import 'package:chat_system/core/dilaog/pi.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:flutter/material.dart';
import 'components/dialog_box.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    var bodyStyle = const TextStyle(
      color: kTextMedium,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
    return DialogEntryAnimation(
      child: DialogBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Icon(
                Icons.dangerous,
                color: kDanger,
                size: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kTextDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                message,
                maxLines: 8,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: bodyStyle,
              ),
            ),
            Row(
              children: [
                PrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  color: kTextMedium,
                  child: const Text(
                    'Хаах',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ].map((e) => Expanded(child: e)).spaceBetween(12.0),
            ),
          ],
        ),
      ),
    );
  }
}