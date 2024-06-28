import 'package:adv_flutter_exam/view/provider/quotes_provider.dart';
import 'package:adv_flutter_exam/view/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => QuotesProvider(),
    )
  ], child: const QuotesApp()));
}

class QuotesApp extends StatelessWidget {
  const QuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesProvider quotesProvider = Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(quotesProvider: quotesProvider,),
    );
  }
}
