import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CharacterListView extends StatefulWidget {
  final List<CharacterEntity> characterList;
  const CharacterListView({super.key, required this.characterList});

  @override
  State<CharacterListView> createState() => _CharacterListViewState();
}

class _CharacterListViewState extends State<CharacterListView> {
  final scrollConstroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          controller: scrollConstroller,
          itemCount: widget.characterList.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInDown(
                child: _Slide(character: widget.characterList[index]));
          },
        ))
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  final CharacterEntity character;
  const _Slide({required this.character});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: _CharacterImage(imageUrl: character.imageUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Text(
              character.name,
              maxLines: 2,
              style: textStyle.titleLarge,
            ),
          ),
        ]),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final getImageUrl = (imageUrl.endsWith('available'))
        ? '$imageUrl.jpg'
        : '$imageUrl/standard_xlarge.jpg';

    return Image.network(
      getImageUrl,
      fit: BoxFit.cover,
      width: 150,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
        return FadeInRight(child: child);
      },
      errorBuilder: (context, exception, stackTrace) {
        return Image.network(
            'https://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available.jpg');
      },
    );
  }
}
