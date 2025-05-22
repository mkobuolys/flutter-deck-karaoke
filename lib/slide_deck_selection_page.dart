import 'package:flutter/material.dart';

import 'slides_karaoke/slide_decks.dart';
import 'slides_karaoke/slides_karaoke.dart';

class SlideDeckSelectionPage extends StatefulWidget {
  const SlideDeckSelectionPage({super.key});

  @override
  State<SlideDeckSelectionPage> createState() => _SlideDeckSelectionPageState();
}

class _SlideDeckSelectionPageState extends State<SlideDeckSelectionPage> {
  String? _selectedSlideDeckId;

  void _onStart() {
    SlidesKaraoke.of(context).changePresentation(_selectedSlideDeckId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/flutter-friends-logo.png', width: 200),
              const SizedBox(height: 32.0),
              Text.rich(
                TextSpan(
                  text: 'Powerpoint',
                  children: const [
                    TextSpan(
                      text: ' flutter_deck karaoke!',
                      style: TextStyle(decoration: TextDecoration.none),
                    ),
                  ],
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Expanded(
                child: _SlideSelectionView(
                  selectedSlideDeckId: _selectedSlideDeckId,
                  onSelected: (value) {
                    setState(() => _selectedSlideDeckId = value);
                  },
                ),
              ),
              SizedBox(
                height: 50.0,
                width: 200.0,
                child: ElevatedButton(
                  onPressed: _selectedSlideDeckId != null ? _onStart : null,
                  child: const Text("Let's go!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SlideSelectionView extends StatefulWidget {
  const _SlideSelectionView({
    required this.selectedSlideDeckId,
    required this.onSelected,
  });

  final String? selectedSlideDeckId;
  final ValueSetter<String> onSelected;

  @override
  State<_SlideSelectionView> createState() => _SlideSelectionViewState();
}

class _SlideSelectionViewState extends State<_SlideSelectionView> {
  @override
  Widget build(BuildContext context) {
    const gap = 16.0;

    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) => Wrap(
          spacing: gap,
          runSpacing: gap,
          alignment: WrapAlignment.center,
          children: [
            for (final slideDeck in slideDecks)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight / 3 - gap,
                  maxWidth: constraints.maxWidth / 2 - gap,
                ),
                child: _SlideCard(
                  slideDeck: slideDeck,
                  selected: slideDeck.id == widget.selectedSlideDeckId,
                  onSelected: widget.onSelected,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SlideCard extends StatelessWidget {
  const _SlideCard({
    required this.slideDeck,
    required this.selected,
    required this.onSelected,
  });

  final SlideDeck slideDeck;
  final bool selected;
  final ValueSetter<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => onSelected(slideDeck.id),
      child: Card(
        color: selected ? colorScheme.primaryContainer : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              slideDeck.name,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: selected ? colorScheme.onPrimaryContainer : null,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
