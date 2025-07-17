import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/model/shopping_model.dart';
import 'package:flutter_study/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> notifierState =
        ref.watch(shoppingListProvider);
    return DefaultLayout(
        title: 'StateNotiferProvider',
        body: ListView(
          children: notifierState
              .map(
                (state) => CheckboxListTile(
                  title: Text(state.name),
                  value: state.hasBought,
                  onChanged: (value) {
                    //notifier을 붙이면 클라스자체에 접근이 가능해서 메서드ㄴ state 등등 클라스 요소들에 접근 가능
                    //notifer을 붙이지 않으면 read든, watch든 상태를 가져오기만한다... 그렇다면 Notifer을 안 붙인 read와 watch의 차이는 뭘까?
                    ref.read(shoppingListProvider.notifier).toggleHasBought(name: state.name);
                  },
                ),
              )
              .toList(),
        ));
  }
}
