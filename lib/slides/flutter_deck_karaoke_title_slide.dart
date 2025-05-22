import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterDeckKaraokeTitleSlide extends FlutterDeckSlideWidget {
  const FlutterDeckKaraokeTitleSlide({
    required this.title,
    required this.createdBy,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/title',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  final String title;
  final String createdBy;

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(title: title, subtitle: createdBy);
  }
}
