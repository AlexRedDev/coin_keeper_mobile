import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UnfocusWrapper extends StatelessWidget {
  final Widget? child;

  const UnfocusWrapper({this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      dragStartBehavior: DragStartBehavior.down,
      onTap: () => FocusScope.of(context).unfocus(),
      onPanUpdate: (details) {
        if (details.delta.dy > 1) FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}

