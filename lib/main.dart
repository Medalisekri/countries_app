import 'package:countries_api/screens/country.dart';
import 'package:countries_api/screens/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      textTheme: GoogleFonts.poppinsTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => CountryScreen(),
      '/detail':(context)=> CountryDetailScreen(),
    },
  )));
}


