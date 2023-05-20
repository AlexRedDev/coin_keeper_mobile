import 'package:coin_keeper_mobile/modules/auth_module/auth_provider.dart';
import 'package:coin_keeper_mobile/widgets/primary_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authProvider.notifier);
    return Focus(
      focusNode: notifier.focusNode,
      child: Column(
        children: [
          PrimaryField(
            label: 'Email',
            hintText: 'example@email.com',
            controller: notifier.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 32.h),
          PrimaryField(
            obscure: true,
            label: 'Password',
            hintText: 'You password',
            controller: notifier.passwordController,
          ),
        ],
      ),
    );
  }
}
