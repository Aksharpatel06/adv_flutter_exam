import 'dart:async';

import 'package:adv_flutter_exam/view/provider/quotes_provider.dart';
import 'package:adv_flutter_exam/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.quotesProvider});

  final QuotesProvider quotesProvider;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  HomeScreen(quotesProvider: widget.quotesProvider,),
        ));
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/app_logo/app_logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
