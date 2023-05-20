import 'package:coin_keeper_mobile/core/supabase_client.dart';
import 'package:coin_keeper_mobile/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';

import 'package:coin_keeper_mobile/providers/app_provider.dart';

class AuthState {
  final String? email;
  final String? password;

  const AuthState({this.email, this.password});
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._appNotifier) : super(const AuthState());

  final AppStateNotifier _appNotifier;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();

  Future<void> handleLoginWithCredentials() async {
    final response = await supabase.auth.signInWithPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    final user = User(
      id: response.user!.id,
      email: response.user!.email!,
    );

    _appNotifier.authenticate(user);
  }

  void handleLoginWithGoogle() {}
}

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(
    ref.read(appProvider.notifier),
  ),
);
