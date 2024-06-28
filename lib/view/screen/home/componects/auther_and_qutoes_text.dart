import 'package:adv_flutter_exam/view/provider/quotes_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Column authorAndQuotes(int index,QuotesProvider quotesProvider) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        quotesProvider
            .quotesModal!.resultsList[index].content,
        style: GoogleFonts.overlockSc(
          fontWeight: FontWeight.bold,
          fontSize: 40,
          height: 1.2,
          color: Colors.amber.shade300,
        ),
      ),
      Text(
        '- ${quotesProvider.quotesModal!.resultsList[index].author}',
        style: GoogleFonts.overlock(
          fontWeight: FontWeight.w300,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ],
  );
}
