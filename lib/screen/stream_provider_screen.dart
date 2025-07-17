import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/riverpod/state_stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamState = ref.watch(multipleStreamProvider);
    return DefaultLayout(
        title: 'StreamProviderScreen',
        body: Center(
          child: streamState.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator()),
        ));
  }
}
