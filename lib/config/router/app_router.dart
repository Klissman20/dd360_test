import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            name: CharacterScreen.name,
            path: 'character',
            builder: (context, state) {
              final CharacterEntity character = state.extra as CharacterEntity;
              return CharacterScreen(character: character);
            }),
      ]),
]);
