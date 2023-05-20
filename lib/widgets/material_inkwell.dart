import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coin_keeper_mobile/core/app_theme.dart';

class MaterialInkWell extends StatelessWidget {
  const MaterialInkWell({
    required this.child,
    this.borderRadius,
    this.padding,
    this.splashColor,
    this.onTap,
    super.key,
  });

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Color? splashColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(15.sp);
    final padding = this.padding ?? EdgeInsets.zero;
    final splashColor = this.splashColor ?? AppTheme.colors.splash;

    return Material(
      color: Colors.transparent,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: splashColor,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
