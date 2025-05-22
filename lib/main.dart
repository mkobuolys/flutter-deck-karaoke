import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'slide_deck_selection_page.dart';
import 'slides_karaoke/slides_karaoke.dart';
import 'slides_karaoke/slides_karaoke_notifier.dart';

void main() {
  runApp(_FlutterDeckSlidesKaraoke(notifier: SlidesKaraokeNotifier()));
}

class _FlutterDeckSlidesKaraoke extends StatelessWidget {
  const _FlutterDeckSlidesKaraoke({
    required this.notifier,
  });

  final SlidesKaraokeNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SlidesKaraoke(
      notifier: notifier,
      child: ValueListenableBuilder(
        valueListenable: notifier,
        builder: (context, selectedSlideDeck, child) {
          return selectedSlideDeck == null
              ? const _SlideDeckSelectionApp()
              : _FlutterDeckApp(slides: selectedSlideDeck.slides);
        },
      ),
    );
  }
}

class _SlideDeckSelectionApp extends StatelessWidget {
  const _SlideDeckSelectionApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFED2CC)),
      ),
      home: const SlideDeckSelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _FlutterDeckApp extends StatelessWidget {
  const _FlutterDeckApp({
    required this.slides,
  });

  final List<FlutterDeckSlideWidget> slides;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        footer: FlutterDeckFooterConfiguration(showSlideNumbers: true),
      ),
      slides: slides,
    );
  }
}
