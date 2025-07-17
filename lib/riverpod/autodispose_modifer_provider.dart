import 'package:flutter_riverpod/flutter_riverpod.dart';

final autodisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(3, (index) => index * index);
});