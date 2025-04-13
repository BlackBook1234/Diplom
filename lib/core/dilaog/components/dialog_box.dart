import 'package:chat_system/core/dilaog/pi.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200.0,
              maxHeight: 450.0,
              minWidth: 280.0,
              maxWidth: 280.0,
            ),
            child: Material(
              color: Colors.white,
              shape: SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 24.0,
                  cornerSmoothing: 0.7,
                ),
              ),
              elevation: 16.0,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Доороос дээшээ гарч ирдэг animation.
class DialogEntryAnimation extends StatelessWidget {
  const DialogEntryAnimation({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      builder: (ctx, animation, _) => FractionalTranslation(
        translation: Offset(0.0, lerp(1.0, 0.0, animation)),
        child: Transform.scale(
          scale: lerp(1.0, 1.0, animation),
          child: child,
        ),
      ),
    );
  }
}
