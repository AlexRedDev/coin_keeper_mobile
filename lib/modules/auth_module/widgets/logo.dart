import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coin_keeper_mobile/widgets/focus_listener.dart';
import 'package:coin_keeper_mobile/widgets/svg_view.dart';

import '../auth_provider.dart';

class Logo extends ConsumerWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authProvider.notifier);

    return FocusListener(
      focusNode: notifier.focusNode,
      builder: (hasFocus) {
        return AnimatedSize(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 350),
          child: hasFocus
              ? const SizedBox()
              : Column(
                  children: [
                    SizedBox(height: 84.h),
                    const SvgView('logo'),
                    SizedBox(height: 86.h),
                  ],
                ),
        );
      },
    );
  }
}
