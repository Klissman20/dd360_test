import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/presentation/providers/characters_info_provider.dart';
import 'package:dd360_test/presentation/widgets/character_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  static const name = 'character-screen';

  final CharacterEntity character;
  const CharacterScreen({super.key, required this.character});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends ConsumerState<CharacterScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(characterComicsProvider.notifier).loadData(widget.character.id);
    ref.read(characterEventsProvider.notifier).loadData(widget.character.id);
    ref.read(characterSeriesProvider.notifier).loadData(widget.character.id);
    ref.read(characterStoriesProvider.notifier).loadData(widget.character.id);
  }

  @override
  void dispose() {
    ref.invalidate(characterComicsProvider);
    ref.invalidate(characterEventsProvider);
    ref.invalidate(characterSeriesProvider);
    ref.invalidate(characterStoriesProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<CharacterEntity> comics = ref.watch(characterComicsProvider);
    final List<CharacterEntity> events = ref.watch(characterEventsProvider);
    final List<CharacterEntity> series = ref.watch(characterSeriesProvider);
    final List<CharacterEntity> stories = ref.watch(characterStoriesProvider);

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(character: widget.character),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                const SizedBox(height: 10),
                DataHorizontalListView(characterData: comics, title: 'Comics'),
                DataHorizontalListView(characterData: events, title: 'Events'),
                DataHorizontalListView(characterData: series, title: 'Series'),
                DataHorizontalListView(
                    characterData: stories, title: 'Stories'),
              ],
            );
          }, childCount: 1))
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final CharacterEntity character;

  const _CustomSliverAppBar({required this.character});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      collapsedHeight: size.height * 0.2,
      pinned: true,
      foregroundColor: Colors.white,
      flexibleSpace: Stack(children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox.expand(
              child: Image.network(
                '${character.imageUrl}/detail.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        FlexibleSpaceBar(
          titlePadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          title: Text(
            character.name,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          background: Stack(children: [
            SizedBox.expand(
              child: Image.network(
                '${character.imageUrl}/detail.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          stops: [0.0, 0.3],
                          colors: [Colors.black87, Colors.transparent]))),
            ),
          ]),
        ),
      ]),
    );
  }
}
