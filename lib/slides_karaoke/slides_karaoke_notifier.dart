import 'package:flutter/material.dart';

import 'slide_decks.dart';

class SlidesKaraokeNotifier extends ValueNotifier<SlideDeck?> {
  SlidesKaraokeNotifier() : super(null);

  void changePresentation(String? id) {
    value = id != null
        ? slideDecks.firstWhere((slideDeck) => slideDeck.id == id)
        : null;
  }
}
