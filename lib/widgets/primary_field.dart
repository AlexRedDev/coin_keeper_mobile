import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coin_keeper_mobile/core/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coin_keeper_mobile/widgets/material_inkwell.dart';
import 'package:coin_keeper_mobile/widgets/svg_view.dart';

class PrimaryField extends StatefulWidget {
  const PrimaryField({
    this.label,
    this.hintText,
    this.focusNode,
    this.controller,
    this.textInputType,
    this.obscure = false,
    super.key,
  });

  final bool obscure;
  final String? label;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextEditingController? controller;

  @override
  State<PrimaryField> createState() => _PrimaryFieldState();
}

class _PrimaryFieldState extends State<PrimaryField> {
  late final focus = widget.focusNode ?? FocusNode();

  bool hasFocus = false;
  bool textVisible = false;
  bool obscure = false;

  void hideText() {
    setState(() {
      textVisible = !textVisible;
      obscure = !obscure;
    });
  }

  void focusListener() {
    setState(() => hasFocus = focus.hasFocus);
  }

  @override
  void initState() {
    obscure = widget.obscure;
    focus.addListener(focusListener);
    super.initState();
  }

  @override
  void dispose() {
    focus.removeListener(focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focus,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label(widget.label),
          SizedBox(height: 12.h),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 52.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.sp),
              border: Border.all(
                  color: hasFocus
                      ? AppTheme.colors.accent
                      : AppTheme.colors.border,
                  width: 1.w),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: obscure,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    style: GoogleFonts.lexend(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.colors.primaryText,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      contentPadding: EdgeInsets.only(bottom: 2.h),
                      hintStyle: GoogleFonts.lexend(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: AppTheme.colors.hintText,
                      ),
                    ),
                  ),
                ),
                if (widget.obscure)
                  _ObscureIcon(isHide: textVisible, onTap: hideText)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: Text(
        text ?? '',
        style: GoogleFonts.lexend(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class _ObscureIcon extends StatelessWidget {
  const _ObscureIcon({this.isHide = false, this.onTap});

  final bool isHide;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isHide
            ? SvgView('eye', color: AppTheme.colors.accent)
            : SvgView('eye', key: UniqueKey()),
      ),
    );
  }
}
