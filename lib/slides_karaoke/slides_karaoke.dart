import 'package:flutter/widgets.dart';

import 'slides_karaoke_notifier.dart';

class SlidesKaraoke extends InheritedWidget {
  const SlidesKaraoke({
    required SlidesKaraokeNotifier notifier,
    required super.child,
    super.key,
  }) : _notifier = notifier;

  final SlidesKaraokeNotifier _notifier;

  void changePresentation(String? id) => _notifier.changePresentation(id);

  void reset() => _notifier.changePresentation(null);

  static SlidesKaraoke of(BuildContext context) {
    final slidesKaraoke =
        context.dependOnInheritedWidgetOfExactType<SlidesKaraoke>();

    assert(slidesKaraoke != null, 'No SlidesKaraoke found in context');

    return slidesKaraoke!;
  }

  @override
  bool updateShouldNotify(SlidesKaraoke oldWidget) =>
      _notifier != oldWidget._notifier;
}
