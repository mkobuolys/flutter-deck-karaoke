import 'package:flutter_deck/flutter_deck.dart';

import '../slides/slides.dart';

class SlideDeck {
  const SlideDeck({
    required this.id,
    required this.name,
    required this.slides,
  });

  final String id;
  final String name;
  final List<FlutterDeckSlideWidget> slides;
}

final slideDecks = <SlideDeck>[
  _createSlideDeck(
    id: 'flutter-is-dead',
    name: 'Flutter is dead',
    createdBy: 'by Delulu Developer',
  ),
  _createSlideDeck(
    id: 'flutter-and-friends',
    name: 'Flutter & Friends',
    createdBy: 'by Lu(c/k)as(z) van Dijk',
  ),
  _createSlideDeck(
    id: 'state-management',
    name: 'State management',
    createdBy: 'by GetX Guru',
  ),
  _createSlideDeck(
    id: 'is-dash-swedish',
    name: 'Is Dash Swedish?',
    createdBy: 'by Volvo Ikeabba',
  ),
];

SlideDeck _createSlideDeck({
  required String id,
  required String name,
  required String createdBy,
}) {
  return SlideDeck(
    id: id,
    name: name,
    slides: [
      FlutterDeckKaraokeTitleSlide(title: name, createdBy: createdBy),
      for (var i = 1; i < 9; i++)
        FlutterDeckKaraokeImageSlide(imageId: '$i', slideDeckId: id),
      const FlutterDeckKaraokeEndSlide(),
    ],
  );
}
