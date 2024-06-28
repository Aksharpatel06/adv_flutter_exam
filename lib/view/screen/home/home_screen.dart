import 'package:adv_flutter_exam/view/provider/quotes_provider.dart';
import 'package:adv_flutter_exam/view/screen/favoritequotes/favorite_qutoes_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'componects/auther_and_qutoes_text.dart';
import 'componects/option_page_tools.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.quotesProvider});

  final QuotesProvider quotesProvider;

  @override
  Widget build(BuildContext context) {
    QuotesProvider quotesProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Text(
          'Quotes',
          style: GoogleFonts.overpass(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavoriteQutoesScreen(
                          quotesProvider: quotesProvider,
                        )));
              },
              icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: (quotesProvider.quotesModal == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                quotesProvider.quotesModal!.resultsList.length,
                (index) {
                  quotesProvider.isLikeList.add(false);
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'asset/qutoes img/img${index % 6}.jfif'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          authorAndQuotes(index, quotesProvider),
                          optionPageTools(
                              quotesProviderFalse, index, quotesProvider)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
