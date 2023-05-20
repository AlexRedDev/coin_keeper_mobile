import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coin_keeper_mobile/core/app_theme.dart';
import 'material_inkwell.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.text,
    this.onTap,
    this.disabled = false,
    this.loading = false,
    super.key,
  });

  final String? text;
  final bool disabled;
  final bool loading;
  final void Function()? onTap;

  Color get bgColor {
    if (disabled) return AppTheme.colors.disabled;
    if (loading) return AppTheme.colors.secondaryText;

    return AppTheme.colors.accent;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 52.h,
      width: double.infinity,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14.sp),
      ),
      child: MaterialInkWell(
        borderRadius: BorderRadius.circular(14.sp),
        onTap: disabled || loading ? null : onTap,
        child: Stack(
          children: [
            Center(
              child: Text(
                text ?? '',
                style: GoogleFonts.lexend(fontSize: 16.sp),
              ),
            ),
            if (loading)
              Align(
                alignment: const Alignment(0.9, 0),
                child: SizedBox(
                  width: 22.h,
                  height: 22.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    color: Colors.black,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
