import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coin_keeper_mobile/widgets/primary_button.dart';

import 'package:coin_keeper_mobile/providers/app_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appProvider = ref.read(appProvider.notifier);
    return Center();
    // return Scaffold(
    //   body: SafeArea(
    //     child: Center(
    //       child: PrimaryButton(
    //         text: 'logout',
    //         onTap: () async => _appProvider.logout(),
    //       ),
    //     ),
    //   ),
    // );
  }
}
