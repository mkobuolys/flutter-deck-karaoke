import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterDeckKaraokeImageSlide extends FlutterDeckSlideWidget {
  FlutterDeckKaraokeImageSlide({
    required this.imageId,
    required this.slideDeckId,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/$slideDeckId-$imageId',
          ),
        );

  final String imageId;
  final String slideDeckId;

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) {
        return Image.asset('assets/$slideDeckId/$imageId.png');
      },
    );
  }
}
