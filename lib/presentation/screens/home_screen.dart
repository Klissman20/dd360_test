import 'package:dd360_test/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dd360_test/presentation/providers/characters_provider.dart';
import 'package:dd360_test/presentation/providers/initial_loading_provider.dart';
import 'package:dd360_test/presentation/widgets/shared/full_screen_loader.dart';

import 'package:dd360_test/presentation/widgets/character_list_view.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const CustomAppBar(),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(characterListProvider.notifier).fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final characters = ref.watch(characterListProvider);

    return CharacterListView(characterList: characters);
  }
}
