import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:coin_keeper_mobile/core/app_theme.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Don’t have on Account? ',
              style: GoogleFonts.lexend(
                fontSize: 14,
                color: AppTheme.colors.primaryText,
                fontWeight: FontWeight.w300,
              )),
          TextSpan(
            text: 'Sign Up',
            style: GoogleFonts.lexend(
              fontSize: 14,
              color: AppTheme.colors.secondaryText,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
