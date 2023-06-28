import 'package:dd360_test/presentation/providers/characters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step = ref.watch(characterListProvider).isEmpty;
  if (step) return true;
  return false;
});
