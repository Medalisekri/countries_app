import 'package:countries_api/screens/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();  // add this first
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MaterialApp(
    routes: {
      '/': (context) => CountryScreen(),
    },
  )));
}


