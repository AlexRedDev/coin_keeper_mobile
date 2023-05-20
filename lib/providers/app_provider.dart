import 'package:coin_keeper_mobile/core/supabase_client.dart';
import 'package:coin_keeper_mobile/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  authenticated,
  unauthenticated,
}

class AppState {
  final User? user;
  final AuthState authState;

  const AppState({
    this.user,
    this.authState = AuthState.unauthenticated,
  });

  AppState copyWith({
    User? user,
    AuthState? authState,
  }) =>
      AppState(
        user: user ?? this.user,
        authState: authState ?? this.authState,
      );
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier()
      : super(const AppState(authState: AuthState.unauthenticated));

  void init() {
    if (supabase.auth.currentUser != null) {
      final user = User(
        id: supabase.auth.currentUser!.id,
        email: supabase.auth.currentUser!.email,
      );

      state = state.copyWith(
        user: user,
        authState: AuthState.authenticated,
      );
    }
  }

  void authenticate(User user) {
    state = AppState(user: user, authState: AuthState.authenticated);
  }

  void logout() async {
    await supabase.auth.signOut();
    state = const AppState(authState: AuthState.unauthenticated);
  }
}

final appProvider = StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier()..init(),
);
