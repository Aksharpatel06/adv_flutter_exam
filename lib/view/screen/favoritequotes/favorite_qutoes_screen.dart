import 'package:adv_flutter_exam/view/provider/quotes_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'componects/favorite_list_tile.dart';

class FavoriteQutoesScreen extends StatelessWidget {
  const FavoriteQutoesScreen({super.key, required this.quotesProvider});

  final QuotesProvider quotesProvider;

  @override
  Widget build(BuildContext context) {
    QuotesProvider quotesProviderFalse =
        Provider.of<QuotesProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Quotes',
          style: GoogleFonts.overpass(),
        ),
      ),
      body: ListView.builder(
        itemCount: quotesProvider.favoriteListString.length,
        itemBuilder: (context, index) {
          return favoriteListTile(index, quotesProviderFalse, quotesProvider);
        },
      ),
    );
  }
}
