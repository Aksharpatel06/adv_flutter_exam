import 'package:flutter/material.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../../../provider/quotes_provider.dart';

Row optionPageTools(QuotesProvider quotesProviderFalse, int index,QuotesProvider quotesProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            quotesProviderFalse
                .favoritesQutoesAdd(index);
          },
          icon: DecoratedIcon(
            icon: Icon(
              quotesProvider.isLikeList[index]?Icons.favorite:Icons.favorite_border,
              color: quotesProvider.isLikeList[index]
                  ? Colors.red
                  : Colors.white,
              size: 40,
            ),
            decoration: IconDecoration(
                border: IconBorder(
                    color: Colors.black, width: 2)),
          )),
      DecoratedIcon(
        icon: Icon(
          Icons.save,
          color: Colors.white,
          size: 40,
        ),
        decoration: IconDecoration(
            border: IconBorder(
                color: Colors.black, width: 2)),
      ),
      DecoratedIcon(
        icon: Icon(
          Icons.share,
          color: Colors.white,
          size: 40,
        ),
        decoration: IconDecoration(
            border: IconBorder(
                color: Colors.black, width: 2)),
      )
    ],
  );
}
