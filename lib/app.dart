import 'package:coin_keeper_mobile/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:coin_keeper_mobile/modules/auth_module/auth_screen.dart';
import 'package:coin_keeper_mobile/modules/home_module/home_screen.dart';
import 'package:coin_keeper_mobile/providers/app_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return _Setup(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.data,
        home: const _StartScreen(),
      ),
    );
  }
}

class _Setup extends StatelessWidget {
  const _Setup({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (_, __) => builder.call(_),
      ),
    );
  }
}

class _StartScreen extends ConsumerWidget {
  const _StartScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appProvider);

    switch (state.authState) {
      case AuthState.authenticated:
        return const HomeScreen();
      case AuthState.unauthenticated:
        return const AuthScreen();
    }
  }
}
