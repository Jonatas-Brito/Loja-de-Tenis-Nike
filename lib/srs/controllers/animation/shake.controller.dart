import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    Key key,
    this.duration = const Duration(milliseconds: 900),
    this.child,
    this.axis = Axis.horizontal,
    this.curve,
    this.offset = 00.0,
  }) : super(key: key);
  final Widget child;
  final Curve curve;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: child,
      duration: duration,
      curve:
          curve == Curves.elasticOut ? Curves.elasticOut : Curves.easeInOutBack,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(
                  value * offset,
                  0.0,
                )
              : Offset(
                  0.0,
                  value * offset,
                ),
          child: child,
        );
      },
    );
  }
}
