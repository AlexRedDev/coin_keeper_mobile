import 'package:flutter/material.dart';
import 'package:coin_keeper_mobile/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await _initSupabase();

  runApp(const App());
}

Future<void> _initSupabase() async {
  final projectUrl = dotenv.get('PROJECT_URL');
  final anonKey = dotenv.get('ANON_KEY');

  await Supabase.initialize(url: projectUrl, anonKey: anonKey);
}
