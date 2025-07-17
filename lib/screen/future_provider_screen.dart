import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study/layout/default_layout.dart';
import 'package:flutter_study/riverpod/state_future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureState = ref.watch(multiplesFutureProvider);
    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          futureState.when(
            //로딩이 끝난 후 데이터가 있을 때
            //참고로 futureProvider는 state값이 변하지 않는 한, 기존 데이터를 캐싱해놓음.
            //그렇다면 업데이트된 데이터를 화면에 표시해주고 싶을 땐 어떻게 해야하나? 매번 재실행해야 할까?
            data: (data) {
              return Text(data.toString(),
                textAlign: TextAlign.center,);
            },
            //로딩이 끝난 후 에러가 났을 때
            error: (err, stack) => Text(err.toString(),),
            //로딩 UI
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}