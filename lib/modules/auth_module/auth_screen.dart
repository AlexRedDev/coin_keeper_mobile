import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coin_keeper_mobile/widgets/primary_button.dart';
import 'package:coin_keeper_mobile/widgets/unfocus_wrapper.dart';

import 'widgets/auth_button.dart';
import 'widgets/sign_up_text.dart';
import 'widgets/logo.dart';
import 'auth_provider.dart';
import 'containers/sign_in_form.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: UnfocusWrapper(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    SizedBox(height: 30.h),
                    Text(
                      'Sign In',
                      style: GoogleFonts.lexend(
                          fontSize: 36.sp, fontWeight: FontWeight.w500),
                    ),
                    const Logo(),
                    const SignInForm(),
                    SizedBox(height: 42.h),
                    const PrimaryButton(text: 'Sign In'),
                    SizedBox(height: 48.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthButton('google', onTap: () {}),
                        SizedBox(width: 32.h),
                        AuthButton('apple', onTap: () {}),
                        SizedBox(width: 32.h),
                        AuthButton('facebook', onTap: () {}),
                      ],
                    ),
                  ],
                ),
                const SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
