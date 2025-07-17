import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/riverpod/autodispose_modifer_provider.dart';

class AutoDisposeProviderScreen extends ConsumerWidget {
  const AutoDisposeProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeState = ref.watch(autodisposeModifierProvider);
    return DefaultLayout(
        title: 'AutoDisposeProviderScreen',
        body: Column(
          children: [
            autoDisposeState.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator(),
            )
          ],
        ));
  }
}
