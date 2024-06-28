import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../../../provider/quotes_provider.dart';

Padding favoriteListTile(int index, QuotesProvider quotesProviderFalse,QuotesProvider quotesProvider) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      leading: Container(
        height: 50,
        width: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        child: Text(
          '${index + 1}',
          style: GoogleFonts.overpass(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        quotesProvider
            .favoriteListString[index],
        maxLines: 2,
        style: GoogleFonts.overlockSc(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: 1.2,
        ),
      ),
      trailing: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            quotesProviderFalse
                .favoritesRemove(index);
          },
          icon: const DecoratedIcon(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
            decoration: IconDecoration(
                border: IconBorder(
                    color: Colors.black, width: 2)),
          )),
    ),
  );
}
