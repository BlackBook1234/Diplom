import 'package:chat_system/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    required this.color,
    this.width = 100,
    this.padding = const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 6.0),
    this.height = 48.0,
    this.borderRadius = 12.0,
    this.disabled = false,
    this.smoothCorner = false,
  });
  final Widget child;
  final Color color;
  final double width;
  final bool smoothCorner;
  final void Function() onPressed;
  final double height;
  final EdgeInsets padding;
  final double borderRadius;
  final bool disabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final buttonStatus = isLoading || !disabled ? false : true;
    Decoration containerDecoration = ShapeDecoration(
      color: isLoading
          ? primaryColor.withOpacity(0.2)
          : !buttonStatus
              ? color
              : primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );

    Widget body = AnimatedContainer(
      height: height,
      width: width,
      duration: const Duration(milliseconds: 300),
      decoration: containerDecoration,
      padding: padding,
      child: Align(
        widthFactor: 1.0,
        child: isLoading
            ? SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.white,
                  color: primaryColor,
                ),
              )
            : child,
      ),
    );

    if (!buttonStatus) {
      body = TouchableScale(
        onPressed: onPressed,
        child: body,
      );
    }
    return body;
  }
}

class TouchableScale extends StatefulWidget {
  const TouchableScale({
    super.key,
    required this.child,
    this.onPressed,
    this.transformationAlignment = Alignment.center,
  });
  final Widget child;
  final VoidCallback? onPressed;
  final Alignment transformationAlignment;
  @override
  State<TouchableScale> createState() => _TouchableScaleState();
}

class _TouchableScaleState extends State<TouchableScale>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(TouchableScale old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = 0.92;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!isDown) {
      isDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (isDown) {
      isDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (isDown) {
      isDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = isDown;
    final TickerFuture ticker = isDown
        ? _animationController.animateTo(1.0,
            duration: kFadeOutDuration, curve: Curves.easeInOutCubicEmphasized)
        : _animationController.animateTo(0.0,
            duration: kFadeInDuration, curve: Curves.easeOutCubic);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != isDown) {
        _animate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, _) {
            return Transform.scale(
              scale: _opacityAnimation.value,
              alignment: widget.transformationAlignment,
              child: widget.child,
            );
          },
        ),
      ),
    );
  }
}
