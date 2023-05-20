import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coin_keeper_mobile/core/app_theme.dart';
import 'package:coin_keeper_mobile/widgets/material_inkwell.dart';
import 'package:coin_keeper_mobile/widgets/svg_view.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      this.icon, {
        this.onTap,
        super.key,
      });

  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: AppTheme.colors.border)
      ),
      child: MaterialInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.sp),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 12.h,
        ),
        child: SvgView(icon),
      ),
    );
  }
}
