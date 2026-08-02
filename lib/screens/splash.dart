import 'package:countries_api/providers/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/country.dart';

class SplashScreen  extends ConsumerStatefulWidget {

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreen();}

class _SplashScreen extends ConsumerState<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    ref.listen(countryProvider, (previous, next) {
      if (!next.isLoading && next.countries.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/country');
      }
    });
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: Image.asset(
                'lib/core/assets/images/earth.jpg',
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 32),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}