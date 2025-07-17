import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/riverpod/family_modifier_provider.dart';

class FamilyModiferScreen extends ConsumerWidget {
  const FamilyModiferScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef re) {
    final familyModiferState = re.watch(familyModiferProvider(2));
    return DefaultLayout(
        title: 'FamilyModifierScreen',
        body: Column(
          children: [
            familyModiferState.when(
              data: (data) => Text(data.toString()),
              error: (err, stack) => Text(err.toString()),
              loading: () => CircularProgressIndicator(),
            )
          ],
        ));
  }
}
