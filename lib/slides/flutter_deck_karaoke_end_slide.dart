import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../slides_karaoke/slides_karaoke.dart';

class FlutterDeckKaraokeEndSlide extends FlutterDeckSlideWidget {
  const FlutterDeckKaraokeEndSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/thank-you',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Thank you!',
                  style: FlutterDeckTheme.of(context)
                      .bigFactSlideTheme
                      .titleTextStyle,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: SlidesKaraoke.of(context).reset,
                child: const Text('Reset'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
