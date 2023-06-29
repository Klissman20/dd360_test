import 'package:animate_do/animate_do.dart';
import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:flutter/material.dart';

class DataHorizontalListView extends StatefulWidget {
  final List<CharacterEntity> characterData;
  final String? title;

  const DataHorizontalListView(
      {super.key, required this.characterData, this.title});

  @override
  State<DataHorizontalListView> createState() => _DataHorizontalListViewState();
}

class _DataHorizontalListViewState extends State<DataHorizontalListView> {
  final scrollConstroller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null) _Title(title: widget.title),
          Expanded(
              child: ListView.builder(
            controller: scrollConstroller,
            itemCount: widget.characterData.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return FadeInRight(
                  child: _Slide(character: widget.characterData[index]));
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final CharacterEntity character;
  const _Slide({required this.character});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: (character.imageUrl != null)
                ? Image.network(
                    '${character.imageUrl}/detail.jpg',
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
                  )
                : const SizedBox(),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 150,
          child: Text(
            character.name,
            maxLines: 2,
            style: textStyle.titleSmall,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_half_outlined,
              color: Colors.yellow.shade800,
            ),
            const SizedBox(
              width: 3,
            ),

            // Text('${movie.popularity}', style: textStyle.bodySmall)
          ],
        )
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
